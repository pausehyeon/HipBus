package handler.station;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.station.StationDao;

@Controller
public class StationReplyDeleteResult implements CommandHandler {
	
	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationReplyDeleteResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int replynum = Integer.parseInt( request.getParameter("replynum") );
		int ref_num = Integer.parseInt(request.getParameter("ref_num"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		if(re_step == 0){
			int result = stationDao.deleteReply( ref_num );
			request.setAttribute("result", result);
			request.setAttribute("ref_num", ref_num);
		}else if(re_step == 1){
			int result = stationDao.infDeleteReply(replynum);
			request.setAttribute("result", result);
			request.setAttribute("replynum", replynum);
		}
		
		
		
		
		return new ModelAndView("stationReplyDeleteResult");
	}

}
