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
import model.CrewDto;
import model.crewbus.CrewBusDao;


@Controller
public class CrewBusUpcomingWrite implements CommandHandler {

	@Resource(name="crewBusDao")
	private CrewBusDao crewbusDao;
	
	@RequestMapping("/crewBusUpcomingWrite.do")
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
		
		CrewDto crewDto = crewbusDao.getCrewInfo(driver);
		request.setAttribute("crewDto", crewDto);
		
		return new ModelAndView("crewBusUpcomingWrite");
	}
}
