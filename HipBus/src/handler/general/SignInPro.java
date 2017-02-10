package handler.general;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.general.GeneralDBBean;
import model.general.GeneralDao;

@Controller
public class SignInPro implements CommandHandler {

	@Resource(name = "generalDao")
	private GeneralDao dao;

	@RequestMapping("/signInPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		String[] rememberMe = request.getParameterValues("rememberMe");
		String urlToGoBack = request.getParameter("urlToGoBack");

		int result = 0;

		// local storage에 로그인 정보 저장 javascript로 처리하기 위해서 그대로 넘겨주기.
		for (int i = 0; i < rememberMe.length; i++) {
			request.setAttribute("rememberMe", rememberMe[i]);
		}

		// id와 pw 모두 일치하는 것이 있으면 result == 1 없으면 0
		result = dao.checkEmailPasswd(email, passwd);
		request.setAttribute("result", result);

		// session에 로그인정보 저장
		if (result == 1) {
			request.getSession().setAttribute("memEmail", email);
		}

		// 돌아갈 이전 페이지 주소
		if (urlToGoBack == null) urlToGoBack = "main.do";
		request.setAttribute("urlToGoBack", urlToGoBack);

		return new ModelAndView("signInPro");
	}

}
