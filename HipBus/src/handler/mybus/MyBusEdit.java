package handler.mybus;

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
		// TODO Auto-generated method stub		
		String driver = request.getParameter("driver");		
		request.setAttribute("driver", driver);	
				
		MemberDto member = generalDao.getMember(driver);
		request.setAttribute("member", member);
		
		//result 넘겨줘야.		
		int result = myBusDao.checkChannel(driver);
		request.setAttribute("result", result);
		
		return new ModelAndView("myBusEdit");
	}
}
