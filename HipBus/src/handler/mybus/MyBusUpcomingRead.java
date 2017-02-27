package handler.mybus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.UpcomingDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusUpcomingRead implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/myBusUpcomingRead.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		int num = Integer.parseInt(request.getParameter("num"));
		int mem_level = 0;
		UpcomingDto upcomingDto = mybusDao.getUpcoming(num);
		mybusDao.readUpcoming(num);
		
		if((String)request.getSession().getAttribute("memEmail")!=null){
			mem_level = mybusDao.getMember((String)request.getSession().getAttribute("memEmail")).getMem_level();
		}
		request.setAttribute("mem_level", mem_level);
		
		request.setAttribute("upcomingDto", upcomingDto);
		request.setAttribute("driver", driver);
		return new ModelAndView("myBusUpcomingRead");
	}

}
