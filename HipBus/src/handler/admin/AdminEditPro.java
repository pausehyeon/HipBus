package handler.admin;

import java.io.UnsupportedEncodingException;

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
public class AdminEditPro implements CommandHandler {
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@RequestMapping("/adminEditPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try{
			request.setCharacterEncoding("utf-8");
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String email =(String)request.getSession().getAttribute("memEmail");
		System.out.println(email);
		
		
		MemberDto dto = new MemberDto();
		dto.setEmail(email);
		dto.setNick(request.getParameter("nick"));
		dto.setPasswd(request.getParameter("passwd"));
		
		int result = adminDao.updateAdmin(dto);
		request.setAttribute("result", result);
		
		return new ModelAndView("adminEditPro");
	}

}
