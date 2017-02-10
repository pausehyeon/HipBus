package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import handler.CommandHandler;
import handler.HandlerException;
import model.admin.AdminDao;

@Controller
public class Admin implements CommandHandler {

	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;

	
	@RequestMapping("/admin.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
		int memberGrade = adminDao.reportMember();		//멤버 전체의 수
		int adminGrade = adminDao.reportGrade();		//3등급관리지의 총수
		
		int numberOfCrew = adminDao.reportCrew();
		int numberOfPost = adminDao.reportPost();
		int numberOfMember = memberGrade - adminGrade ;	//빼는 순서 중요 지금순서 바꾸지 마
		
		
		request.setAttribute( "numberOfMember", numberOfMember );
		request.setAttribute("numberOfCrew", numberOfCrew);
		request.setAttribute("numberOfPost", numberOfPost);
		
		return new ModelAndView("admin");
	}

}
