package handler.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.general.MailService;

@Controller
public class MainContactUsPro implements CommandHandler {

	@RequestMapping("/mainContactUsPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		new MailService(email, "[Hipbus] " + name + "으로부터 이메일 문의: " + subject, content);
		return new ModelAndView("mainContactUsPro");
	}

}
