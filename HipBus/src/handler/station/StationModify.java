package handler.station;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.StationDto;
import model.station.StationDao;

@Controller
public class StationModify implements CommandHandler {

	@Resource( name="stationDao")
	private StationDao stationDao;	
	
	@RequestMapping("/stationModify.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		StationDto article = stationDao.getArticle(num);
		
		request.setAttribute("article", article);
		
		return new ModelAndView("stationModify");
	}

}
