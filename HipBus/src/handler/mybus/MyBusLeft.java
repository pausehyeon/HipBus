package handler.mybus;

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
import model.general.ImageResize;
import model.mybus.MyBusDao;

@Controller
public class MyBusLeft implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao mybusDao;
	
	@RequestMapping("/myBusLeft.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = null; 
		email = (String) request.getSession().getAttribute("memEmail");

		Map<String,String> map = new HashMap<String,String>();
		map.put("driver", driver);
		map.put("email", email);
		
		int isHop = 0;
		String hopORnot = null;
		if( email != null ){
			isHop = mybusDao.isHop(map);
			if( isHop == 1 ) {
				hopORnot = "off";
			} else if( isHop == 0 ) {
				hopORnot = "on";
			}
		}
		
		
		
		MemberDto memDto = mybusDao.getMember(driver);
		
		List<CrewDto> myCrews = mybusDao.getMyCrews(driver);
		
		Map<String, List<CrewMemberDto>> myMembers = new HashMap<String, List<CrewMemberDto>>();
		
		for(int i=0;i<myCrews.size();i++){
			CrewDto crew = myCrews.get(i);
			Map<String,String> crewMap = new HashMap<String,String>();
			crewMap.put("crewid", crew.getCrewid());
			crewMap.put("driver", driver);
			List<CrewMemberDto> members = mybusDao.getMyMembers( crewMap );
			myMembers.put(crew.getCrewid(), members);
		}	// myMembers 맵에 크루아이디가 키, 멤버Dto가 value로 들어있다.
		
		List<String> tags = mybusDao.getTags(driver);
		
		List<MemberDto> passengers = mybusDao.getPassengers(driver);
		
		request.setAttribute("passengers", passengers);
		request.setAttribute("tags", tags);
		request.setAttribute("myMembers", myMembers);
		request.setAttribute("myCrews", myCrews);
		request.setAttribute("memDto", memDto);
		request.setAttribute("hopORnot", hopORnot);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		return new ModelAndView("myBusLeft");
	}
}
