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

@Controller
public class MyBusBeforeEdit implements CommandHandler {
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;

	@RequestMapping("/myBusBeforeEdit.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
				
		String driver = request.getParameter("driver");
		
		request.setAttribute("driver", driver);		
				
				
		
		return new ModelAndView("myBusBeforeEdit");
	}

}
