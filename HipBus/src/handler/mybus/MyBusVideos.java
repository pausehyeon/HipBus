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
public class MyBusVideos implements CommandHandler{
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	@RequestMapping("/myBusVideos.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String channelid = mybusDao.getChannelid( driver );
		String nick = mybusDao.getMember(driver).getNick();
		request.setAttribute("nick", nick);
		request.setAttribute("channelid", channelid);
		request.setAttribute("driver", driver);
		return new ModelAndView("myBusVideos");
	}
}
