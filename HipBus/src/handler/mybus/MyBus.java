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
import model.MemberDto;
import model.general.GeneralDao;

@Controller
public class MyBus implements CommandHandler {
	@Resource(name="generalDao")
	GeneralDao generalDao;
	
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/myBus.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");		// 버스주인 (get으로 넘어온 이메일)
		String email = null;
		String channelid = mybusDao.getChannelid( driver );
		
		if( request.getSession() != null ) {
			email = (String) request.getSession().getAttribute("memEmail");	// 방문자 (세션에 저장된 이메일)

			if(driver == email) { 		// 세션의 이메일과 버스주인의 이메일이 같을때 (자기 페이지인 경우)
				
			} else {					// 회원이 남의 페이지에 방문한 경우
				
			}
		}
		
		int mem_level = mybusDao.getMember(driver).getMem_level();
		
		request.setAttribute("mem_level", mem_level);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		request.setAttribute("channelid", channelid);
		return new ModelAndView("myBus");
	}
}
