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
import model.WantedDto;
import model.crewbus.CrewBusDao;
import model.mybus.MyBusDao;

@Controller
public class CrewBusWantedRead implements CommandHandler{
	@Resource(name="myBusDao")
	MyBusDao dao;
	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	@RequestMapping("/crewBusWantedRead.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		
		boolean isMember = false;
		
		if((String)request.getSession().getAttribute("memEmail")!=null){
			Map<String, String> map = new HashMap<String,String>();
			map.put("crewid", driver);
			map.put("email",(String)request.getSession().getAttribute("memEmail"));
			if(crewbusDao.isMember(map)==1) isMember = true;
		}
		
		int num = Integer.parseInt( request.getParameter("num") );
		WantedDto article = dao.getWantedArticle(num);
		dao.readWanted(num);
		request.setAttribute("isMember", isMember);
		request.setAttribute("driver", driver);
		request.setAttribute("article", article);
		return new ModelAndView("crewBusWantedRead");
	}
}
