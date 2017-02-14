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

@Controller
public class Admin implements CommandHandler {

	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;

	
	@RequestMapping("/admin.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//관리자 현황
		int memberGrade = adminDao.reportMember();		//멤버 전체의 수
		int adminGrade = adminDao.reportGrade();		//3등급관리지의 총수
		
		int numberOfCrew = adminDao.reportCrew();
		int numberOfPost = adminDao.reportPost();
		int numberOfMember = memberGrade - adminGrade ;	//빼는 순서 중요 지금순서 바꾸지 마
		
		request.setAttribute( "numberOfMember", numberOfMember );
		request.setAttribute("numberOfCrew", numberOfCrew);
		request.setAttribute("numberOfPost", numberOfPost);
		
		
		int count = 0;			//전체글 회원수
		
		//검색
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		if(category != null){
			Map<String,String> smap = new HashMap<String, String>();
			smap.put("keyword", keyword);
			smap.put("category", category);
		
			List<MemberDto> slist = adminDao.getSearch(smap);
			request.setAttribute("slist", slist);
			
			int num = adminDao.searchNum(smap);
				count = num;
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return new ModelAndView("admin");
	}

}
