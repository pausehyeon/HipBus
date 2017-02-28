package handler.general;

import java.util.List;

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
public class ReplyAlertResult implements CommandHandler{
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	@RequestMapping("/replyAlertResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String email = request.getParameter("email");			
		List< StationDto > article = stationDao.replyAlrams(email);
		int count = stationDao.getAlrams(email);
		request.setAttribute("count", count);
		request.setAttribute("email", email);				
		request.setAttribute("article", article);
		
		return new ModelAndView("replyAlertResult");
	}
}
