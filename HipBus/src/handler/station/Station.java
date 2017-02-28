package handler.station;

import java.io.UnsupportedEncodingException;
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
import model.MemberDto;
import model.StationDto;
import model.garage.GarageDao;
import model.station.StationDao;

@Controller
public class Station implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@Resource( name="garageDao")
	private GarageDao garageDao;
	
	@RequestMapping("/station.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int pageSize = 10;			// 한페이지에 출력할 글 개수
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
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 검색
		String keyword = request.getParameter("keyword"); 
		String search = request.getParameter("search");
		
		
		int type = 1; 
		if(request.getParameter("type") != null){
			type = Integer.parseInt(request.getParameter("type"));
		}
		// 카테고리
		
		request.setAttribute("type", type);
			if(type == 1){
				count = stationDao.getCount();
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
					keyword = request.getParameter("keyword");
				}
			}
			if(type == 2){
				count = stationDao.category(1);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum1(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
			if(type == 3){
				count = stationDao.category(2);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum2(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
			if(type == 4){
				count = stationDao.category(3);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum3(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
			if(type == 5){
				count = stationDao.category(4);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum4(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
			if(type == 6){
				count = stationDao.category(5);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum5(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
			if(type == 7){
				count = stationDao.category(6);
				if(keyword != null){
					Map<String,String> nmap = new HashMap<String, String>();
					nmap.put("keyword", keyword);
					nmap.put("search", search);
					int num = stationDao.searchNum6(nmap);
					count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count	
				}
			}
		
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
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null || pageNum.equals( "" ) ) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt( pageNum );
		pageCount = count / pageSize + ( count % pageSize > 0 ? 1 : 0 );
		if( currentPage > pageCount ) currentPage = pageCount; 
		
		start = ( currentPage -1 ) * pageSize + 1;	// ( 5 - 1 ) * 10 + 1	41
		end = start + pageSize - 1;					// 41 + 10 - 1			50
		if( end > count ){end =count; }
		
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
		request.setAttribute("pageNum", pageNum);
		/*
		request.setAttribute("category1", category1);
		request.setAttribute("category2", category2);
		request.setAttribute("category3", category3);
		request.setAttribute("category4", category4);
		request.setAttribute("category5", category5);
		request.setAttribute("category6", category6);
		*/
		
		if( count != 0 ) {
			request.setAttribute("start", start);
			request.setAttribute("end", end);
			// 글이 있는 경우
			if( type == 1){
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
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			}
			else if( type == 2){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			List <StationDto> station = stationDao.getArticles1(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);	
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch1(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			
			} else if( type == 3){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles2(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);
			
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch2(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			} else if( type == 4){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles3(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);
			
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch3(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			} else if( type == 5){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles4(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);	
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch4(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			} else if( type == 6){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles5(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);	
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch5(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			} else if( type == 7){
				Map<String, Integer> map 
				= new HashMap<String, Integer>();
			map.put( "start", start );
			map.put( "end", end );
			
			List <StationDto> station = stationDao.getArticles6(map);
			request.setAttribute( "station", station );
			request.setAttribute( "number", number );
			request.setAttribute( "currentPage", currentPage );
			request.setAttribute( "pageBlock", pageBlock );
			request.setAttribute( "startPage", startPage );
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute("pageNum", pageNum);	
			if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("keyword", keyword);
				smap.put("search", search);
				smap.put("start", start);
				smap.put("end", end);
				
				List<StationDto> slist = stationDao.getSearch6(smap);
				
				request.setAttribute("station", slist);
				request.setAttribute( "number", number );
				request.setAttribute( "currentPage", currentPage );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
				request.setAttribute("pageNum", pageNum);	
			}
			}	
		}
		
		String ad1_imglocation = garageDao.getAd(1);
		String ad2_imglocation = garageDao.getAd(2);
		String ad3_imglocation = garageDao.getAd(3);
		
		request.setAttribute("ad1_imglocation", ad1_imglocation);
		request.setAttribute("ad2_imglocation", ad2_imglocation);
		request.setAttribute("ad3_imglocation", ad3_imglocation);
		return new ModelAndView("station");
	}

}
