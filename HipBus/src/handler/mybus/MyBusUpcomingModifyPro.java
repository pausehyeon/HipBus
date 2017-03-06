package handler.mybus;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import handler.CommandHandler;
import handler.HandlerException;
import model.UpcomingDto;
import model.general.FileUpload;
import model.general.ImageResize;
import model.mybus.MyBusDao;

@Controller
public class MyBusUpcomingModifyPro implements CommandHandler {
	@Resource(name="myBusDao")
	private MyBusDao mybusDao;
	@RequestMapping("/myBusUpcomingModifyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String driver = request.getParameter("driver");
		int num = Integer.parseInt(request.getParameter("num"));
		
		MultipartRequest multi;
		try {
			multi = new FileUpload().getMultipartRequest(request);
			
			String imglocation = multi.getFilesystemName("upload");
			UpcomingDto dto = new UpcomingDto();
			dto.setNum(num);
			dto.setSubject(multi.getParameter("subject"));
			dto.setPerf_place(multi.getParameter("perf_place"));
			dto.setPerf_date(Timestamp.valueOf(multi.getParameter("perf_date").replace("T", " ")+":00"));
			dto.setPerf_cast(multi.getParameter("perf_cast"));
			dto.setPerf_runningtime(Integer.parseInt(multi.getParameter("perf_runningtime")));
			dto.setPerf_price(Integer.parseInt(multi.getParameter("perf_price")));
			dto.setContent(multi.getParameter("content"));
			int result = 0;
			if(imglocation==null){
				result = mybusDao.modUpcomingWithout(dto);
			} else if(imglocation!=null){
				imglocation = new ImageResize().resize(request, imglocation, 1.4, 560);	
				dto.setImglocation(imglocation);
				result = mybusDao.modUpcomingWith(dto);
			}
			
			request.setAttribute("num", dto.getNum());
			request.setAttribute("result", result);
			request.setAttribute("driver", driver);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ModelAndView("myBusUpcomingModifyPro");
	}

}
