package handler.mybus;

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
public class MyBusBoardAppendResult implements CommandHandler {
	@Resource(name="myBusDao")
	public MyBusDao mybusDao; 
	
	@RequestMapping("/myBusBoardAppendResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		BoardDto dto = new BoardDto();
		
		dto.setDriver(request.getParameter("driver"));
		dto.setEmail(request.getParameter("email"));
		dto.setContent(request.getParameter("content"));
		dto.setNick( mybusDao.getMember( dto.getEmail() ).getNick() );
		
		int result = mybusDao.appendBoard( dto );
		BoardDto returnDto = new BoardDto();
		returnDto = mybusDao.getLastBoard( dto.getDriver() );
		
		request.setAttribute("result", result);
		request.setAttribute("dto", returnDto);
		
		return new ModelAndView("myBusBoardAppendResult");
	}
}
