package handler.garage;

import java.util.List;
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
public class GarageFAQ implements CommandHandler{
	@Resource(name="garageDao")
	private GarageDao garageDao;

	@RequestMapping("/garageFAQ")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{
		
		
	
		
			List <FAQDto> FAQList = garageDao.getFAQList();
			request.setAttribute( "FAQList", FAQList);
			
		
		
		String email =(String)request.getSession().getAttribute("memEmail");
		if( email != null){
		
		MemberDto dto = garageDao.getMember(email);
		 
		request.setAttribute("dto",dto);
		}
		
		return new ModelAndView("garageFAQ");
	}
	
}
