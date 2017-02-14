package handler.main;

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
import model.TopDriversDto;
import model.main.MainDao;

@Controller
public class Main implements CommandHandler{
	
	@Resource(name="mainDao")
	private MainDao dao;
	
	@RequestMapping("/main.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String memEmail = (String) request.getSession().getAttribute("memEmail");
		
		if(memEmail != null){
			MemberDto member = dao.getMember(memEmail);
			request.setAttribute("member", member );			
		}
		
		List<TopDriversDto> topdrivers = dao.getTopDrivers();
		
		for(int i=0; i<topdrivers.size(); i++){
			TopDriversDto topdriver = topdrivers.get(i);
			topdrivers.remove(i);
			
			//만약 topdriver.driver 값에 @가 포함되면 개인이고 포함되지 않으면 crew임.
			boolean isNotCrew = topdriver.getDriver().contains("@");
			
			String imglocation = "view/img/HipBusLogo_colored_sq.png";
			
			if(isNotCrew){
				MemberDto topMember = dao.getMember(topdriver.getDriver());
				
				if(topMember.getImglocation() != null) imglocation = "hipbusSave/"+topMember.getImglocation();
				topdriver.setNick( topMember.getNick() );
				topdriver.setUrl("myBus.do?driver="+topMember.getEmail());
			}else{
				CrewDto topCrew = dao.getCrew(topdriver.getDriver());
				if(topCrew.getImglocation() != null) imglocation = "hipbusSave/"+topCrew.getImglocation();
				topdriver.setNick( topCrew.getCrewname() );
				topdriver.setUrl("crewBus.do?driver="+topCrew.getCrewid());
			}
			
			topdriver.setImglocation(imglocation);
			
			topdrivers.add(topdriver);
		}
		
		request.setAttribute("topdrivers", topdrivers);
		
		return new ModelAndView("main");
	}
}
