package handler.crewbus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.CrewMemberDto;
import model.crewbus.CrewBusDao;

@Controller
public class CrewBusEdit implements CommandHandler {

	@Autowired(required=false)
	@Resource(name="crewBusDao")	
	public CrewBusDao crewBusDao;
	
	@RequestMapping("/crewBusEdit.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String email = (String) request.getSession().getAttribute("memEmail");
		String driver = request.getParameter("driver");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("crewid", driver);
		
		int leader = crewBusDao.isMember(map);
		request.setAttribute("leader", leader);
				
		List<CrewMemberDto> crewMember = crewBusDao.getCrewmembers(driver);
		request.setAttribute("crewMember", crewMember);
		request.setAttribute("driver", driver);
		
			
		return new ModelAndView("crewBusEdit");
	}

}
