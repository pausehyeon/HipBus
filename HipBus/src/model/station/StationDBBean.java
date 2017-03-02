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
	public List<StationDto> topGetArticles( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.topGetArticles", map );
	}
	
	public List<StationDto> getArticles1( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles1", map );
	}
	public List<StationDto> getArticles2( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles2", map );
	}
	public List<StationDto> getArticles3( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles3", map );
	}
	public List<StationDto> getArticles4( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles4", map );
	}
	public List<StationDto> getArticles5( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles5", map );
	}
	public List<StationDto> getArticles6( Map<String, Integer> map ) {
		return SqlMapClient.getSession().selectList( "Station.getArticles6", map );
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
	
	// 검색
	public List<StationDto> getSearch(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch", smap);
	}//검색
	public List<StationDto> getSearch1(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch1", smap);
	}
	public List<StationDto> getSearch2(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch2", smap);
	}
	public List<StationDto> getSearch3(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch3", smap);
	}
	public List<StationDto> getSearch4(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch4", smap);
	}
	public List<StationDto> getSearch5(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch5", smap);
	}
	public List<StationDto> getSearch6(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Station.getSearch6", smap);
	}
	public int searchNum(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum", nmap);
	}//검색되는 페이지 수
	public int searchNum1(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum1", nmap);
	}//검색되는 페이지 수
	public int searchNum2(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum2", nmap);
	}
	public int searchNum3(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum3", nmap);
	}
	public int searchNum4(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum4", nmap);
	}
	public int searchNum5(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum5", nmap);
	}
	public int searchNum6(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Station.searchNum6", nmap);
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
				ref_num = (Integer) SqlMapClient.getSession().selectOne("Station.reMaxNum");				
			} else {
				// 글이 없는 경우
				ref_num = (Integer) SqlMapClient.getSession().selectOne("Station.reMaxNum");
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
	
	public int deleteReply(int ref_num) {
		return SqlMapClient.getSession().delete("Station.deleteReply", ref_num);	
		
	}
	public int infDeleteReply(int replynum) {
		return SqlMapClient.getSession().delete("Station.infDeleteReply", replynum);	
		
	}
	// 알람
	public List< StationDto > replyAlrams(String email) {
		return SqlMapClient.getSession().selectList("Station.replyAlrams", email);
	}
	public int getAlrams(String email){
		return SqlMapClient.getSession().selectOne("Station.getAlrams", email);
	}
	public void addStatus(int num){
		SqlMapClient.getSession().update("Station.addStatus", num);
	}
	public int upStatus(int replynum){
		return SqlMapClient.getSession().update("Station.upStatus", replynum);
	}
	// 대댓글
		public List<ReplyDto> getInfReplys( int ref_num ) {
			return SqlMapClient.getSession().selectList( "Station.getInfReplys", ref_num );
		}
		public int infReplyInsert( ReplyDto dto ) {
			int re_level = dto.getRe_level();	// 글레벨
			int replynum = dto.getReplynum();
			if( replynum == 0 ) {
				// 제목글			
				if( getInfReplyCount() != 0 ) {
					// 글이 있는 경우
					// 그룹화아이디 = 글번호최대값 + 1
					re_level = (Integer) SqlMapClient.getSession().selectOne( "Station.maxNum" ) + 1;				
				} else {
					// 글이 없는 경우
					re_level = (Integer) SqlMapClient.getSession().selectOne("Station.reMaxNum");
				}					
			}			
			dto.setRe_level( re_level );
			return SqlMapClient.getSession().insert( "Station.infReplyInsert", dto );
			
		}
		public int getInfReplyCount() {
			return SqlMapClient.getSession().selectOne( "Station.getInfReplyCount" );
		}
		// 멤레벨
		public int countMem(String email) {
			return SqlMapClient.getSession().selectOne( "Station.countMem", email );
		}
		public int addMem(String email) {
			return SqlMapClient.getSession().update( "Station.addMem",email );
		}

}
