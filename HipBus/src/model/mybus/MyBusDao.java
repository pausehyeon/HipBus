package model.mybus;

import java.util.List;
import java.util.Map;

import model.BoardDto;
import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.StationDto;
import model.UpcomingDto;

public interface MyBusDao {
	public List<BoardDto> getBoardList( Map<String, String> map );
	public BoardDto getLastBoard( String driver );
	public MemberDto getMember( String email );
	public int appendBoard( BoardDto dto );
	public int deleteBoard( int num );
	public int modifyBoard( BoardDto dto );
	public String getChannelid( String driver );
	public int isHop( Map<String,String> map );
	public int hopOn( Map<String,String> map );
	public int hopOff( Map<String,String> map );
	public List<CrewDto> getMyCrews(String driver);
	public List<CrewMemberDto> getMyMembers(Map<String, String> map);
	public List<String> getTags(String driver);
	public List<MemberDto> getPassengers(String driver);
	public int getArticleCount(String driver);
	public List<StationDto> getArticles(Map<String,String> map);
	public int writeUpcoming(UpcomingDto dto);
	public UpcomingDto getUpcoming(int num);
	public List<UpcomingDto> getUpcomings();
	public UpcomingDto getNewUpcoming(String driver);
}
