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
import model.MemberDto;
import model.admin.AdminDao;

@Controller
public class AdminMemberManagePro implements CommandHandler {
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@RequestMapping("/adminMemberManagePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		MemberDto dto = new MemberDto();
		int grade = Integer.parseInt(request.getParameter("mem_level"));
		
		dto.setEmail(request.getParameter("email"));
		dto.setMem_level(grade);
		
		
		int result = adminDao.modifyGrade(dto);
		
		request.setAttribute("result", result);
		
		return new ModelAndView("adminMemberManagePro");
	}

}
