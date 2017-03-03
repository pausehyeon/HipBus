package handler.main;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.general.MailService;
import model.main.MainDao;

@Controller
public class MainSignUpPro implements CommandHandler {
	
	@Autowired(required=false)
	@Resource(name="mainDao") 
	public MainDao mainDao;

	@RequestMapping("/mainSignUpPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String localhost = "192.168.20.57"; 
		MemberDto dto = new MemberDto();
		String email = request.getParameter("email");
		dto.setEmail( email );
		dto.setNick(request.getParameter("nick"));
		dto.setPasswd( request.getParameter("passwd"));
		dto.setJoindate(new Timestamp( System.currentTimeMillis() ));		
		
		int result = mainDao.insertMember( dto );	
		request.setAttribute("result", result);
						
		int resultDriver = mainDao.insertDriver( email );		
		request.setAttribute("resultDriver", resultDriver);
		
		//여기다메일
		
		
		int code = (int) ( Math.random() * 888889 + 111111 );
		request.setAttribute("code", code);		
		
		new MailService(dto.getEmail(), "회원가입 인증메일입니다.", 
				"<a href='http://"+localhost+":8080/HipBus/mainValidatePro.do?code="+code+"&email="+email+"'>클릭하면 가입 완료 됩니다.</a>");
				
		
		Map<String, String> ms = new HashMap<String, String>();
		ms.put("email", dto.getEmail() );
		ms.put("code", Integer.toString(code));	
		
		int resultMail = mainDao.emailValidate( ms );
		request.setAttribute("resultMail", resultMail);			
		
		return new ModelAndView("mainSignUpPro");	
		
	}

}
















