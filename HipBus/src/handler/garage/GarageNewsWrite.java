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
public class GarageNewsWrite implements CommandHandler{

	@Resource(name="garageDao")
	private GarageDao garageDao;
	
	@RequestMapping("/garageNewsWrite.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		int num = 0;
		
	
		request.setAttribute("num",num);
		
		String email = request.getParameter("email");
		
		
		MemberDto dto = garageDao.getMember(email); //nick값 불러오기위한 메소드
		 
		request.setAttribute("dto",dto);
			
	
		
		
		
		
		
		
		
		return new ModelAndView("garageNewsWrite");
	}	
}
