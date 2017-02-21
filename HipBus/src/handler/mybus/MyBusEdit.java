package handler.mybus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MyBusEdit implements CommandHandler{
	
	@RequestMapping("/myBusEdit.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		String driver = request.getParameter("driver");		
		request.setAttribute("driver", driver);
		
		return new ModelAndView("myBusEdit");
	}
}
