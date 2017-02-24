package model.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

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
	public int insertDriver( String email ) {
		return SqlMapClient.getSession().insert( "Main.insertDriver", email );
	}
	
	@Override
	public int emailValidate( Map<String, String> ms ) {
		return SqlMapClient.getSession().insert( "Main.emailValidate", ms );
	}
	
	@Override
	public int emailCheck( Map<String, String> emailCheck ) {
		return SqlMapClient.getSession().selectOne( "Main.emailCheck", emailCheck );
	}
	
	@Override
	public int codeUpdate( String email ) {
		return SqlMapClient.getSession().insert( "Main.codeUpdate", email );
	}
	
	@Override
	public List<TopDriversDto> getTopDrivers() {
		return SqlMapClient.getSession().selectList("Main.getTopDrivers");
	}
	
	@Override
	public List<NewsDto> getNewsArticles() {
		return SqlMapClient.getSession().selectList("Main.getNewsArticles");
	}
	
	@Override
	public List<UpcomingDto> getUpcomings() {
		return SqlMapClient.getSession().selectList("Main.getUpcomings");
	}
	public int forgotPasswd(String email){
		return SqlMapClient.getSession().selectOne("Main.forgotPasswd", email);
	}
	public int forgotPasswdUpdate(Map<String, String> ms){
		return SqlMapClient.getSession().update("Main.forgotPasswdUpdate",ms);		
	}
	
}
