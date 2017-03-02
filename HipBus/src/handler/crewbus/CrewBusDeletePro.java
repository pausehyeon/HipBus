package handler.crewbus;

import java.util.HashMap;
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
public class CrewBusDeletePro implements CommandHandler{
	@Resource(name="crewBusDao")
	private CrewBusDao dao;
	
	@RequestMapping("/crewBusDeletePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// 먼저 멤버 삭제
		String crewid = (String) request.getParameter("crewid");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("crewid", crewid);
		map.put("email", (String) request.getSession().getAttribute("memEmail"));
		int result = dao.ejectMember(map);
		
		// 만일 남은 멤버 수가 0명이면 크루 삭제
		if(result == 1){
			List<CrewMemberDto> crewMember = dao.getCrewmembers(crewid);
			if(crewMember.size() == 0){
				result = dao.deleteCrew(crewid);
			}
		}
		
		request.setAttribute("result", result);
		request.setAttribute("crewid", crewid);
		return new ModelAndView("crewBusDeletePro");
	}
}
