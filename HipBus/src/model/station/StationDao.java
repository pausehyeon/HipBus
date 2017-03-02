package model.station;

import java.util.List;
import java.util.Map;

import model.LikeDto;
import model.MemberDto;
import model.ReplyDto;
import model.StationDto;

public interface StationDao {
	public int getCount();
	public List<StationDto> getArticles( Map<String, Integer> map );
	public List<StationDto> topGetArticles( Map<String, Integer> map );
	public List<StationDto> getArticles1( Map<String, Integer> map );
	public List<StationDto> getArticles2( Map<String, Integer> map );
	public List<StationDto> getArticles3( Map<String, Integer> map );
	public List<StationDto> getArticles4( Map<String, Integer> map );
	public List<StationDto> getArticles5( Map<String, Integer> map );
	public List<StationDto> getArticles6( Map<String, Integer> map );
	public StationDto getArticle( int num );
	public void addCount(int num);
	public int insertArticle(StationDto dto);
	public MemberDto getMember(String email);
	public int updateArticle(StationDto dto);
	public int deleteArticle( int num );
	public int category(int category);
	public List<StationDto> getSearch(Map<String, Object> smap);
	public List<StationDto> getSearch1(Map<String, Object> smap);
	public List<StationDto> getSearch2(Map<String, Object> smap);
	public List<StationDto> getSearch3(Map<String, Object> smap);
	public List<StationDto> getSearch4(Map<String, Object> smap);
	public List<StationDto> getSearch5(Map<String, Object> smap);
	public List<StationDto> getSearch6(Map<String, Object> smap);
	public int searchNum(Map<String, String> nmap);
	public int searchNum1(Map<String, String> nmap);
	public int searchNum2(Map<String, String> nmap);
	public int searchNum3(Map<String, String> nmap);
	public int searchNum4(Map<String, String> nmap);
	public int searchNum5(Map<String, String> nmap);
	public int searchNum6(Map<String, String> nmap);
	public void addLike( int num);
	public int likeArticle(LikeDto dto);
	public int getLike(LikeDto dto);
	public List<ReplyDto> getReplys( int num);
	public int replyInsert(ReplyDto dto);
	public int getReplyCount();
	public ReplyDto getLastReply( int num );
	public int modifyReply( ReplyDto dto);
	public int deleteReply( int ref_num );
	public int infDeleteReply( int replynum );
	public ReplyDto getReply(int replynum);
	public List<ReplyDto> getInfReplys( int ref_num );
	public int infReplyInsert( ReplyDto dto );
	public int countMem(String email);
	public int addMem( String email);
	//알람
	public List<StationDto> replyAlrams(String email);
	public int getAlrams(String email);
	public void addStatus( int num);
	public int upStatus(int replynum);
}
