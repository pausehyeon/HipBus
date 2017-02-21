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
	public StationDto getArticle( int num );
	public void addCount(int num);
	public int insertArticle(StationDto dto);
	public MemberDto getMember(String email);
	public int updateArticle(StationDto dto);
	public int deleteArticle( int num );
	public int category(int category);
	public void addLike( int num);
	public int likeArticle(LikeDto dto);
	public int getLike(LikeDto dto);
	public List<ReplyDto> getReplys( int num);
	public int replyInsert(ReplyDto dto);
	public int getReplyCount();
	public ReplyDto getLastReply( int num );
	public int modifyReply( ReplyDto dto);
	public int deleteReply( int replynum );
	public ReplyDto getReply(int replynum);
	public List<ReplyDto> getInfReplys( int ref_num );
}
