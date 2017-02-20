package handler.mybus;

import java.util.List;

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
public class MyBusUpcoming implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/myBusUpcoming")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		
		List<UpcomingDto> upcomings = mybusDao.getUpcomings();
		
		
		
		request.setAttribute("upcomings", upcomings);
		request.setAttribute("driver", driver);
		return new ModelAndView("myBusUpcoming");
	}

}
