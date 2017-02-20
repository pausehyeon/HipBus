package handler.mybus;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.WantedDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusWanted implements CommandHandler {

	@Resource(name="myBusDao")
	MyBusDao dao;
	
	@RequestMapping("/myBusWanted.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String driver = request.getParameter("driver");
		request.setAttribute("driver", driver );
		if(driver != null && driver != ""){
			List<WantedDto> articles = dao.getWantedArticles(driver);
			request.setAttribute("articles", articles);
		}

		return new ModelAndView("myBusWanted");
	}

}
