package handler.crewbus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.mybus.MyBusDao;

@Controller
public class CrewBusWantedDeletePro implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao dao;
	@RequestMapping("/crewBusWantedDeletePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		request.setAttribute("driver", request.getParameter("driver") );
		
		int num = Integer.parseInt(request.getParameter("num"));
		int result = dao.deleteWantedArticle(num);
		request.setAttribute("result", result);
		
		return new ModelAndView("crewBusWantedDeletePro");
	}

}
