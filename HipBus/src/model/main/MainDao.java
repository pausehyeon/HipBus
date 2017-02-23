package model.main;

import java.util.List;
import java.util.Map;

import model.MemberDto;
import model.NewsDto;
import model.TopDriversDto;
import model.UpcomingDto;

public interface MainDao {
	
	public int emailValidate( Map<String, String> ms );
	public int insertMember( MemberDto dto );
	public int insertDriver( String email );
	public List<TopDriversDto> getTopDrivers();
	public List<NewsDto> getNewsArticles();
	public List<UpcomingDto> getUpcomings();
	public int emailCheck( Map<String, String> emailCheck );
	public int codeUpdate( String email );
	public int forgotPasswd(String email);
	public int forgotPasswdUpdate(Map<String, String> ms);
}
