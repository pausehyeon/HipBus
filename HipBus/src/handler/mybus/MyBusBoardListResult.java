package handler.mybus;

import java.util.HashMap;
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
import model.BoardDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusBoardListResult implements CommandHandler {
	@Resource(name="myBusDao")
	public MyBusDao mybusDao;
	
	@RequestMapping("/myBusBoardListResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		String boardCount = request.getParameter("boardCount");
		Map<String, String> map = new HashMap<>();
		map.put("driver", driver);
		map.put("boardCount", boardCount);
		List<BoardDto> boardList = mybusDao.getBoardList(map);
		request.setAttribute("boardList", boardList);

		return new ModelAndView("myBusBoardListResult");
	}
}
