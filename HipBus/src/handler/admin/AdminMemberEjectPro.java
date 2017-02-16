package handler.admin;

import java.util.List;

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
public class AdminMemberEjectPro implements CommandHandler {
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@RequestMapping("/adminMemberEjectPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String email = request.getParameter("email");
		
		List<String> list = adminDao.crewLeader(email);		
		for(int i=0;i<list.size();i++){
			List<MemberDto> clist =adminDao.crewId( list.get(i));
			adminDao.updateLeader(clist.get(0).getEmail());
		}
				
		int result = adminDao.deleteMember(email);
		int resultcheck = adminDao.deleteDriver(email);
		request.setAttribute("result", result);
		request.setAttribute("resultcheck", resultcheck);
		
		return new ModelAndView("adminMemberEjectPro");
	}

}
