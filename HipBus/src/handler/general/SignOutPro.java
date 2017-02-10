package handler.general;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class SignOutPro implements CommandHandler {

	@RequestMapping("/signOutPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String urlToGoBack = request.getParameter("urlToGoBack");
		if(urlToGoBack == null) urlToGoBack="main.do";
		//돌아갈 url
		request.setAttribute("urlToGoBack", urlToGoBack);
		//세션에서 로그인 정보 지우기
		request.getSession().removeAttribute("memEmail");
		
		return new ModelAndView("signOutPro");
	}

}
