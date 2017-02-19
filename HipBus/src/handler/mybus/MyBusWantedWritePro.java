package handler.mybus;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.WantedDto;
import model.general.GeneralDao;
import model.mybus.MyBusDao;

@Controller
public class MyBusWantedWritePro implements CommandHandler{
	
	@Resource(name="generalDao")
	GeneralDao generalDao;
	@Resource(name="myBusDao")
	MyBusDao dao;
	
	@RequestMapping("/myBusWantedWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		private String driver;
		private int num;
		private String nick;
		private String subject;
		private String content;
		private String imglocation;
		private Timestamp duedate;
		private int readcount;
		private Timestamp reg_date;
		*/
		
		WantedDto dto = new WantedDto();
		dto.setDriver(request.getParameter("driver"));
		
		request.getParameter("duedate");
		request.getParameter("subject");
		request.getParameter("content");
		request.getParameter("upload");
		
		// TODO 마저 수정해야함!
		
		
		return new ModelAndView("myBusWantedWritePro");
	}
}
