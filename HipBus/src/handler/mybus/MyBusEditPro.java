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
public class MyBusEditPro implements CommandHandler {
	@Resource(name = "myBusDao")
	model.mybus.MyBusDao myBusDao;

	@RequestMapping("/myBusEditPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String driver = request.getParameter("driver");
		request.setAttribute("driver", driver);
		MultipartRequest multi;
		int result = -1;
		int profileResult = -1;
		int channelResult = -1;

		MemberDto dto = new MemberDto();
		dto.setEmail(driver);
		
		// 이미지
		try {
			// 이미지 업로드
			multi = new FileUpload().getMultipartRequest(request);

			if (multi.getFile("upload") != null) {
				String imglocation = multi.getFilesystemName("upload");
				// 이미지 사이즈 조정
				imglocation = new ImageResize().resize(request, imglocation, 1, 900);
				request.setAttribute("driver", driver);
				dto.setImglocation(imglocation);
				result = myBusDao.imgLocationUpdate(dto);
			}

			// 닉네임, 패스워드
			String nick = multi.getParameter("nick");
			String passwd = multi.getParameter("passwd");
			dto.setNick(nick);
			dto.setPasswd(passwd);

			profileResult = myBusDao.updateProfile(dto);

			// 유투브 채널 수정
			String channel_id = multi.getParameter("channel_id");
			ChannelDto chdto = new ChannelDto();
			chdto.setChannel_id(channel_id);
			chdto.setDriver(driver);

			if (myBusDao.checkChannel(driver) == 1) {
				// 기존에 채널이 등록되어 있었는데
				if (channel_id.equals("")) {
					// 아무것도 입력하지 않은 경우 딜리트
					channelResult = myBusDao.deleteChannelid(driver);
				} else {
					// 새로 입력한 경우 업데이트
					channelResult = myBusDao.updateChannel(chdto);
				}
			} else {
				if(channel_id!=null){
					if (!channel_id.equals("")) {
						// 기존에 채널이 등록되어 있지 않았는데 새로 입력한 경우 인서트
						channelResult = myBusDao.insertChannel(chdto);
					}
				}
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("result", result);
		request.setAttribute("profileResult", profileResult);
		request.setAttribute("channelResult", channelResult);

		return new ModelAndView("myBusEditPro");
	}
}
