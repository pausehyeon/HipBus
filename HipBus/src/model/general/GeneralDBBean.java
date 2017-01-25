package model.general;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import model.SqlMapClient;

@Component("generalDao")
public class GeneralDBBean implements GeneralDao{
	@Override
	public int verifyEmail(String id) {
		SqlSession session = SqlMapClient.getSession();
		int result = session.selectOne("General.verifyEmail", id);
		return result;
	}
	@Override
	public int verifyNick(String nick) {
		SqlSession session = SqlMapClient.getSession();
		return session.selectOne("General.verifyNick", nick);
	}
}
