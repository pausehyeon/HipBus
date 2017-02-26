package handler.crewbus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.UpcomingDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusUpcoming implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusUpcoming.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		boolean isMember = false;
		
		List<UpcomingDto> upcomings = mybusDao.getUpcomings(driver);
		List<UpcomingDto> pastUpcomings = mybusDao.getPastUpcomings(driver);
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("crewid", driver);
		map.put("email",(String)request.getSession().getAttribute("memEmail"));
		if(crewbusDao.isMember(map)==1) isMember = true;
		
		request.setAttribute("isMember", isMember);
		request.setAttribute("upcomings", upcomings);
		request.setAttribute("pastUpcomings", pastUpcomings);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusUpcoming");
	}

}
