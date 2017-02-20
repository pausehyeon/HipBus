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
import model.WantedDto;
import model.general.FileUpload;
import model.general.GeneralDao;
import model.general.ImageResize;
import model.mybus.MyBusDao;

@Controller
public class MyBusWantedModifyPro implements CommandHandler {

	@Resource(name = "generalDao")
	GeneralDao generalDao;
	@Resource(name = "myBusDao")
	MyBusDao dao;

	@RequestMapping("/myBusWantedModifyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("driver", request.getParameter("driver"));

		MultipartRequest multi;

		try {
			multi = new FileUpload().getMultipartRequest(request);
			int result = 0;

			WantedDto article = new WantedDto();

			article.setNum(Integer.parseInt(multi.getParameter("num")));
			article.setSubject(multi.getParameter("subject"));
			article.setContent(multi.getParameter("content"));
			// timestamp 형식 : yyyy-mm-dd hh:mm:ss
			article.setDuedate(Timestamp.valueOf(multi.getParameter("duedate") + " 00:00:00"));

			if (multi.getFile("upload") != null) {
				String imglocation = multi.getFilesystemName("upload");
				imglocation = new ImageResize().resize(request, imglocation, 1, 560);
				article.setImglocation(imglocation);

				result = dao.modifyWantedWholeArticle(article);
			} else {
				result = dao.modifyWantedArticle(article);
			}

			request.setAttribute("result", result);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new ModelAndView("myBusWantedModifyPro");
	}

}
