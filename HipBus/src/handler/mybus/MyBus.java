package handler.mybus;

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
public class MyBus implements CommandHandler {
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/myBus.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");		// 버스주인 (get으로 넘어온 이메일)
		String email = null;
		int my_level = 0;
		String channelid = mybusDao.getChannelid( driver );
		
		if( request.getSession().getAttribute("memEmail") != null ) {
			email = (String) request.getSession().getAttribute("memEmail");	// 방문자 (세션에 저장된 이메일)
			my_level = mybusDao.getMember(email).getMem_level();
			request.setAttribute("my_level", my_level);
			
		}
		
		int mem_level = mybusDao.getMember(driver).getMem_level();
		
		
		request.setAttribute("chResult", request.getParameter("chResult"));
		request.setAttribute("mem_level", mem_level);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		request.setAttribute("channelid", channelid);
		return new ModelAndView("myBus");
	}
}
