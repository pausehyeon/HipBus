package handler.station;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class StationWrite implements CommandHandler {

	@RequestMapping("/stationWrite.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int num = 0;
		int type = 1;
		if(request.getParameter("type") != null){
			type = Integer.parseInt(request.getParameter("type"));
		}
		request.setAttribute("type", type);
		request.setAttribute("num",num);
	
		return new ModelAndView("stationWrite");
	}

}
