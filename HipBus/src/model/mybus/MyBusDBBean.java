package model.mybus;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.BoardDto;
import model.ChannelDto;
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
	public List<UpcomingDto> getPastUpcomings(String driver){
		return SqlMapClient.getSession().selectList("MyBus.getPastUpcomings", driver);
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
	public List<WantedDto> getPastWantedArticles(String driver) {
		return SqlMapClient.getSession().selectList("MyBus.getPastWantedArticles", driver);
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
	public int imgLocationUpdate(MemberDto imglocation) {
		return SqlMapClient.getSession().update("MyBus.imgLocationUpdate", imglocation);
	}
	public int updateProfile(MemberDto dto) {
		return SqlMapClient.getSession().update("MyBus.updateProfile", dto);
	}	
	public int checkChannel(String driver) {
		return SqlMapClient.getSession().selectOne("MyBus.checkChannel", driver);
	}
	public void readWanted (int num){
		SqlMapClient.getSession().update("MyBus.readWanted", num);
	}
	public void readUpcoming (int num){
		SqlMapClient.getSession().update("MyBus.readUpcoming",num);
	}
	public WantedDto getNewWanted(String driver) {
		return SqlMapClient.getSession().selectOne("MyBus.getNewWanted", driver);
	}
	public int insertChannel(ChannelDto dto){
		return SqlMapClient.getSession().insert("MyBus.insertChannel",dto);		
	}
	public int updateChannel(ChannelDto chdto){
		return SqlMapClient.getSession().update("MyBus.updateChannel",chdto);		
	}
	public List<String> selectTag(String driver) {
		return SqlMapClient.getSession().selectList("MyBus.selectTag", driver);
	}
	public int insertTag(Map<String, String> ms){
		return SqlMapClient.getSession().insert("MyBus.insertTag",ms);		
	}
	public int deleteTag(Map<String, String> ms) {
		return SqlMapClient.getSession().delete("MyBus.deleteTag", ms);
	}
	public int createCrew(String crewname){
		return SqlMapClient.getSession().insert("MyBus.createCrew", crewname);
	}
	public int createCrewMember(CrewMemberDto dto){
		return SqlMapClient.getSession().insert("MyBus.createCrewMember", dto);
	}
	public String getCrewId(String crewname){
		return SqlMapClient.getSession().selectOne("MyBus.getCrewId", crewname);
	}	
	
}
