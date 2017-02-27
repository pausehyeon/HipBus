package handler.crewbus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.mybus.MyBusDao;

@Controller
public class CrewBusUpcomingDeletePro implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/crewBusUpcomingDeletePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = mybusDao.delUpcoming(num);
		
		request.setAttribute("num", num);
		request.setAttribute("driver", driver);
		request.setAttribute("result", result);
		return new ModelAndView("crewBusUpcomingDeletePro");
	}

}
