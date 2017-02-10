package model.main;

import org.springframework.stereotype.Component;

import model.MemberDto;
import model.SqlMapClient;

@Component( "MainDao" )
public class MainDBBean implements MainDao{
	
	public int insertMember( MemberDto dto ) {
		return SqlMapClient.getSession().insert( "Main.insertMember", dto );
	}
	

}
