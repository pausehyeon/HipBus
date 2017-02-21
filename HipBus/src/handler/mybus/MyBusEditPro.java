package handler.mybus;

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
import model.MemberDto;
import model.general.FileUpload;
import model.general.ImageResize;

@Controller
public class MyBusEditPro implements CommandHandler{
	@Resource(name="myBusDao")
	model.mybus.MyBusDao mybusDao;
	
	@RequestMapping("/myBusEditPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		MultipartRequest multi;
		
		try {
			//이미지 업로드
			request.setCharacterEncoding("utf-8");
			String driver = request.getParameter("driver");			
			multi = new FileUpload().getMultipartRequest(request);
			String imglocation = multi.getFilesystemName("upload");
			
			//이미지 사이즈 조정
			imglocation = new ImageResize().resize(request, imglocation, 1, 900);
		
			MemberDto dto = new MemberDto();
			dto.setEmail(driver);
			dto.setImglocation(imglocation);
			int result= mybusDao.imgLocationUpdate(dto);			
			
			request.setAttribute("driver", driver);
			request.setAttribute("result", result);
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ModelAndView("myBusEditPro");
	}
}
