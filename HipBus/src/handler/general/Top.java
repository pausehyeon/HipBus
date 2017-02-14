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
	
	@Resource(name="generalDao")
	private GeneralDao dao;
	
	@RequestMapping("/top.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String memEmail = (String) request.getSession().getAttribute("memEmail");
		String imglocation = "";

		if (memEmail != null) {
			// 로그인 된 상태에서
			List<CrewDto> myCrews = dao.getMyCrews(memEmail);
			if(myCrews == null || myCrews.size() == 0){
				// 속한 크루가 하나도 없으면
				request.setAttribute("hasMyCrew", 0);
			}else{
				imglocation = "view/img/HipBusLogo_colored_sq.png";	//크루 이미지 없는 경우 기본 이미지
				for(int i=0; i<myCrews.size(); i++){
					CrewDto myCrew = myCrews.get(i);
					if( myCrew.getImglocation() == null ){
						//프로필 사진이 없는 경우 기본 이미지로 대체
						myCrew.setImglocation(imglocation);
						myCrews.remove(i);
						myCrews.add(myCrew);
					}
				}
				
				// 속한 크루가 하나라도 있으면
				request.setAttribute("hasMyCrew", 1);
				request.setAttribute("myCrews", myCrews);
			}
			
			MemberDto member = dao.getMember(memEmail);
			if(member.getImglocation() == null){
				imglocation = "view/img/HipBusLogo_colored_sq.png";	//프로필 이미지 없는 경우 기본 이미지
				member.setImglocation(imglocation);
			}
			request.setAttribute("member", member);
			
		}
		
		return new ModelAndView("top");
	}

}
