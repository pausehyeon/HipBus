package model.main;

import model.MemberDto;
import model.SqlMapClient;

public class MainDBBean implements MainDao{
	
	public int insertMember( MemberDto dto ) {
		return SqlMapClient.getSession().insert( "HipBus.insertMember", dto );
	}
	

}
