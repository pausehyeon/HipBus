package handler.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.admin.AdminDao;
import model.general.GeneralDao;

@Controller
public class Admin implements CommandHandler {

	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@Autowired(required=false)
	@Resource(name="generalDao")
	public GeneralDao generalDao;

	
	@RequestMapping("/admin.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		//관리자 닉네임 가져오기
		String memEmail = (String) request.getSession().getAttribute("memEmail");
		MemberDto member = generalDao.getMember(memEmail);
		request.setAttribute("member", member);
		
		
		//관리자 현황
		int memberGrade = adminDao.reportMember();		//멤버 전체의 수
		int adminGrade = adminDao.reportGrade();		//3등급관리지의 총수
		
		int numberOfCrew = adminDao.reportCrew();
		int numberOfPost = adminDao.reportPost();
		int numberOfMember = memberGrade - adminGrade ;	//빼는 순서 중요 지금순서 바꾸지 마
		
		request.setAttribute( "numberOfMember", numberOfMember );
		request.setAttribute("numberOfCrew", numberOfCrew);
		request.setAttribute("numberOfPost", numberOfPost);
		
		//순서 바꾸지 마시오 페이지 count에 값을 넣기 위함임
		String keyword = request.getParameter("keyword"); 
		String category = request.getParameter("category");		//고정으로 넘어오는 값이므로 불린값으로 잡을 수 없다!!
	
		int count = 0;			//전체글 회원수
		/*count = memberGrade - adminGrade;*/		//멤버의 전체수를 가져옴!! 페이지수의 기초
		if(keyword != null){
			Map<String,String> nmap = new HashMap<String, String>();
			nmap.put("keyword", keyword);
			nmap.put("category", category);
			int num = adminDao.searchNum(nmap);
			count = num; 		//검색했을 때의 페이지 넘기는 전체글의 수를 count
		}else{
			count = memberGrade - adminGrade;
		}
		
		//회원목록
		int pageSize = 5;		//한번에 보이는 갯수
		int pageBlock = 3;		//보여지는 페이지 수
	
		String pageNum = null;		//보고자 하는 페이지의 글
		int pageNow = 0;			//현재 페이지 
		int pageStart = 0;			//현재 페이지 시작번호
		int pageEnd = 0;			//현재 페이지 끝번호
		int number = 0;				//출력 글번호 계산
		
		int pageCount = 0;			//페이지 총개수
		int startPage = 0;			//보여줄 페이지에서의 시작번호
		int endPage = 0;			//보여주는 페이지
		
		
		pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		pageNow = Integer.parseInt(pageNum);
		pageCount = count/pageSize + (count % pageSize > 0 ? 1 : 0 );
		if(pageNow > pageCount){ pageNow = pageCount;}
		
		pageStart = (pageNow - 1) * pageSize + 1;
		pageEnd = pageStart + pageSize - 1;
		if(pageEnd > count){ pageEnd = count; }
		
		number = count - (pageNow - 1) * pageSize;
		
		if(count > 0){
			startPage = (pageNow / pageBlock) * pageBlock + 1;
			if(pageNow % pageBlock == 0){
				startPage -= pageBlock;
			}
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
		}
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		
		//멤버목록전체와 조인된 크루아이디 불러와 list로 담음
		if(count != 0){
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("pageStart", pageStart);
			map.put("pageEnd", pageEnd);
			
			request.setAttribute("pageStart", pageStart);
			request.setAttribute("pageEnd", pageEnd);
			
			List<MemberDto> list = adminDao.getMemberLists(map);		
			request.setAttribute("list", list);
			request.setAttribute("number", number);
			
			request.setAttribute("pageNow", pageNow);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
			
		}
		
		//검색 키워드로 넘어올 string
		if(keyword != null){		//유동하는 값으로 null이 넘어오지 않도록 논리값으로 조건을 달아 주어야  함
			Map<String ,Object> smap = new HashMap<String, Object>();
			smap.put("keyword", keyword);
			smap.put("category", category);
			smap.put("pageStart", pageStart);
			smap.put("pageEnd", pageEnd);
		
			List<MemberDto> slist = adminDao.getSearch(smap);
			request.setAttribute("slist", slist);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return new ModelAndView("admin");
	}

}
