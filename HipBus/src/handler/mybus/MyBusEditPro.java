package handler.mybus;

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
import model.ChannelDto;
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

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		request.setAttribute("driver", request.getParameter("driver"));
		
		// 이미지
		MultipartRequest multi;		
		MemberDto dto = new MemberDto();
		ChannelDto chdto = new ChannelDto();
		String driver = request.getParameter("driver");
		try {
			//이미지 업로드
			request.setCharacterEncoding("utf-8");
						
			multi = new FileUpload().getMultipartRequest(request);
			
			if ( multi.getFile("upload") != null) {
				String imglocation = multi.getFilesystemName("upload");				
				//이미지 사이즈 조정
				imglocation = new ImageResize().resize(request, imglocation, 1, 900);
				dto.setEmail(driver);			
				request.setAttribute("driver", driver);
				dto.setImglocation(imglocation);		
				int result= mybusDao.imgLocationUpdate(dto);
				request.setAttribute("result", result);				
			}					
			
			// 닉네임, 패스워드
			String nick = multi.getParameter("nick");
			String passwd = multi.getParameter("passwd");
			dto.setEmail(driver);		
			dto.setNick(nick);
			dto.setPasswd(passwd);
			
			int profileResult = mybusDao.updateProfile(dto);								
			request.setAttribute("profileResult", profileResult);	
			
			//유튜브	
			String channel_id = multi.getParameter("channel_id");
			if ( channel_id != null) {				
				chdto.setChannel_id(channel_id);
				chdto.setDriver(driver);
				int channelResult = mybusDao.updateChannel(chdto);					
				request.setAttribute("channelResult", channelResult);
			}			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return new ModelAndView("myBusEditPro");
	}
}
