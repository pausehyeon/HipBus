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
import model.StationDto;
import model.station.StationDao;

@Controller
public class StationReplyAppendResult implements CommandHandler {

	@Resource( name="stationDao")
	private StationDao stationDao;
	
	@RequestMapping("/stationReplyAppendResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 댓글
				int replynum = 0;		// 제목글 0 / 답변글 ! 0
				int ref_num = 1;		// 그룹화 아이디
				int re_step = 0;	// 글순서
				int re_level = 0;	// 글레벨
				if( request.getParameter( "replynum" ) != null ) {
					// 답변글인 경우 <- read.jsp
					replynum = Integer.parseInt( request.getParameter( "replynum" ) );
					ref_num = Integer.parseInt( request.getParameter( "ref_num" ) );
					re_step = Integer.parseInt( request.getParameter( "re_step" ) );
					re_level = Integer.parseInt( request.getParameter( "re_level" ) );		
				}
			
				request.setAttribute( "replynum", replynum );
				request.setAttribute( "ref_num", ref_num );
				request.setAttribute( "re_step", re_step );
				request.setAttribute( "re_level", re_level );
				int num =Integer.parseInt(request.getParameter("num"));		
				
		ReplyDto dto = new ReplyDto();
		dto.setEmail(request.getParameter("email"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(num);

		StationDto stdt = stationDao.getArticle(num);
		if(stdt.getEmail().equals(dto.getEmail())){
			dto.setStatus(1);
		} else {
			dto.setStatus(0);
		}	
		
		int result = stationDao.replyInsert(dto);
		
		ReplyDto returnDto = new ReplyDto();
		returnDto = stationDao.getLastReply( dto.getNum());
		
		request.setAttribute("result", result);
		request.setAttribute("dto", returnDto);
		
		return new ModelAndView("stationReplyAppendResult");
	}

}
