package handler.main;

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
import model.main.MainDao;

@Controller
public class MainValidatePro implements CommandHandler{
	
	@Autowired(required=false)
	@Resource(name="mainDao") 
	public MainDao mainDao;
	
	
	@RequestMapping("/mainValidatePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		/*
		MemberDto dto = new MemberDto();
				
		String email= request.getParameter("email");
		request.setAttribute("email", email);		
		
		String code = request.getParameter("code");
		request.setAttribute("code", code);		
		
		Map<String, String> ms = new HashMap<String, String>();
		ms.put("email", dto.getEmail() );
		ms.put("code", code);	
		
		int resultMail = mainDao.emailValidate( ms );
		request.setAttribute("resultMail", resultMail);	*/
		
		
		return new ModelAndView("mainValidatePro");
	}
}