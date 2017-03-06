package handler.mybus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.ChannelDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusInsertChannelPro implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao mybusDao;
	
	@RequestMapping("/myBusInsertChannelPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String channel_id = request.getParameter("channel_id");
		String channelid = null;
		String email = null;
		int my_level = 0;
		
		ChannelDto dto = new ChannelDto();
		dto.setDriver(driver);
		dto.setChannel_id(channel_id);
		int result = mybusDao.insertChannel(dto);
		boolean isDriver = false;
		
		if(mybusDao.isDriver(driver)==1){
			isDriver = true;
			if (result != 0) {
				channelid = channel_id;
			}
			
			if( request.getSession().getAttribute("memEmail") != null ) {
				email = (String) request.getSession().getAttribute("memEmail");	// 방문자 (세션에 저장된 이메일)
				my_level = mybusDao.getMember(email).getMem_level();
				request.setAttribute("my_level", my_level);
			}
			
			int mem_level = mybusDao.getMember(driver).getMem_level();
			
			request.setAttribute("chResult", result);
			request.setAttribute("mem_level", mem_level);
			request.setAttribute("driver", driver);
			request.setAttribute("email", email);
			request.setAttribute("channelid", channelid);
		}
		request.setAttribute("isDriver", isDriver);
		return new ModelAndView("myBus");
	}
}
