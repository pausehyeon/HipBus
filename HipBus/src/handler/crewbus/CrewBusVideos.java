package handler.crewbus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.crewbus.CrewBusDao;

@Controller
public class CrewBusVideos implements CommandHandler {
	@Resource(name="myBusDao")
	private model.mybus.MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	
	@RequestMapping("/crewBusVideos.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String channelid = mybusDao.getChannelid( driver );
		String crewname = crewbusDao.getCrewInfo(driver).getCrewname();
		request.setAttribute("crewname", crewname);
		request.setAttribute("channelid", channelid);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusVideos");
	}

}
