package handler.station;

import java.io.UnsupportedEncodingException;

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
public class StationModifyPro implements CommandHandler {

	@Resource( name="stationDao")
	private StationDao stationDao;	
	
	@RequestMapping("/stationModifyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		StationDto dto = new StationDto();
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setSubject( request.getParameter( "subject" ) );
		dto.setContent( request.getParameter( "content" ) );
		
		int result = stationDao.updateArticle( dto );
		
		request.setAttribute("result", result);
		
		return new ModelAndView("stationModifyPro");
	}

}
