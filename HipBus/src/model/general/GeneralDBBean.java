package model.general;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import model.ChannelDto;
import model.CrewDto;
import model.MemberDto;
import model.SqlMapClient;

@Component("generalDao")
public class GeneralDBBean implements GeneralDao {
	SqlSession session = SqlMapClient.getSession();
	
	@Override
	public MemberDto getMember(String email) {
		return session.selectOne( "General.getMember", email );
	}
	
	@Override
	public CrewDto getCrew(String crewid) {
		return session.selectOne("General.getCrew", crewid);
	}

	@Override
	public int verifyEmail(String id) {
		return session.selectOne("General.verifyEmail", id);
	}

	@Override
	public int verifyNick(String nick) {
		return session.selectOne("General.verifyNick", nick);
	}

	@Override
	public int checkEmailPasswd(String email, String passwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", passwd);
		return session.selectOne("General.checkEmailPasswd", map);
	}
	
	@Override
	public List<CrewDto> getMyCrews(String email) {
		return session.selectList("General.getMyCrews", email);
	}
	
	@Override
	public List<ChannelDto> getChannels() {
		return session.selectList("General.getChannels");
	}
}
