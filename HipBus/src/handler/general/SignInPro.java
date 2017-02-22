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

		
		// id와 pw 모두 일치하고 이메일 인증 된 상태면 result == 1 id나 pw가 틀렸으면 result == 0
		result = dao.checkEmailPasswd(email, passwd);
		
		if (result == 1) {
		//id와 pw가 모두 일치하면
			if( dao.getVerificationCode(email) == -1 ){
				// 이메일 인증이 된 상태면
				// session에 로그인정보 저장
				request.getSession().setAttribute("memEmail", email);			
			}else{
				// 이메일 인증만 안 된 상태면 result == 2
				result = 2;							
			}		
		}
		request.setAttribute("result", result);

		// 돌아갈 이전 페이지 주소
		if (urlToGoBack == null) urlToGoBack = "main.do";
		request.setAttribute("urlToGoBack", urlToGoBack);

		return new ModelAndView("signInPro");
	}

}
