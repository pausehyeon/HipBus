package handler.crewbus;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.ChannelDto;
import model.CrewMemberDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusInsertChannelPro implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusInsertChannelPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String channel_id = request.getParameter("channel_id");
		String channelid = null;
		String email = null;
		boolean isMember = false;
		boolean isLeader = false;
		int my_level = 0;
		
		ChannelDto dto = new ChannelDto();
		dto.setDriver(driver);
		dto.setChannel_id(channel_id);
		int result = mybusDao.insertChannel(dto);
		
		if (result != 0) {
			channelid = channel_id;
		}
		
		if( request.getSession().getAttribute("memEmail") != null ) {
			email = (String) request.getSession().getAttribute("memEmail");	// 방문자 (세션에 저장된 이메일)
			my_level = mybusDao.getMember(email).getMem_level();
			request.setAttribute("my_level", my_level);
		}
		
		List<CrewMemberDto> memberList = crewbusDao.getCrewmembers(driver);
		if(!memberList.isEmpty()){
			for(int i=0;i<memberList.size();i++){
				CrewMemberDto cmDto = memberList.get(i);
				if(cmDto.getEmail().equals(email)){
					isMember = true;
					if(cmDto.getLeader() == 2){
						isLeader = true;
					}
				}
			}
		}
		
		request.setAttribute("chResult", result);
		request.setAttribute("isLeader", isLeader);
		request.setAttribute("isMember", isMember);
		request.setAttribute("chResult", request.getParameter("chResult"));
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		request.setAttribute("channelid", channelid);
		return new ModelAndView("crewBus");
	}
}
