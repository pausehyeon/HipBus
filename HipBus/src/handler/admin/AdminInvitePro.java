package handler.admin;

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
import model.Setting;
import model.admin.AdminDao;
import model.general.MailService;

@Controller
public class AdminInvitePro implements CommandHandler {
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;	
	
	@RequestMapping("/adminInvitePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String serverIP = Setting.serverIP; 
		String email = request.getParameter("email");
		
		String icode = (String) request.getParameter("icode");		
		String iemail = (String) request.getParameter("iemail");
		int result = 0;
		int resultGrade =0;
		
		if(email == null){
			Map<String, String> imap = new HashMap<String,String>();
			imap.put("icode", icode);
			imap.put("iemail", iemail);
		
			//sql 확인 
			result = adminDao.validateCheck(imap);		//sql count로 체크하고
			if(result == 1 ){
				//인증과정 진행중이면 count=1 아니면 count=0 인증완료면 code=-1
				int resultEmail = adminDao.inviteCode(iemail); //맞으면 인증코드를 변경함
				if(resultEmail == 1){
				//등급도 변경
					resultGrade = adminDao.gradAdmin(iemail);
						if(resultGrade == 1){
							int driverD = adminDao.deleteDriver(iemail);
						}
				}
			}
		
		}
		
		if(iemail == null){
			int code = (int) ( Math.random() * 888889 + 111111 );
			
			//이메일로 코드와 인증을 위한 이메일주소전송
			new MailService(email, "관리자등업 인증메일입니다.", 
					"<center>"
					+ "<div id='m_-3480295820106683762container' style='max-width:600px;margin:3% 15px 0 15px'><br>"
					+ "<div id='m_-3480295820106683762box' style='background:#ffffff;border-top-left-radius:8px;border-top-right-radius:8px'>"
					+ "<div id='m_-3480295820106683762header' style='background-color:#000000;border-top-left-radius:8px;border-top-right-radius:8px;margin:0px;padding:15px;'>"
					+ "<a href='http://"+serverIP+":8080/HipBus/main.do' style='color:#ffffff; text-align: center;padding:0px;margin:0px;font-size:40px; text-decoration:none'>HipBus</a>"
					+ "</div>"
					+"<div style='padding:0px;background-color: #EAEAEA'>"
					+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>"
					+"email 님 <span style='color:#f44336'>HipBus</span>관리자 인증번호 입니다.<br>아래 버튼 클릭하시면 자동으로 인증됩니다.</p>"
					+"<center>"
					+"인증번호 : <span style='font-weight: bold'>[ "+code+" ]</span>"
					+"<a href='http://"+serverIP+":8080/HipBus/adminInvitePro.do?icode="+code+"&iemail="+email+"'style='background-color:#f44336;color:white;display:block;text-decoration:none;border-radius:3px;max-width:360px;font-size:1.3em;text-align:center;padding:20px;font-weight:normal;letter-spacing:1px;margin:15px'>관리자 인증</a>"
					+"</center>"
					+"<p style='padding:20px;line-height:1.5;text-align:left;font-size:1.0em'>인증오류시 관리자에게 재요청바랍니다.<br>- HipBus Admin</p>"
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
					+"</center>"
					+"<br>"
					+"<p style='font-size:.7em;color:#7f7f7f;padding:5px;margin:0px;text-align:center'>"
					+"kixx, Inc. 13160 Mindanao Way, Suite 200 Marina Del Rey, CA 90292 KOREA"
					+"</p>"
					+"</div>"
					+"</center>"					
				);
			//인증이메일과 코드를  db로 저장하고  
			Map<String, String> ms = new HashMap<String, String>();
			ms.put("email", email);
			ms.put("code", Integer.toString(code));
			
			int sendEmail = adminDao.updateValidate(ms);  //=1이 넘어온다
			request.setAttribute("sendemail", sendEmail);
		}
	
		request.setAttribute("resultGrade", resultGrade);

		return new ModelAndView("adminInvitePro");
	}

}
//"<a href='http://"+serverIP+":8080/HipBus/adminInvitePro.do?icode="+code+"&iemail="+email+"'>인증완료하시면 자동으로 등업됩니다.</a>"