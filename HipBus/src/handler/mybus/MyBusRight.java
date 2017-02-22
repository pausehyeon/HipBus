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
import model.WantedDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusRight implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/myBusRight.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = (String) request.getSession().getAttribute("memEmail");
		
		UpcomingDto upcomingDto = mybusDao.getNewUpcoming(driver);
		if(upcomingDto!=null){
			upcomingDto.setImglocation(upcomingDto.getImglocation());
			request.setAttribute("upcomingDto", upcomingDto);
		}
		WantedDto wantedDto = mybusDao.getNewWanted(driver);
		if(wantedDto!=null){
			wantedDto.setImglocation(wantedDto.getImglocation());
			request.setAttribute("wantedDto", wantedDto);
		}
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		return new ModelAndView("myBusRight");
	}

}
