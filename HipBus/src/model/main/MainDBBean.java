package model.main;

import java.util.List;

import org.springframework.stereotype.Component;

import model.CrewDto;
import model.MemberDto;
import model.NewsDto;
import model.SqlMapClient;
import model.TopDriversDto;
import model.UpcomingDto;

@Component( "mainDao" )
public class MainDBBean implements MainDao{
	
	@Override
	public int insertMember( MemberDto dto ) {
		return SqlMapClient.getSession().insert( "Main.insertMember", dto );
	}
	
	@Override
	public List<TopDriversDto> getTopDrivers() {
		return SqlMapClient.getSession().selectList("Main.getTopDrivers");
	}

	@Override
	public CrewDto getCrew(String crewid) {
		return SqlMapClient.getSession().selectOne("Main.getCrew", crewid);
	}
	
	@Override
	public List<NewsDto> getNewsArticles() {
		return SqlMapClient.getSession().selectList("Main.getNewsArticles");
	}
	
	@Override
	public List<UpcomingDto> getUpcomings() {
		return SqlMapClient.getSession().selectList("Main.getUpcomings");
	}
}
