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
import model.MemberDto;
import model.UpcomingDto;
import model.mybus.MyBusDao;

@Controller
public class MyBusUpcomingWritePro implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/myBusUpcomingWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String driver = request.getParameter("driver");
		
		String img = request.getParameter("upload");
		String imgLocation = img.substring(img.lastIndexOf("\\")+1);
		
		UpcomingDto dto = new UpcomingDto();
		MemberDto mdto = mybusDao.getMember(driver);
		String nick = null;
		if( mdto == null ){
			nick = "dto가 널이다";
		} else {
			nick = mdto.getNick();			
		}
		String showDate = request.getParameter("showDate");
		String date = showDate.replace("T", " ")+":00";
		Timestamp ts = Timestamp.valueOf(date);

		dto.setDriver(driver);
		dto.setNick(nick);
		dto.setSubject(request.getParameter("showName"));
		dto.setPerf_place(request.getParameter("location"));
		dto.setPerf_date(ts);
		dto.setPerf_cast(request.getParameter("cast"));
		dto.setPerf_runningtime(Integer.parseInt(request.getParameter("runningTime")));
		dto.setPerf_price(Integer.parseInt(request.getParameter("price")));
		dto.setContent(request.getParameter("content"));
		dto.setImglocation(imgLocation);
		
		int result = mybusDao.writeUpcoming(dto);
		
		request.setAttribute("result", result);
		request.setAttribute("driver", driver);
		
		return new ModelAndView("myBusUpcomingWritePro");
	}

}
