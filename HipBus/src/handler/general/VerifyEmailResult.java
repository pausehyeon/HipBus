package handler.general;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.general.GeneralDao;

@Controller
public class VerifyEmailResult implements CommandHandler {

	@Resource(name="generalDao")
	private GeneralDao generalDao;
	
	@RequestMapping("/verifyEmailResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int result = generalDao.verifyEmail(request.getParameter("email"));
		int hid =Integer.parseInt( request.getParameter("num") );
		//1-이메일이 있어야지 pass 2-이메일이 없어야지 pass
		
		request.setAttribute("result", result);
		request.setAttribute("hid", hid);
		
		return new ModelAndView("verifyEmailResult");
	}

}
