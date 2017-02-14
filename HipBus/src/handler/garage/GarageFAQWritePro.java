package handler.garage;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.FAQDto;
import model.MemberDto;
import model.garage.GarageDao;

@Controller
public class GarageFAQWritePro implements CommandHandler {
	
	@Resource(name="garageDao")
	private GarageDao garageDao;

	@RequestMapping("/garageFAQWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String email =(String)request.getSession().getAttribute("memEmail");
		
		MemberDto dto = garageDao.getMember(email); 
		
		request.setAttribute("dto",dto);
		
		FAQDto article = new FAQDto();
		article.setEmail(dto.getEmail());
		article.setNick(dto.getNick());
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		int result = garageDao.insertFAQ(article);
		request.setAttribute( "result", result );
		
		
		
		return new ModelAndView("garageFAQWritePro");
	}

}
