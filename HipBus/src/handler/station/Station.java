package handler.station;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class Station implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/station.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int pageSize = 6;			// 한페이지에 출력할 글 개수
		int pageBlock = 5;			// 한 번에 보여줄 페이지 개수
		int count = 0;
		
		String pageNum = null;
		int currentPage = 0;		// 현재 페이지 
		int start = 0;				// 현재 페이지 시작 번호
		int end = 0;				// 현재 페이지 끝 번호
		int number = 0;				// 출력용 글번호 계산
		
		int pageCount = 0;			// 페이지 개수
		int startPage = 0;			// 보여줄 페이지의 시작 번호
		int endPage = 0;			// 보여줄 페이지의 끝 번호
		
		count = stationDao.getCount();
		
		int type = 1; 
		if(request.getParameter("type") != null){
			type = Integer.parseInt(request.getParameter("type"));
		}
		// 카테고리
		
			int category1 = stationDao.category(1);
			request.setAttribute("category1", category1);
			int category2 = stationDao.category(2);
			request.setAttribute("category2", category2);
			int category3 = stationDao.category(3);
			request.setAttribute("category3", category3);
			int category4 = stationDao.category(4);
			request.setAttribute("category4", category4);
			int category5 = stationDao.category(5);
			request.setAttribute("category5", category5);
			int category6 = stationDao.category(6);
			request.setAttribute("category6", category6);
		
		request.setAttribute("type", type);
		
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null || pageNum.equals( "" ) ) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt( pageNum );
		pageCount = count / pageSize + ( count % pageSize > 0 ? 1 : 0 );
		if( currentPage > pageCount ) currentPage = pageCount; 
		
		start = ( currentPage -1 ) * pageSize + 1;	// ( 5 - 1 ) * 10 + 1	41
		end = start + pageSize - 1;					// 41 + 10 - 1			50
		if( end > count ) end = count;
		
		number = count - ( currentPage -1 ) * pageSize;	// 50 - ( 2-1 ) * 10
		
		if( count > 0 ) {		
			startPage = ( currentPage / pageBlock ) * pageBlock + 1; 	
						// ( 15 / 10 ) * 10 + 1		11	
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock;			
			endPage = startPage + pageBlock - 1;
						// 11 + 10 -1 				20
			if( endPage > pageCount ) endPage = pageCount;
		}
		
		request.setAttribute("count", count);
		request.setAttribute("pagenum", pageNum);
		/*
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("category3", category3);
		request.setAttribute("category4", category4);
		request.setAttribute("category5", category5);
		request.setAttribute("category6", category6);
		*/
		
		if( count != 0 ) {
			// 글이 있는 경우
			
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);
			
		}
		return new ModelAndView("station");
	}

}
