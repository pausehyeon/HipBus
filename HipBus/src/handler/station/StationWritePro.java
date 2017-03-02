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
import model.MemberDto;
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
		int resultCount = 0;
		
		String email = request.getParameter("email");
		
		MemberDto article = stationDao.getMember(email);
		
		int count = stationDao.countMem(email);
		if( count == 9){
			resultCount = stationDao.addMem(email);
			request.setAttribute("resultCount", resultCount);
		}
		StationDto dto = new StationDto();
		dto.setEmail((String)request.getSession().getAttribute("memEmail"));
		dto.setCategory(Integer.parseInt(request.getParameter("category")));
		dto.setNick(article.getNick());
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setReg_date(new Timestamp( System.currentTimeMillis() ));
		
		int result = stationDao.insertArticle( dto );
		request.setAttribute("article", article);
		request.setAttribute( "result", result );
		request.setAttribute("resultCount",resultCount);
		return new ModelAndView("stationWritePro");
	}

}
