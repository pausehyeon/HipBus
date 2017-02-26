package handler.crewbus;

import java.util.ArrayList;
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
import model.CrewMemberDto;
import model.StationDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;
@Controller
public class CrewBusOurArticles implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusOurArticles.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
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
		
		List<CrewMemberDto> memberList = crewbusDao.getCrewmembers(driver);
		List<String> mem_email = new ArrayList<String>();
		for(int i=0;i<memberList.size();i++){
			mem_email.add( memberList.get(i).getEmail() );
		}
		count = crewbusDao.getArticleCount(mem_email);
		
		int type = 1; 
		if(request.getParameter("type") != null){
			type = Integer.parseInt(request.getParameter("type"));
		}
		// 카테고리
		
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
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("start", start+"");
			map.put("end", end+"");
			map.put("crewid", driver);
			
			List <StationDto> station = crewbusDao.getArticles(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute( "pageNum", pageNum );
		}
		
		String crewname = crewbusDao.getCrewInfo(driver).getCrewname();
		
		request.setAttribute("crewname", crewname);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusOurArticles");
	}

}
