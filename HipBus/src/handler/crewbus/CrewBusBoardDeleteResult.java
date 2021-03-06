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
public class CrewBusBoardDeleteResult implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	
	@RequestMapping("/crewBusBoardDeleteResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int num = Integer.parseInt( request.getParameter("num") );
		int result = mybusDao.deleteBoard( num );
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		return new ModelAndView("crewBusBoardDeleteResult");
	}
}
