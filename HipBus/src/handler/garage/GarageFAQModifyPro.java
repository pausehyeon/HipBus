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
import model.NewsDto;
import model.garage.GarageDao;

@Controller
public class GarageFAQModifyPro implements CommandHandler {
	@Resource(name="garageDao")
	private GarageDao garageDao;


	@RequestMapping("/garageFAQModifyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		

		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
	
		FAQDto dto = new FAQDto();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		
		
		int result = garageDao.updateFAQArticle( dto );
		
		request.setAttribute("result", result);
		
		
		
		return new ModelAndView("garageFAQModifyPro");
	}

}
