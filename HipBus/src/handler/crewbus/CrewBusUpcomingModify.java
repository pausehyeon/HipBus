package handler.crewbus;

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
public class CrewBusUpcomingModify implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/crewBusUpcomingModify.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		int num = Integer.parseInt(request.getParameter("num"));
		
		UpcomingDto upcomingDto = mybusDao.getUpcoming(num);

		request.setAttribute("num", num);
		request.setAttribute("upcomingDto", upcomingDto);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusUpcomingModify");
	}

}
