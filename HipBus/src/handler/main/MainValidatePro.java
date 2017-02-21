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
		

		String email= request.getParameter("email");
		String code = request.getParameter("code");
				
		Map<String, String> emailCheck = new HashMap<String, String>();
		emailCheck.put("email", email);
		emailCheck.put("code", code);	
		
		int resultMail = mainDao.emailCheck( emailCheck );
		request.setAttribute("resultMail", resultMail);
		
		if (resultMail == 1) {
			resultMail = mainDao.codeUpdate( email );						
		} else {
			//방어코드
		}
		
		
		
		
		return new ModelAndView("mainValidatePro");
	}
}