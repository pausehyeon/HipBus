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

		ChannelDto dto = new ChannelDto();
		dto.setDriver(driver);
		dto.setChannel_id(channel_id);
		int result = mybusDao.insertChannel(dto);

		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		return new ModelAndView("myBusInsertChannelPro");
	}
}
