package model.station;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.LikeDto;
import model.MemberDto;
import model.ReplyDto;
import model.SqlMapClient;
import model.StationDto;



@Component("stationDao")
public class StationDBBean implements StationDao {
		
	public int getCount() {
		return SqlMapClient.getSession().selectOne( "Station.getCount" );
	}
	public int getReplyCount() {
		return SqlMapClient.getSession().selectOne( "Station.getReplyCount" );
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
	
	public void addLike(int num) {
		SqlMapClient.getSession().update( "Station.addLike", num );
	}
	
	public int likeArticle( LikeDto dto ) {
		return SqlMapClient.getSession().insert( "Station.likeArticle", dto );
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
	
	
	public int getLike( LikeDto num ) {
		return SqlMapClient.getSession().selectOne( "Station.getLike", num );	
	}
	
	public List<ReplyDto> getReplys( int num ) {
		return SqlMapClient.getSession().selectList( "Station.getReplys", num );
	}
	
	public int replyInsert( ReplyDto dto ) {
		int replynum = dto.getReplynum();	// 제목글 / 답변글
		int ref_num = dto.getRef_num();		// 그룹화 아이디
		int re_step = dto.getRe_step();		// 글순서
		int re_level = dto.getRe_level();	// 글레벨
		
		if( replynum == 0 ) {
			// 제목글			
			if( getReplyCount() != 0 ) {
				// 글이 있는 경우
				// 그룹화아이디 = 글번호최대값 + 1
				ref_num = (Integer) SqlMapClient.getSession().selectOne( "Station.maxNum" ) + 1;				
			} else {
				// 글이 없는 경우
				ref_num = 1;
			}				
			re_step = 0;
			re_level = 0;
		} else {			
			SqlMapClient.getSession().update( "Station.updateReply", dto );	
			re_step ++;
			re_level ++;				
		}			
		
		dto.setRef_num( ref_num );
		dto.setRe_step( re_step );
		dto.setRe_level( re_level );
		return SqlMapClient.getSession().insert( "Station.replyInsert", dto );
		
	}
	public ReplyDto getLastReply( int num ) {
		return SqlMapClient.getSession().selectOne("Station.getLastReply", num);
	}
	
	public int modifyReply( ReplyDto dto ){
		return SqlMapClient.getSession().update("Station.modifyReply", dto);
	}
	
	public ReplyDto getReply( int replynum ) {
		return SqlMapClient.getSession().selectOne( "Station.getReply", replynum );	
	}
	
	public int deleteReply(int replynum) {
		int result = 0;
		ReplyDto dto = getReply( replynum );
		SqlMapClient.getSession().update( "Station.deleteReplyArticle", dto );
		result = SqlMapClient.getSession().delete("Station.deleteReply", replynum);	
		return result;
	}
	// 대댓글
		public List<ReplyDto> getInfReplys( int ref_num ) {
			return SqlMapClient.getSession().selectList( "Station.getInfReplys", ref_num );
		}

}
