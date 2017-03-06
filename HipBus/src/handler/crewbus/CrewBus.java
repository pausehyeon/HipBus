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
import model.CrewMemberDto;
import model.crewbus.CrewBusDao;

@Controller
public class CrewBus implements CommandHandler {
	@Resource(name="myBusDao")
	private model.mybus.MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBus.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");		// 버스주인 (get으로 넘어온 이메일)
		String email = null;
		int my_level = 0;
		boolean isMember = false;
		boolean isLeader = false;
		boolean isDriver = false;
		
		if(mybusDao.isDriver(driver)==1) {
			isDriver = true;
		
			String channelid = mybusDao.getChannelid( driver );
			
			if( request.getSession().getAttribute("memEmail") != null ) {
				email = (String) request.getSession().getAttribute("memEmail");	// 방문자 (세션에 저장된 이메일)
				my_level = mybusDao.getMember(email).getMem_level();	// 방문자 회원등급 판별(관리자구별)
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
			
			request.setAttribute("isLeader", isLeader);
			request.setAttribute("isMember", isMember);
			request.setAttribute("chResult", request.getParameter("chResult"));
			request.setAttribute("driver", driver);
			request.setAttribute("email", email);
			request.setAttribute("channelid", channelid);
		}
		
		request.setAttribute("isDriver", isDriver);
		
		return new ModelAndView("crewBus");
	}

}
