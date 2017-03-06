package handler.garage;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import handler.CommandHandler;
import handler.HandlerException;
import model.NewsDto;
import model.garage.GarageDao;
import model.general.FileUpload;
import model.general.ImageResize;

@Controller
public class GarageNewsModifyPro implements CommandHandler {
	@Resource(name="garageDao")
	private GarageDao garageDao;

	@RequestMapping("/garageNewsModifyPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub

		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		MultipartRequest multi;
		int num = Integer.parseInt(request.getParameter("num"));
		
		try {
			multi = new FileUpload().getMultipartRequest(request);
			
			String imglocation = multi.getFilesystemName("upload");	
			
/*
			NewsDto dto = new NewsDto();
			dto.setNum(Integer.parseInt(request.getParameter("num")));
			dto.setSubject(request.getParameter("subject"));
			dto.setContent(request.getParameter("content"));
			dto.setImglocation(request.getParameter("upload"));
			
			
			int result = garageDao.updateArticle( dto );
			
			request.setAttribute("result", result);
	*/		
		
		
		NewsDto dto = new NewsDto();
		dto.setNum(num);
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		//dto.setImglocation(multi.getParameter("upload"));
		
		int result = 0;
		if(imglocation==null){
			result = garageDao.updateArticles(dto);//garageDao.updateArticle( dto );
		}else if(imglocation!=null){
			imglocation = new ImageResize().resize(request, imglocation, 1.4, 560);	
			dto.setImglocation(imglocation);
			result = garageDao.updateArticle( dto );
		}
		
		
		request.setAttribute("result", result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("garageNewsModifyPro");
	}

}

