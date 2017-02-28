package handler.mybus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MyBusDeletePro implements CommandHandler {
	@Resource(name = "myBusDao")
	model.mybus.MyBusDao mybusDao;

	@RequestMapping("/myBusDeletePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String email = (String) request.getSession().getAttribute("memEmail");

		int signOutResult = mybusDao.deleteEmail(email);
		int signOutDriver = mybusDao.deleteDriver(email);
		
		request.getSession().removeAttribute("memEmail");

		request.setAttribute("signOutResult", signOutResult);
		request.setAttribute("signOutDriver", signOutDriver);

		return new ModelAndView("myBusDeletePro");
	}

}
