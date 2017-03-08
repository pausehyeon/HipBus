package handler.crewbus;

import java.io.UnsupportedEncodingException;
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
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusEdit implements CommandHandler {

	@Resource(name="crewBusDao")	
	private CrewBusDao dao;
	
	@Resource(name="myBusDao")
	private MyBusDao myBusDao;
	
	@RequestMapping("/crewBusEdit.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String email = (String) request.getSession().getAttribute("memEmail");
		String driver = (String) request.getParameter("driver");
		
		CrewDto crew = dao.getCrewInfo(driver);
		request.setAttribute("crew", crew);
		
		String channel_id = myBusDao.getChannelid(driver);
		request.setAttribute("channel_id", channel_id);
		
		if(email != null){
			Map<String,String> map = new HashMap<String,String>();
			map.put("email", email);
			map.put("crewid", driver);
			
			int leader = dao.isMember(map);
			request.setAttribute("leader", leader);		
		}
		
		List<CrewMemberDto> crewMember = dao.getCrewmembers(driver);
		request.setAttribute("crewMember", crewMember);
		request.setAttribute("driver", driver);
		
			
		return new ModelAndView("crewBusEdit");
	}

}
