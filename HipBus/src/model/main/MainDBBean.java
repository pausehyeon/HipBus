package model.main;

import org.springframework.stereotype.Component;

import model.MemberDto;
import model.SqlMapClient;

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
	

}
