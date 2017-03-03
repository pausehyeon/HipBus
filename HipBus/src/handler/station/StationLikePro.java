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
import model.LikeDto;
import model.StationDto;
import model.station.StationDao;
@Controller
public class StationLikePro implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationLikePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int category = Integer.parseInt(request.getParameter("category"));
		int type = Integer.parseInt(request.getParameter("type"));
		int num = Integer.parseInt(request.getParameter("num"));
		StationDto article = stationDao.getArticle(num);
		LikeDto dto = new LikeDto();
		dto.setNum(article.getNum());
		dto.setEmail((String)request.getSession().getAttribute("memEmail"));
		
		//String email = request.getParameter("email");
		int emailresult = stationDao.getLike(dto);
		request.setAttribute( "emailresult", emailresult );
		if( emailresult == 0 ){
		stationDao.addLike(num);
		}
		int result = stationDao.likeArticle(dto);	
		request.setAttribute( "result", result );
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("category", category);
		request.setAttribute("num", num);
		request.setAttribute("type", type);
		
		
		return new ModelAndView("stationLikePro");
	}

}
