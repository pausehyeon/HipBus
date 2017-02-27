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
public class CrewBusApplyPro implements CommandHandler {
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusApplyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("email", (String)request.getSession().getAttribute("memEmail"));
		map.put("crewid", driver);
		map.put("apply", Integer.toString(0));
		int result = crewbusDao.applyCrew(map);
		
		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		
		return new ModelAndView("crewBusApplyPro");
	}

}
