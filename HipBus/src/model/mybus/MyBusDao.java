package model.mybus;

import java.util.List;
import java.util.Map;

import model.BoardDto;
import model.ChannelDto;
import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.StationDto;
import model.UpcomingDto;
import model.WantedDto;

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
	public List<UpcomingDto> getUpcomings(String driver);
	public UpcomingDto getNewUpcoming(String driver);
	public int modUpcomingWithout (UpcomingDto dto);
	public int modUpcomingWith (UpcomingDto dto);
	public int delUpcoming (int num);
	public int deleteEmail (String email);
	public int deleteDriver (String email);
	public int insertWantedArticle(WantedDto article);
	public WantedDto getWantedArticle(int num);
	public List<WantedDto> getWantedArticles(String driver);
	public int modifyWantedWholeArticle(WantedDto article);
	public int modifyWantedArticle(WantedDto article);
	public int deleteWantedArticle(int num);
	public int imgLocationUpdate(MemberDto imglocation);
	public int updateNick(MemberDto nick);
	public void readWanted (int num);
	public void readUpcoming (int num);
	public WantedDto getNewWanted(String driver);
	public int insertChannel(ChannelDto dto);
}
