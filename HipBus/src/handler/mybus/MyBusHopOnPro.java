package handler.mybus;

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
import model.mybus.MyBusDao;

@Controller
public class MyBusHopOnPro implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao mybusDao;
	@RequestMapping("/myBusHopOnPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = request.getParameter("email");
		String hopORnot = request.getParameter("hopORnot");
		String urlToGoBack = request.getParameter("urlToGoBack");
		Map<String,String> map = new HashMap<String,String>();
		map.put("driver", driver);
		map.put("email", email);
		
		int result = 0;
		
		if( hopORnot.equals("on") ){
			result = mybusDao.hopOn(map);
		} else if( hopORnot.equals("off") ) {
			result = mybusDao.hopOff(map);
		}
		
		request.setAttribute("urlToGoBack", urlToGoBack);
		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		request.setAttribute("hopORnot", hopORnot);

		return new ModelAndView("myBusHopOnPro");
	}

}
