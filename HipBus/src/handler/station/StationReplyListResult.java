package handler.station;

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
import model.ReplyDto;
import model.station.StationDao;

@Controller
public class StationReplyListResult implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;

	@RequestMapping("/stationReplyListResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
					
		
		List< ReplyDto > dto = stationDao.getReplys(num);
		request.setAttribute("dto", dto);
		return new ModelAndView("stationReplyListResult");
	}

}
