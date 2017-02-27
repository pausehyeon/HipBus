package handler.crewbus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusLeft implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	
	@RequestMapping("/crewBusLeft.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = null; 
		int mem_level = 0;
		boolean isMember = false;
		int isApplied = 0;
		if( request.getSession().getAttribute("memEmail") != null ) {
			email = (String) request.getSession().getAttribute("memEmail");
			mem_level = mybusDao.getMember(email).getMem_level();
			Map<String,String> map = new HashMap<String,String>();
			map.put("crewid", driver);
			map.put("email", email);
			isApplied = crewbusDao.isApplied(map);
		}

		Map<String,String> map = new HashMap<String,String>();
		map.put("driver", driver);
		map.put("email", email);
		
		int isHop = 0;
		String hopORnot = null;
		if( email != null ){
			isHop = mybusDao.isHop(map);
			if( isHop >= 1 ) {
				hopORnot = "off";
			} else if( isHop == 0 ) {
				hopORnot = "on";
			}
		}
		
		CrewDto crewDto = crewbusDao.getCrewInfo(driver);
		List<CrewMemberDto> memberList = crewbusDao.getCrewmembers(driver);
		if(!memberList.isEmpty()){
			for(int i=0;i<memberList.size();i++){
				CrewMemberDto cmDto = memberList.get(i);
				if(cmDto.getEmail().equals(email) && cmDto.getLeader()!=0){
					isMember = true;
				}
			}
		}
		List<String> tags = mybusDao.getTags(driver);
		
		List<MemberDto> passengers = mybusDao.getPassengers(driver);
		
		String channelid = mybusDao.getChannelid( driver );
		
		
		request.setAttribute("isApplied", isApplied);
		request.setAttribute("memberList", memberList);
		request.setAttribute("isMember", isMember);
		request.setAttribute("mem_level", mem_level);
		request.setAttribute("channelid", channelid);
		request.setAttribute("passengers", passengers);
		request.setAttribute("tags", tags);
		request.setAttribute("crewDto", crewDto);
		request.setAttribute("hopORnot", hopORnot);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		return new ModelAndView("crewBusLeft");
	}

}
