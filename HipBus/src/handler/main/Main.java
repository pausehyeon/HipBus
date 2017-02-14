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
import model.NewsDto;
import model.TopDriversDto;
import model.general.GeneralDao;
import model.main.MainDao;

@Controller
public class Main implements CommandHandler {

	@Resource(name = "mainDao")
	private MainDao dao;

	@Resource(name = "generalDao")
	private GeneralDao generalDao;

	@RequestMapping("/main.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String memEmail = (String) request.getSession().getAttribute("memEmail");

		if (memEmail != null) {
			// navbar_main
			List<CrewDto> myCrews = generalDao.getMyCrews(memEmail);
			if (myCrews == null || myCrews.size() == 0) {
				// 속한 크루가 하나도 없으면
				request.setAttribute("hasMyCrew", 0);
			} else {
				// 속한 크루가 하나라도 있으면
				request.setAttribute("hasMyCrew", 1);
				request.setAttribute("myCrews", myCrews);
			}

			// 개인 정보
			MemberDto member = generalDao.getMember(memEmail);
			request.setAttribute("member", member);
		}

		// News
		List<NewsDto> newsArticles = dao.getNewsArticles();
		if (newsArticles == null || newsArticles.size() == 0) {
			// 만일 공지사항이 하나도 없으면
			request.setAttribute("hasNewsArticle", 0);
		} else {
			request.setAttribute("hasNewsArticle", 1);
			request.setAttribute("newsArticles", newsArticles);
			for (int i = 0; i < newsArticles.size(); i++) {
				NewsDto newsArticle = newsArticles.get(i);
				if (newsArticle.getImglocation() != null ) {
					if(!newsArticle.getImglocation().contains("hipbusSave/")){
						newsArticle.setImglocation("hipbusSave/" + newsArticle.getImglocation());
					}
				} else {
					newsArticle.setImglocation("view/img/notice2.png"); // 기본
					// 이미지
				}
			}
		}

		// Top Drivers
		List<TopDriversDto> topdrivers = dao.getTopDrivers();
		if (topdrivers == null || topdrivers.size() == 0) {
			request.setAttribute("hasTopDriver", 0);
		} else {
			request.setAttribute("hasTopDriver", 1);
			for (int i = 0; i < topdrivers.size(); i++) {
				TopDriversDto topdriver = topdrivers.get(i);
				// 만약 topdriver.driver 값에 @가 포함되면 개인이고 포함되지 않으면 crew임.
				boolean isNotCrew = topdriver.getDriver().contains("@");

				String imglocation = "view/img/HipBusLogo_colored_sq.png";

				if (isNotCrew) {
					//개인인 경우
					MemberDto topMember = generalDao.getMember(topdriver.getDriver());

					if (topMember.getImglocation() != null) {
						imglocation = "hipbusSave/" + topMember.getImglocation();
					}
					topdriver.setNick(topMember.getNick());
					topdriver.setUrl("myBus.do?driver=" + topMember.getEmail());
				} else {
					//크루인 경우
					CrewDto topCrew = dao.getCrew(topdriver.getDriver());
					if (topCrew.getImglocation() != null) {
						imglocation = "hipbusSave/" + topCrew.getImglocation();
					}
					topdriver.setNick(topCrew.getCrewname());
					topdriver.setUrl("crewBus.do?driver=" + topCrew.getCrewid());
				}
				topdriver.setImglocation(imglocation);
				topdrivers.remove(i);
				topdrivers.add(topdriver);
			}
			request.setAttribute("topdrivers", topdrivers);
		}

		return new ModelAndView("main");
	}
}
