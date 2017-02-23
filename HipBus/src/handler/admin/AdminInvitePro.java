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
					"<a href='http://localhost:8080/HipBus/adminInvitePro.do?icode="+code+"&iemail="+email+"'>인증완료하시면 자동으로 등업됩니다.</a>");
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