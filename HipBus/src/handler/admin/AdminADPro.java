package handler.admin;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import handler.CommandHandler;
import handler.HandlerException;
import model.AdDto;
import model.admin.AdminDao;
import model.general.FileUpload;
import model.general.ImageResize;


@Controller
public class AdminADPro implements CommandHandler {

	@Resource(name="adminDao")
	private AdminDao adminDao;
	
	@RequestMapping("adminADPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		AdDto dto = new AdDto();
		int result = 0;
		
		MultipartRequest multi;
		try{
			multi = new FileUpload().getMultipartRequest(request);
			
			String imglocation = multi.getFilesystemName("upload");
			
			int ad_num = Integer.parseInt(multi.getParameter("ad_num"));
			String html = "";
			/*System.out.println("ht"+html);
			System.out.println("img"+imglocation);*/
			
			if(imglocation == null){
				html = multi.getParameter("htmlCode");	
				imglocation = "";
			}else{
				imglocation = new ImageResize().resize(request, imglocation, 0.7, 1060);
			}
			
			
			int check = adminDao.adnumCheck(ad_num);
			
			if(check == 0){
				//insert
				dto = new AdDto();
				dto.setAd_num(ad_num);
				dto.setHtml(html);
				dto.setImglocation(imglocation);
				
				result = adminDao.insertAd(dto);
				
			}else{
				//update
				dto = new AdDto();
				dto.setAd_num(ad_num);
				dto.setImglocation(imglocation);
				dto.setHtml(html);
				
				result = adminDao.updateAd(dto);
				
			}
			
		}catch(IOException e){
			e.printStackTrace();
		}	
		request.setAttribute("result", result);
		return new ModelAndView("adminADPro");
	}

}
