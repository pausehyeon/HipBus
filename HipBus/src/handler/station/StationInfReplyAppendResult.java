package handler.station;

import java.io.UnsupportedEncodingException;

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
public class StationInfReplyAppendResult implements CommandHandler {

	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationInfReplyAppendResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 댓글
				int replynum = 0;		// 제목글 0 / 답변글 ! 0
				int re_level = 1;	// 글레벨
				if( request.getParameter( "replynum" ) != null ) {
					// 답변글인 경우 <- read.jsp
					replynum = Integer.parseInt( request.getParameter( "replynum" ) );
					re_level = Integer.parseInt( request.getParameter( "re_level" ) );		
				}
			
				request.setAttribute( "replynum", replynum );
				request.setAttribute( "re_level", re_level );
				
				
		ReplyDto dto = new ReplyDto();
		dto.setEmail(request.getParameter("email"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setRef_num(Integer.parseInt(request.getParameter("ref_num")));
		int result = stationDao.infReplyInsert(dto);
		
		ReplyDto returnDto = new ReplyDto();
		returnDto = stationDao.getLastReply( dto.getNum());
		
		request.setAttribute("result", result);
		request.setAttribute("dto", returnDto);
		
		return new ModelAndView("stationReplyAppendResult");
	}

}