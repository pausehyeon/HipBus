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
import model.Setting;
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
		
		String serverIP = Setting.serverIP;
		String email = request.getParameter("email");		
		int forgotResult = mainDao.forgotPasswd(email);
		request.setAttribute("forgotResult", forgotResult);
			
		
		if ( forgotResult == 1 ) {
			
			
			int code = (int) ( Math.random() * 888889 + 111111 );
			request.setAttribute("code", code);		
			
			new MailService(email, "비밀번호 분실 메일입니다.", 
				"<center>"
				+ "<div id='m_-3480295820106683762container' style='max-width:600px;margin:3% 15px 0 15px'><br>"
				+ "<div id='m_-3480295820106683762box' style='background:#ffffff;border-top-left-radius:8px;border-top-right-radius:8px'>"
				+ "<div id='m_-3480295820106683762header' style='background-color:#000000;border-top-left-radius:8px;border-top-right-radius:8px;margin:0px;padding:15px;'>"
				+ "<a href='http://"+serverIP+":8080/HipBus/main.do' style='color:#ffffff; text-align: center;padding:0px;margin:0px;font-size:40px; text-decoration:none'>HipBus</a>"
				+ "</div>"
				+"<div style='padding:0px;background-color: #EAEAEA'>"
				+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>"
				+email+"님 <span style='color:#f44336'>HipBus</span>에서  임시 비밀번호를 발행해 드리오니<br>아래 버튼 클릭하시면 자동으로 변경됩니다.</p>"
				+"<center>"
				+"임시 비밀번호 : <span style='font-weight: bold'>[ "+code+" ]</span>"
				+"<a href='http://"+serverIP+":8080/HipBus/mainForgotPro.do?code="+code+"&email="+email+"'style='background-color:#f44336;color:white;display:block;text-decoration:none;border-radius:3px;max-width:360px;font-size:1.3em;text-align:center;padding:20px;font-weight:normal;letter-spacing:1px;margin:15px'>임시 비밀번호 발급</a>"
				+"</center>"
				+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>위 임시 비밀번호로 로그인후 MyBus-edit profile을 이용하여 비밀번호를 변경해주세요<br>- HipBus</p>"
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
				+"<a href='http://"+serverIP+":8080/HipBus/myBus.do?driver="+email+"' style='font-size:0.85em;padding:0 10px;color:#8b959c'>MyBus.Go</a>"
				+"<a href='http://"+serverIP+":8080/HipBus/garageFAQ.do' style='font-size:0.85em;padding:0 10px;color:#8b959c'>FAQ</a>"
				+"</center>"
				+"<br>"
				+"<p style='font-size:.7em;color:#7f7f7f;padding:5px;margin:0px;text-align:center'>"
				+"kixx, Inc. 13160 Mindanao Way, Suite 200 Marina Del Rey, CA 90292 KOREA"
				+"</p>"
				+"</div>"
				+"</center>"
					);
		
		}
			
		if (request.getParameter("code") != null) {

			Map<String, String> ms = new HashMap<String, String>();
			ms.put("email", email);
			ms.put("passwd", request.getParameter("code"));
			int forgotPasswdUpdate = mainDao.forgotPasswdUpdate(ms);
			request.setAttribute("forgotPasswdUpdate", forgotPasswdUpdate);

		}

		
		return new ModelAndView("mainForgotPro");
	}

}
//"<a href='http://"+serverIP+":8080/HipBus/mainForgotPro.do?code="+code+"&email="+email+"'>클릭하시면 ["+code+"] 임시비밀번호로 수정 완료 됩니다.\n로그인 후 비밀번호를 변경해주세요.</a>"