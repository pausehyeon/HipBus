package handler.crewbus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class CrewBusBeforeEditPro implements CommandHandler {
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/crewBusBeforeEditPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String driver = request.getParameter("driver");
		String passwd = request.getParameter("passwd");
		String email = (String) request.getSession().getAttribute("memEmail");	
	
		String passwdCheck = mybusDao.getMember(email).getPasswd();		
		
		int result = 0;
		
		if ( passwd.equals(passwdCheck)) {
			result = 0;								
		} else if ( ! passwd.equals(passwdCheck)) {
			result = -1;
		} 
		
		request.setAttribute("driver", driver);
		request.setAttribute("passwd", passwd);
		request.setAttribute("result", result);
		
		return new ModelAndView("crewBusBeforeEditPro");
	}

}
