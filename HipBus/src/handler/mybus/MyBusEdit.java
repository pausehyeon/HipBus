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
import model.MemberDto;
import model.general.GeneralDao;
import model.mybus.MyBusDao;

@Controller
public class MyBusEdit implements CommandHandler{
	
	@Resource(name="myBusDao")
	private MyBusDao myBusDao;
	
	@Resource(name="generalDao")
	private GeneralDao generalDao;
	
	@RequestMapping("/myBusEdit.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		String driver = request.getParameter("driver");		
		request.setAttribute("driver", driver);	
				
		MemberDto member = generalDao.getMember(driver);
		request.setAttribute("member", member);
		
		String channel_id = myBusDao.getChannelid(driver);
		request.setAttribute("channel_id", channel_id);
		
		return new ModelAndView("myBusEdit");
	}
}
