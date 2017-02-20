package handler.mybus;

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
public class MyBusWantedModify implements CommandHandler {

	@Resource(name="myBusDao")
	MyBusDao dao;
	
	@RequestMapping("/myBusWantedModify.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		request.setAttribute("driver", request.getParameter("driver"));
		
		int num = Integer.parseInt( request.getParameter("num") );
		request.setAttribute("num", num);
		WantedDto article = dao.getWantedArticle(num);
		request.setAttribute("article", article);
		
		return new ModelAndView("myBusWantedModify");
	}

}
