package handler.crewbus;

import java.util.HashMap;
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
import model.crewbus.CrewBusDao;
@Controller
public class CrewBusSignOverPro implements CommandHandler {
	
	@Autowired(required=false)
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	
	@RequestMapping("/crewBusSignOverPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String email = request.getParameter("email");
		String driver = request.getParameter("driver");
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("crewid", driver);
		//탈퇴
		int result = crewbusDao.updateLeader(map);
		if(result != 0){
			email = (String) request.getSession().getAttribute("memEmail");
			Map<String, String> lcmap = new HashMap<String,String>();
			lcmap.put("email", email);
			lcmap.put("crewid", driver);
			
			int leaderChange = crewbusDao.leaderChange(lcmap);
			request.setAttribute("leaderChange", leaderChange);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		
		return new ModelAndView("crewBusSignOverPro");
	}

}
