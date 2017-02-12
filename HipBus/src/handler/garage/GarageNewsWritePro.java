package handler.garage;

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
import model.NewsDto;
import model.garage.GarageDao;

@Controller
public class GarageNewsWritePro implements CommandHandler{

	@Resource(name="garageDao")
	private GarageDao garageDao;
	
	@RequestMapping("/garageNewsWritePro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		NewsDto article = new NewsDto();
		
		article.setEmail(request.getParameter("email"));
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setNick(request.getParameter("nick"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setReadcount(Integer.parseInt(request.getParameter("readcount")));
		article.setReg_date( new Timestamp( System.currentTimeMillis() ) );
		article.setMod_date( new Timestamp( System.currentTimeMillis() ) );
		
		int result = garageDao.insertNews(article);
		
		request.setAttribute( "result", result );
		
		
		return new ModelAndView("garageNewsWritePro");
	}
}