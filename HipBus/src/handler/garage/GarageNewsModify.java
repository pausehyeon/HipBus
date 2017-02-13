package handler.garage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.NewsDto;
import model.garage.GarageDao;

@Controller
public class GarageNewsModify implements CommandHandler {
	@Resource(name="garageDao")
	private GarageDao garageDao;
	
	@RequestMapping("/garageNewsModify.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		int num = Integer.parseInt( request.getParameter( "num" ) );
		
		
		NewsDto article = garageDao.getArticle(num);
		
		request.setAttribute("article",article);
		
		
		
		return new ModelAndView("garageNewsModify");
	}

}
