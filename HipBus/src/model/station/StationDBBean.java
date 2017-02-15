package model.station;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.MemberDto;
import model.SqlMapClient;
import model.StationDto;



@Component("stationDao")
public class StationDBBean implements StationDao {
		
	public int getCount() {
		return SqlMapClient.getSession().selectOne( "Station.getCount" );
	}
	public List<StationDto> getArticles( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles", map );
	}	
	
	public StationDto getArticle( int num ) {
		return SqlMapClient.getSession().selectOne( "Station.getArticle", num );	
	}
	
	public void addCount(int num) {
		SqlMapClient.getSession().update( "Station.addCount", num );
	}
	
	public int insertArticle( StationDto dto ) {
		return SqlMapClient.getSession().insert( "Station.insertArticle", dto );
		
	}
	
	@Override
	public MemberDto getMember(String email) { //nick값 불러오기위해씀
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Station.getMember",email);
	}
	
	public int updateArticle( StationDto dto ) {
		return SqlMapClient.getSession().update( "Station.updateArticle", dto );				
	}

	public int deleteArticle( int num ) {
		return SqlMapClient.getSession().delete( "Station.deleteArticle", num );
	}
	@Override
	public int category( int category) {
		return  SqlMapClient.getSession().selectOne("Station.category", category);
	}
	
	
}
