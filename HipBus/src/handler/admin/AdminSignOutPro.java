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
public class AdminSignOutPro implements CommandHandler{
	
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@RequestMapping("/adminSignOutPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String email = (String) request.getSession().getAttribute("memEmail");
				
		int result = adminDao.deleteMember(email);
		if(result != 0){
			request.setAttribute("result", result);
			request.getSession().removeAttribute("memEmail");    //탈퇴와 함께 세션에서 기록을 지워서 이동
		}
		return new ModelAndView("adminSignOutPro");
	}
}
