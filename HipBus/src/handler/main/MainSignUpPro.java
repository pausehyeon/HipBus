package handler.main;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

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
import model.main.MainDao;

@Controller
public class MainSignUpPro implements CommandHandler {
	
	@Autowired(required=false)
	@Resource(name="mainDao") 
	public MainDao Maindao;

	@RequestMapping("/mainSignUpPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		MemberDto dto = new MemberDto();
		dto.setEmail( request.getParameter("email"));
		dto.setNick(request.getParameter("nick"));
		dto.setPasswd( request.getParameter("passwd"));
		dto.setJoindate(new Timestamp( System.currentTimeMillis() ));
		dto.setImgName("img.jpg");
		dto.setImglocation("img.jpg");
		
		int result = Maindao.insertMember( dto );		
		
		request.setAttribute("result", result);
		
		return new ModelAndView("mainSignUpPro");		
	}

}
















