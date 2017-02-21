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
public class StationInfReplyListResult implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;

	@RequestMapping("/stationInfReplyListResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
	
		int ref_num = Integer.parseInt(request.getParameter("ref_num"));
		
		
		
		
		List< ReplyDto > dto = stationDao.getInfReplys(ref_num);
		request.setAttribute("dto", dto);
		return new ModelAndView("stationReplyListResult");
	}

}