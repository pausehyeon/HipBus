package handler.general;

import java.io.UnsupportedEncodingException;

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
public class VerifyNickResult implements CommandHandler {

	@Resource(name="generalDao")
	private GeneralDao generalDao;
	
	@RequestMapping("/verifyNickResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String nick = (String) request.getParameter("nick");
		int result = generalDao.verifyNick(request.getParameter("nick"));
		if(request.getParameter("ex_nick") != null && request.getParameter("ex_nick").equals(nick)){
			//만일 ex_nick이라는 parameter가 존재하는데(myBusEdit.jsp) 지금 입력한 것과 같으면, 즉 변화가 없으면 result를 true로 보정.
			result = 0;
		}
		
		request.setAttribute("result", result);
		return new ModelAndView("verifyNickResult");
	}

}
