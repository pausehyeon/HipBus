package handler.mybus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MyBusRight implements CommandHandler {

	@RequestMapping("/myBusRight.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = (String) request.getSession().getAttribute("memEmail");
		
		
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		return new ModelAndView("myBusRight");
	}

}
