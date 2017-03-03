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
import model.ChannelDto;
import model.CrewDto;
import model.MemberDto;
import model.NewsDto;
import model.TopDriversDto;
import model.UpcomingDto;
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
			request.setAttribute("myCrews", myCrews);

			// 개인 정보
			MemberDto member = generalDao.getMember(memEmail);
			request.setAttribute("member", member);
		}

		// News
		List<NewsDto> newsArticles = dao.getNewsArticles();
		request.setAttribute("newsArticles", newsArticles);

		// OnAir
		// 채널리스트 넘겨주기
		List<ChannelDto> channels = generalDao.getChannels();

		String channelsJson = "[";
		for (int i = 0; i < channels.size(); i++) {
			ChannelDto channel = channels.get(i);
			channelsJson += "{ driver : '" + channel.getDriver() + "', channel_id : '" + channel.getChannel_id()
					+ "' }";
			if (i < channels.size() - 1) {
				channelsJson += ", ";
			}
		}
		channelsJson += "]";
		request.setAttribute("channelsJson", channelsJson);

		// Top Drivers
		List<TopDriversDto> topdrivers = dao.getTopDrivers();
		
		for (int i = 0; i < topdrivers.size(); i++) {
			TopDriversDto topdriver = topdrivers.get(i);
			// 만약 topdriver.driver 값에 @가 포함되면 개인이고 포함되지 않으면 crew임.
			if (topdriver.getDriver().contains("@")) {
				// 개인인 경우
				MemberDto topMember = generalDao.getMember(topdriver.getDriver());
				topdriver.setNick(topMember.getNick());
				topdriver.setImglocation(topMember.getImglocation());
			} else {
				// 크루인 경우
				CrewDto topCrew = generalDao.getCrew(topdriver.getDriver());
				topdriver.setNick(topCrew.getCrewname());
				topdriver.setImglocation(topCrew.getImglocation());
			}
			topdrivers.remove(i);
			topdrivers.add(i, topdriver);
		}
		request.setAttribute("topdrivers", topdrivers);

		// Upcoming
		List<UpcomingDto> upcomings = dao.getUpcomings();
		request.setAttribute("upcomings", upcomings);

		return new ModelAndView("main");
	}
}
