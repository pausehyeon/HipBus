package handler.crewbus;

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
import model.CrewDto;
import model.MemberDto;
import model.crewbus.CrewBusDao;
import model.general.FileUpload;
import model.general.ImageResize;
import model.mybus.MyBusDao;

@Controller
public class CrewBusEditPro implements CommandHandler {

	@Resource(name = "crewBusDao")
	private CrewBusDao dao;
	@Resource(name = "myBusDao")
	private MyBusDao myBusDao;

	@RequestMapping("/crewBusEditPro.do")
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

		CrewDto dto = new CrewDto();
		dto.setCrewid(driver);

		// 이미지 업로드
		try {
			multi = new FileUpload().getMultipartRequest(request);

			if (multi.getFile("upload") != null) {
				String imglocation = multi.getFilesystemName("upload");
				// 이미지 사이즈 조정
				imglocation = new ImageResize().resize(request, imglocation, 1, 900);
				dto.setImglocation(imglocation);
				result = dao.updateImglocation(dto);
			}

			// 크루이름 수정
			String crewname = multi.getParameter("crewname");
			dto.setCrewname(crewname);

			profileResult = dao.updateCrewname(dto);

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
				if(!channel_id.equals("")){
					// 기존에 채널이 등록되어 있지 않았는데 새로 입력한 경우 인서트
					channelResult = myBusDao.insertChannel(chdto);
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("result", result);
		request.setAttribute("profileResult", profileResult);
		request.setAttribute("channelResult", channelResult);

		return new ModelAndView("crewBusEditPro");
	}

}
