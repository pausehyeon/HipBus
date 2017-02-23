package handler.main;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.general.MailService;
import model.main.MainDao;

@Controller
public class MainForgotPro implements CommandHandler {
	@Resource(name="mainDao") 
	public MainDao mainDao;
	
	@RequestMapping("/mainForgotPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		MemberDto dto = new MemberDto();
		String email = request.getParameter("email");		
		dto.setEmail(email);
		
		System.out.println("어디냐");
		int forgotResult = mainDao.forgotPasswd(email);
		request.setAttribute("forgotResult", forgotResult);
		System.out.println("어디냐1");
		
		int code = (int) ( Math.random() * 888889 + 111111 );
		request.setAttribute("code", code);		
		
		new MailService(dto.getEmail(), "비밀번호 분실 메일입니다.", 
				"<a href='http://localhost:8080/HipBus/mainForgotPro.do?code="+code+"&email="+email+"'>클릭하시면 ["+code+"] 임시비밀번호로 수정 완료 됩니다.\n로그인 후 비밀번호를 변경해주세요.</a>");
		System.out.println("어디냐2");
		
		Map<String, String> ms = new HashMap<String, String>();
		ms.put("email", dto.getEmail() );
		ms.put("passwd", Integer.toString(code));
		System.out.println("어디냐3");
		
		int forgotPasswdUpdate = mainDao.forgotPasswdUpdate(ms);
		request.setAttribute("forgotPasswdUpdate", forgotPasswdUpdate);
		System.out.println("어디냐4");
		
		return new ModelAndView("mainForgotPro");
	}

}
