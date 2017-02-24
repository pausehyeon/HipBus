package handler.general;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.CrewDto;
import model.MemberDto;
import model.general.GeneralDao;

@Controller
public class Top implements CommandHandler {

	@Resource(name = "generalDao")
	private GeneralDao dao;

	@RequestMapping("/top.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String memEmail = (String) request.getSession().getAttribute("memEmail");
	

		if (memEmail != null) {
			// 로그인 된 상태에서
			List<CrewDto> myCrews = dao.getMyCrews(memEmail);
			request.setAttribute("myCrews", myCrews);

			MemberDto member = dao.getMember(memEmail);
			request.setAttribute("member", member);
			
			List<CrewDto> hoppedOnCrews = dao.getHoppedOnCrews(memEmail);
			request.setAttribute("hoppedOnCrews", hoppedOnCrews);
			
			List<MemberDto> hoppedOnMembers = dao.getHoppedOnMembers(memEmail);
			request.setAttribute("hoppedOnMembers", hoppedOnMembers);
			
			
		}

		return new ModelAndView("top");
	}

}
