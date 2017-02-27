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
import model.WantedDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusWanted implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao dao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusWanted.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		request.setAttribute("driver", driver );
		boolean isMember = false;
		if(driver != null && driver != ""){
			List<WantedDto> articles = dao.getWantedArticles(driver);
			List<WantedDto> pastArticles = dao.getPastWantedArticles(driver);
			request.setAttribute("articles", articles);
			request.setAttribute("pastArticles", pastArticles);
		}
		if((String)request.getSession().getAttribute("memEmail")!=null){
			Map<String, String> map = new HashMap<String,String>();
			map.put("crewid", driver);
			map.put("email",(String)request.getSession().getAttribute("memEmail"));
			if(crewbusDao.isMem(map)==1) isMember = true;
		}
		
		request.setAttribute("isMember", isMember);
		return new ModelAndView("crewBusWanted");
	}

}
