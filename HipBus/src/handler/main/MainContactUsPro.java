package handler.main;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.admin.AdminDao;
import model.general.MailService;

@Controller
public class MainContactUsPro implements CommandHandler {

	@Resource(name="adminDao")
	private AdminDao dao;
	
	@RequestMapping("/mainContactUsPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<String> managers = dao.getManagers();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		for(int i=0; i<managers.size(); i++){
			new MailService(managers.get(i), "[Hipbus] " + name + "(으)로부터 이메일 문의: " + subject , "문의 내용 : "+ content +"<br>답변할 메일 주소 : " + email);
		}
		
		return new ModelAndView("mainContactUsPro");
	}

}
