package handler.crewbus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class CrewBusEjectPro implements CommandHandler {
	@RequestMapping("/crewBusEjectPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		return new ModelAndView("crewBusEjectPro");
	}

}
