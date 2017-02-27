package handler.crewbus;

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
import model.WantedDto;
import model.general.FileUpload;
import model.general.GeneralDao;
import model.general.ImageResize;
import model.mybus.MyBusDao;

@Controller
public class CrewBusWantedWritePro implements CommandHandler {
	@Resource(name = "generalDao")
	GeneralDao generalDao;
	@Resource(name = "myBusDao")
	MyBusDao dao;
	@RequestMapping("/crewBusWantedWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String driver = request.getParameter("driver");
		
		MultipartRequest multi;

		try {
			multi = new FileUpload().getMultipartRequest(request);
			String imglocation = "";
			if(multi.getFile("upload") != null){
				imglocation = multi.getFilesystemName("upload");
				imglocation = new ImageResize().resize(request, imglocation, 1, 560);
			}

			WantedDto article = new WantedDto();
			
			String email = (String) request.getSession().getAttribute("memEmail");
			article.setDriver(driver);
			
			article.setNick(generalDao.getMember(email).getNick());
			
			//timestamp 형식 : yyyy-mm-dd hh:mm:ss
			article.setDuedate(Timestamp.valueOf(multi.getParameter("duedate") + " 00:00:00"));
			
			article.setSubject(multi.getParameter("subject"));
			
			article.setContent(multi.getParameter("content"));
			
			article.setImglocation(imglocation);
			
			article.setReg_date(new Timestamp( System.currentTimeMillis() ) );
			
			int result = dao.insertWantedArticle(article);
			request.setAttribute("result", result);
			request.setAttribute("driver", driver);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new ModelAndView("crewBusWantedWritePro");
	}
}
