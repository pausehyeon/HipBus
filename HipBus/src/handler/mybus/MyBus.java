package handler.mybus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class MyBus implements CommandHandler {
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/myBus.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");		// 버스주인 (get으로 넘어온 이메일)
		String email = null;
		String channelid = mybusDao.getChannelid( driver );
		
/*
		if(request.getSession()==null) {
			email = "nonmember";		// 비회원방문자 
		} else {
		//	email = request.getSession().getAttribute("memEmail");
			email = "mem2@hipbus.com";	// 방문자 (세션에 저장된 이메일)
			if(driver == email) { 		// 세션의 이메일과 버스주인의 이메일이 같을때 (자기 페이지인 경우)
				int mem_level = mybusDao.getMember( email ).getMem_level();	// 회원등급을 보낸다
				request.setAttribute("mem_level", mem_level);
			} else {					// 남의 페이지인 경우
										// hop판별
			}
		}
*/
		email = "mem1@hipbus.com";
		
		int mem_level = mybusDao.getMember( driver ).getMem_level();
		
		request.setAttribute("mem_level", mem_level);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		request.setAttribute("channelid", channelid);
		return new ModelAndView("myBus");
	}
}
