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
public class MyBusLeft implements CommandHandler {
	@Resource(name="myBusDao")
	MyBusDao mybusDao;
	
	@RequestMapping("/myBusLeft.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String email = request.getParameter("email");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("driver", driver);
		map.put("email", email);

		int isHop = mybusDao.isHop(map);
		String hopORnot = null;
		if( isHop != 0 ) {
			hopORnot = "off";
		} else if( isHop == 0 ) {
			hopORnot = "on";
		}
		
		request.setAttribute("hopORnot", hopORnot);
		request.setAttribute("driver", driver);
		request.setAttribute("email", email);
		return new ModelAndView("myBusLeft");
	}

}
