package model.main;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import model.SqlMapClient;

@Component("mainDao")
public class MainDBBean implements MainDao{
	@Override
	public int verifyEmail(String id) {
		SqlSession session = SqlMapClient.getSession();
		int result = session.selectOne("Main.verifyEmail", id);
		return result;
	}
	
}
