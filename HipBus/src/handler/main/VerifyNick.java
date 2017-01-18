package handler.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.main.MainDao;

@Controller
public class VerifyNick implements CommandHandler {

	@Resource(name="mainDao")
	private MainDao mainDao;
	
	@RequestMapping("/verifyNick.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int result = mainDao.verifyNick(request.getParameter("nick"));
		request.setAttribute("result", result);
		return new ModelAndView("verifyNick");
	}

}
