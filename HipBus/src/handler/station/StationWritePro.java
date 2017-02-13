package handler.station;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

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
public class StationWritePro implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		StationDto dto = new StationDto();
		dto.setNum( Integer.parseInt(request.getParameter("num")));
		dto.setEmail(request.getParameter("email"));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setNick(request.getParameter("nick"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setLikenum(Integer.parseInt(request.getParameter("likenum")));
		dto.setReg_date(new Timestamp( System.currentTimeMillis() ));
		dto.setMod_date(new Timestamp( System.currentTimeMillis() ));
		
		int result = stationDao.insertArticle( dto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView("stationWritePro");
	}

}
