package handler.crewbus;

import java.util.HashMap;
import java.util.Map;

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
public class CrewBusEjectPro implements CommandHandler {
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	
	@RequestMapping("/crewBusEjectPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String driver = request.getParameter("driver");
		String email = request.getParameter("email");
		int hidden =Integer.parseInt(request.getParameter("hidden"));
		
		int result = 0;
		int creweject = 0;
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("crewid", driver);
		map.put("email", email);
		
		if(hidden != 1){
			result = crewbusDao.ejectMember(map);
		}else{
			creweject = crewbusDao.ejectMember(map);
		}
		
		request.setAttribute("driver", driver);
		request.setAttribute("result", result);
		request.setAttribute("creweject", creweject);
		
		return new ModelAndView("crewBusEjectPro");
	}

}
