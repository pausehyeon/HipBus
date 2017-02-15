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
public class StationRead implements CommandHandler{
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationRead.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String pageNum = request.getParameter( "pageNum" );
		int num = Integer.parseInt( request.getParameter( "num" ) );
		int type = Integer.parseInt(request.getParameter("type"));
		StationDto article = stationDao.getArticle(num);
		
		if( ! request.getRemoteAddr().equals( article.getNick() ) )
			stationDao.addCount( num );
		
		request.setAttribute( "num", num );
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "article", article );	
		request.setAttribute("type", type);
		
		return new ModelAndView("stationRead");
	}
}
