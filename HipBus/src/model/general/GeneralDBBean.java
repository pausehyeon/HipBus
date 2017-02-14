package model.general;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import model.CrewDto;
import model.SqlMapClient;

@Component("generalDao")
public class GeneralDBBean implements GeneralDao {
	SqlSession session = SqlMapClient.getSession();

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
}
