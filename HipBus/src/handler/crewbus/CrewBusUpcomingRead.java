package handler.crewbus;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.UpcomingDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusUpcomingRead implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusUpcomingRead.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		int num = Integer.parseInt(request.getParameter("num"));
		boolean isMember = false;
		
		if((String)request.getSession().getAttribute("memEmail")!=null){
			Map<String, String> map = new HashMap<String,String>();
			map.put("crewid", driver);
			map.put("email",(String)request.getSession().getAttribute("memEmail"));
			if(crewbusDao.isMember(map)==1) isMember = true;
		}
		
		
		UpcomingDto upcomingDto = mybusDao.getUpcoming(num);
		mybusDao.readUpcoming(num);
		
		request.setAttribute("isMember", isMember);
		request.setAttribute("upcomingDto", upcomingDto);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusUpcomingRead");
	}

}
