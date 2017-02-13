package handler.mybus;

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
public class MyBus implements CommandHandler {
	@Resource(name="myBusDao")
	model.mybus.MyBusDao boardDao;
	
	@RequestMapping("/myBus.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView("myBus");
	}
}
