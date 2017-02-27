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
import model.CrewMemberDto;

@Controller
public class MyBusCreatCrewPro implements CommandHandler {
	@Resource(name="myBusDao")
	private model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/myBusCreatCrewPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String driver = request.getParameter("driver");
		String crewname = request.getParameter("crewname");
		
		int result = 0;
		
		int cResult = mybusDao.createCrew(crewname);
		
		if(cResult != 0){
			String crewid = mybusDao.getCrewId(crewname);
			mybusDao.createCrewDriver(crewid);
			CrewMemberDto cmDto = new CrewMemberDto();
			cmDto.setCrewid(crewid);
			cmDto.setEmail(driver);
			result = mybusDao.createCrewMember(cmDto);
		}

		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		
		return new ModelAndView("myBusCreatCrewPro");
	}

}
