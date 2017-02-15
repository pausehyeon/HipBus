package handler.garage;

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
import model.general.GeneralDao;

@Controller
public class GarageOnAir implements CommandHandler {
	@Resource(name = "generalDao")
	private GeneralDao generalDao;

	@RequestMapping("/garageOnAir.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		// OnAir
		// 채널리스트 넘겨주기
		List<ChannelDto> channels = generalDao.getChannels();

		String channelsJson = "[";
		for (int i = 0; i < channels.size(); i++) {
			ChannelDto channel = channels.get(i);
			String driver = channel.getDriver();
			String url = "";
			String nick = "";
			if(driver.contains("@")){
				//개인이면
				url = "myBus.do?driver="+driver;
				nick = generalDao.getMember(driver).getNick();
			}else{
				//크루면
				url = "crewBus.do?driver="+driver;
				nick = generalDao.getCrew(driver).getCrewname();
			}
			channelsJson += "{ nick : '" + nick + "', url: '"+ url +"',channel_id : '" + channel.getChannel_id()
					+ "' }";
			if (i < channels.size() - 1) {
				channelsJson += ", ";
			}
		}
		channelsJson += "]";
		request.setAttribute("channelsJson", channelsJson);

		return new ModelAndView("garageOnAir");
	}

}
