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
import model.MemberDto;
import model.UpcomingDto;
import model.WantedDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusRight implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusRight.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		
		UpcomingDto upcomingDto = mybusDao.getNewUpcoming(driver);
		if(upcomingDto!=null){
			upcomingDto.setImglocation(upcomingDto.getImglocation());
			request.setAttribute("upcomingDto", upcomingDto);
		}
		WantedDto wantedDto = mybusDao.getNewWanted(driver);
		if(wantedDto!=null){
			wantedDto.setImglocation(wantedDto.getImglocation());
			request.setAttribute("wantedDto", wantedDto);
		}
		
		List<MemberDto> Applymembers = crewbusDao.getApplyMembers(driver);
		
		if((String) request.getSession().getAttribute("memEmail")!=null){
			Map<String, String> map = new HashMap<String,String>();
			map.put("crewid", driver);
			map.put("email", (String) request.getSession().getAttribute("memEmail"));
			if(crewbusDao.isMem(map)==1){
				int leader = crewbusDao.isMember(map);
				request.setAttribute("leader", leader);
			}
		}
		
		request.setAttribute("Applymembers", Applymembers);
		request.setAttribute("driver", driver);
		return new ModelAndView("crewBusRight");
	}

}
