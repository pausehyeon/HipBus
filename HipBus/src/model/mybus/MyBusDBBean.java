package model.mybus;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.BoardDto;
import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.SqlMapClient;
import model.StationDto;
import model.UpcomingDto;
import model.WantedDto;

@Component("myBusDao")
public class MyBusDBBean implements MyBusDao {
	public List<BoardDto> getBoardList( Map<String, String> map ) {
		return SqlMapClient.getSession().selectList("MyBus.getBoards", map);
	}
	public BoardDto getLastBoard( String driver ) {
		return SqlMapClient.getSession().selectOne("MyBus.getLastBoard", driver);
	}
	public MemberDto getMember( String email ){
		return SqlMapClient.getSession().selectOne("MyBus.getMember", email);
	}
	public int appendBoard( BoardDto dto ) {
		return SqlMapClient.getSession().insert("MyBus.appendBoard", dto);
	}
	public int deleteBoard( int num ) {
		return SqlMapClient.getSession().delete("MyBus.deleteBoard", num);
	}
	public int modifyBoard( BoardDto dto ){
		return SqlMapClient.getSession().update("MyBus.modifyBoard", dto);
	}
	public String getChannelid( String driver ) {
		return SqlMapClient.getSession().selectOne("MyBus.getChannelid", driver);
	}
	public int isHop( Map<String,String> map ){
		return SqlMapClient.getSession().selectOne("MyBus.isHop",map);
	}
	public int hopOn( Map<String,String> map ){
		return SqlMapClient.getSession().insert("MyBus.hopOn",map);
	}
	public int hopOff( Map<String,String> map ){
		return SqlMapClient.getSession().delete("MyBus.hopOff",map);
	}
	public List<CrewDto> getMyCrews(String driver){
		return SqlMapClient.getSession().selectList("MyBus.getMyCrews", driver);
	}
	public List<CrewMemberDto> getMyMembers(Map<String, String> map){
		return SqlMapClient.getSession().selectList("MyBus.getMyMembers", map);
	}
	public List<String> getTags(String driver){
		return SqlMapClient.getSession().selectList("MyBus.getTags", driver);
	}
	public List<MemberDto> getPassengers(String driver){
		return SqlMapClient.getSession().selectList("MyBus.getPassengers", driver);
	}
	public int getArticleCount(String driver){
		return SqlMapClient.getSession().selectOne("MyBus.getArticleCount", driver);
	}
	public List<StationDto> getArticles(Map<String,String> map){
		return SqlMapClient.getSession().selectList("MyBus.getArticles", map);
	}
	public int writeUpcoming(UpcomingDto dto){
		return SqlMapClient.getSession().insert("MyBus.writeUpcoming", dto);
	}
	public UpcomingDto getUpcoming(int num) {
		return SqlMapClient.getSession().selectOne("MyBus.getUpcoming", num);
	}
	public List<UpcomingDto> getUpcomings(String driver){
		return SqlMapClient.getSession().selectList("MyBus.getUpcomings", driver);
	}
	public UpcomingDto getNewUpcoming(String driver){
		return SqlMapClient.getSession().selectOne("MyBus.getNewUpcoming", driver);
	}
	public int modUpcomingWithout (UpcomingDto dto){
		return SqlMapClient.getSession().update("MyBus.modUpcomingWithout", dto);
	}
	public int modUpcomingWith (UpcomingDto dto){
		return SqlMapClient.getSession().update("MyBus.modUpcomingWith", dto);
	}
	public int delUpcoming (int num) {
		return SqlMapClient.getSession().delete("MyBus.delUpcoming", num);
	}
	public int deleteEmail (String email) {
		return SqlMapClient.getSession().delete("MyBus.deleteEmail", email);
	}
	public int deleteDriver (String email) {
		return SqlMapClient.getSession().delete("MyBus.deleteDriver", email);
	}
	@Override
	public int insertWantedArticle(WantedDto article) {
		return SqlMapClient.getSession().insert("MyBus.insertWantedArticle", article);
	}
	@Override
	public WantedDto getWantedArticle(int num) {
		return SqlMapClient.getSession().selectOne("MyBus.getWantedArticle", num);
	}
	@Override
	public List<WantedDto> getWantedArticles(String driver) {
		return SqlMapClient.getSession().selectList("MyBus.getWantedArticles", driver);
	}
	@Override
	public int modifyWantedWholeArticle(WantedDto article) {
		return SqlMapClient.getSession().update("MyBus.modifyWantedWholeArticle", article);
	}
	@Override
	public int modifyWantedArticle(WantedDto article) {
		return SqlMapClient.getSession().update("MyBus.modifyWantedArticle", article);
	}
	@Override
	public int deleteWantedArticle(int num) {
		return SqlMapClient.getSession().delete("MyBus.deleteWantedArticle", num);
	}
	public int beforeEditCheck (String passwd) {
		return SqlMapClient.getSession().selectOne("MyBus.beforeEditCheck", passwd);
	}
}
