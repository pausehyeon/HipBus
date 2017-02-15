package handler.garage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.garage.GarageDao;

@Controller
public class GarageWanted implements CommandHandler{

	@Resource(name="garageDao")
	private GarageDao garageDao;
	
	@RequestMapping("/garageWanted.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException{
		
		String email =(String)request.getSession().getAttribute("memEmail");
		if( email != null){
		
		MemberDto dto = garageDao.getMember(email);
		 
		request.setAttribute("dto",dto);
		}
		
		
		
		return new ModelAndView("garageWanted");
	}
	
}
