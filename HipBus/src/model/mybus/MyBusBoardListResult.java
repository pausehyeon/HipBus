package model.mybus;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.BoardDto;

@Controller
public class MyBusBoardListResult implements CommandHandler {
	@Resource(name="myBusDao")
	public MyBusDao mybusDao;
	
	@RequestMapping("/myBusBoardListResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		List<BoardDto> boardList = mybusDao.getBoardList(driver);
		request.setAttribute("boardList", boardList);

		return new ModelAndView("myBusBoardListResult");
	}

}
