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

@Controller
public class MyBusUpcomingWrite implements CommandHandler {
	
	@Resource(name="generalDao")
	private GeneralDao generalDao;
	
	@RequestMapping("/myBusUpcomingWrite.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String driver = request.getParameter("driver");
		request.setAttribute("driver", driver);
		
		MemberDto member = generalDao.getMember(driver);
		request.setAttribute("member", member);
		
		return new ModelAndView("myBusUpcomingWrite");
	}

}
