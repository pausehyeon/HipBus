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
import model.Setting;
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
		
		String serverIP = Setting.serverIP;
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
			"<center>"
			+ "<div id='m_-3480295820106683762container' style='max-width:600px;margin:3% 15px 0 15px'><br>"
			+ "<div id='m_-3480295820106683762box' style='background:#ffffff;border-top-left-radius:8px;border-top-right-radius:8px'>"
			+ "<div id='m_-3480295820106683762header' style='background-color:#000000;border-top-left-radius:8px;border-top-right-radius:8px;margin:0px;padding:15px;'>"
			+ "<a href='http://"+serverIP+":8080/HipBus/main.do' style='color:#ffffff; text-align: center;padding:0px;margin:0px;font-size:40px; text-decoration:none'>HipBus</a>"
			+ "</div>"
			+"<div style='padding:0px;background-color: #EAEAEA'>"
			+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>"
			+email+"님 저희 <span style='color:#f44336'>HipBus</span>가입하신 것을  환영합니다.<br>아래 버튼 클릭하시면 자동으로 인증됩니다.</p>"
			+"<center>"
			+"인증번호 : <span style='font-weight: bold'>[ "+code+" ]</span>"
			+"<a href='http://localhost:8080/HipBus/mainValidatePro.do?code="+code+"&email="+email+"'style='background-color:#f44336;color:white;display:block;text-decoration:none;border-radius:3px;max-width:360px;font-size:1.3em;text-align:center;padding:20px;font-weight:normal;letter-spacing:1px;margin:15px'>이메일 인증</a>"
			+"</center>"
			+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>감사합니다!<br>- HipBus</p>"
			+"<p style='font-size:.9em;color:#8b939a;padding:5px;margin:0px'>오발송된 메일일 경우 인증오류가 발생할수 있으니 버튼클릭하지 마시고"
			+"<br>아래 HipBus.me를 클릭하여 자세한 사항을 확인해주세요.</p>"
			+"<br>"
			+"</div>" 
			+"<div id='m_-3480295820106683762footer' style='width:100%;padding:10px'>"
			+"<center>"
			+"<br>"
			+"<p style='font-size:.9em;color:#8b939a;padding:5px;margin:0px'>"
			+"<span style='color:#f44336;font-weight:normal'>HipBus</span> powered by kixx"
			+"</p>"
			+"</center>"
			+"</div>"
			+"</div>"  
			+"<center>"
			+"<br>"
			+"<a href='http://"+serverIP+":8080/HipBus/main.do' style='font-size:0.85em;padding:0 10px;color:#8b959c'>HipBus.me</a>"
			+"<a href='http://"+serverIP+":8080/HipBus/main.do#contact' style='font-size:0.85em;padding:0 10px;color:#8b959c'>Help</a>"
			+"<a href='http://"+serverIP+":8080/HipBus/garage.do' style='font-size:0.85em;padding:0 10px;color:#8b959c'>News</a>"
			+"<a href='http://"+serverIP+":8080/HipBus/garageFAQ.do' style='font-size:0.85em;padding:0 10px;color:#8b959c'>FAQ</a>"
			+"</center>"
			+"<br>"
			+"<p style='font-size:.7em;color:#7f7f7f;padding:5px;margin:0px;text-align:center'>"
			+"kixx, Inc. 13160 Mindanao Way, Suite 200 Marina Del Rey, CA 90292 KOREA"
			+"</p>"
			+"</div>"
			+"</center>"
	);
				
		
		Map<String, String> ms = new HashMap<String, String>();
		ms.put("email", dto.getEmail() );
		ms.put("code", Integer.toString(code));	
		
		int resultMail = mainDao.emailValidate( ms );
		request.setAttribute("resultMail", resultMail);			
		
		return new ModelAndView("mainSignUpPro");	
		
	}

}
//+ "<a href='http://"+serverIP+":8080/HipBus/mainValidatePro.do?code="+code+"&email="+email+"'>클릭하면 가입 완료 됩니다.</a>"

