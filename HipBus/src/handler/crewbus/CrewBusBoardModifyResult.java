package handler.crewbus;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.BoardDto;
import model.mybus.MyBusDao;
@Controller
public class CrewBusBoardModifyResult implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/crewBusBoardModifyResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		BoardDto dto = new BoardDto();
		dto.setNum( num );
		dto.setContent( content );
		
		int result = mybusDao.modifyBoard( dto );
		
		request.setAttribute("result", result);
		request.setAttribute("content", content);
		
		return new ModelAndView("crewBusBoardModifyResult");
	}

}
