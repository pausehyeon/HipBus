package handler.mybus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MyBusWantedWrite implements CommandHandler {

	@RequestMapping("/myBusWantedWrite.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		request.setAttribute("driver", request.getParameter("driver") );
		
		return new ModelAndView("myBusWantedWrite");
	}

}
