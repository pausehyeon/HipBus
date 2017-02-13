package model.main;

import java.util.List;

import org.springframework.stereotype.Component;

import model.CrewDto;
import model.MemberDto;
import model.SqlMapClient;
import model.TopDriversDto;

@Component( "mainDao" )
public class MainDBBean implements MainDao{
	
	@Override
	public int insertMember( MemberDto dto ) {
		return SqlMapClient.getSession().insert( "Main.insertMember", dto );
	}
	
	@Override
	public MemberDto getMember(String email) {
		return SqlMapClient.getSession().selectOne( "Main.getMember", email );
	}
	
	@Override
	public List<TopDriversDto> getTopDrivers() {
		return SqlMapClient.getSession().selectList("Main.getTopDrivers");
	}

	@Override
	public CrewDto getCrew(String crewid) {
		return SqlMapClient.getSession().selectOne("Main.getCrew", crewid);
	}
}
