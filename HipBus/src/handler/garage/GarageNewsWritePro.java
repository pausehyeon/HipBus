package handler.garage;

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
import model.MemberDto;
import model.NewsDto;
import model.garage.GarageDao;
import model.general.FileUpload;
import model.general.ImageResize;

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
		
		String email =(String)request.getSession().getAttribute("memEmail");
		
		MemberDto dto = garageDao.getMember(email); //nick값 불러오기위한 메소드
		 
		request.setAttribute("dto",dto);
		
		MultipartRequest multi;
		try {
			multi = new FileUpload().getMultipartRequest(request);
			
			String imgname = multi.getOriginalFileName("upload"); 
			String imglocation = multi.getFilesystemName("upload");
			imglocation = new ImageResize().resize(request, imglocation, 0.6, 1060);
			
			NewsDto article = new NewsDto();
			article.setEmail(dto.getEmail());
			article.setNick(dto.getNick());
			article.setSubject(multi.getParameter("subject"));
			article.setContent(multi.getParameter("content"));
			article.setReg_date( new Timestamp( System.currentTimeMillis() ) );
			article.setMod_date( new Timestamp( System.currentTimeMillis() ) );
			article.setImgname(imgname);
			article.setImglocation(imglocation);
			int result = garageDao.insertNews(article);
			request.setAttribute( "result", result );
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ModelAndView("garageNewsWritePro");
	}
}