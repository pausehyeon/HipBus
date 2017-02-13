package handler.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.main.MainDao;

@Controller
public class Main implements CommandHandler{
	
	@Resource(name="mainDao")
	private MainDao dao;
	
	@RequestMapping("/main.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String memEmail = (String) request.getSession().getAttribute("memEmail");
		
		if(memEmail != null){
			MemberDto member = dao.getMember(memEmail);
			request.setAttribute("member", member );			
		}
				
		return new ModelAndView("main");
	}
}
