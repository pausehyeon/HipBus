package model.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.AdDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.SqlMapClient;

@Component("adminDao")
public class AdminDBBean implements AdminDao {

	//****관리자 현황****
	@Override
	public int reportMember() {
		return SqlMapClient.getSession().selectOne("Admin.memberGrade");
	}//멤버전체
	@Override
	public int reportGrade() {
		return  SqlMapClient.getSession().selectOne("Admin.adminGrade");
	}//관리자만
	@Override
	public int reportCrew() {
		return SqlMapClient.getSession().selectOne("Admin.numberOfCrew");
	}//크루전체
	@Override
	public int reportPost() {
		return SqlMapClient.getSession().selectOne("Admin.numberOfPost"); 
	}//게시물수
		
	//****멤버목록****
	@Override
	public List<MemberDto> getMemberLists(Map<String, Integer> map) {
		return SqlMapClient.getSession().selectList("Admin.getMemberLists",map);
	}//회원목록 부르는 바구니
	@Override
	public List<CrewMemberDto> getCrweId(String email) {
		return SqlMapClient.getSession().selectList("Admin.getCrewId", email);
	}
	
	@Override
	public List<MemberDto> getSearch(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Admin.getSearch", smap);
	}//검색
	public int searchNum(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Admin.searchNum", nmap);
	}//페이지 번호
		
	//회원삭제-크루장 위임 강제
	@Override
	public List<String> crewLeader(String email) {
		return SqlMapClient.getSession().selectList("Admin.crewLeader",email);
	}
	@Override
	public List<MemberDto> crewId(String crewid) {
		return SqlMapClient.getSession().selectList("Admin.crewLeader", crewid);
	}
	@Override
	public int updateLeader(String email) {
		return SqlMapClient.getSession().update("Admin.crewLeader", email);
	}
	
	//삭제
	@Override
	public int deleteMember(String email) {
		return SqlMapClient.getSession().delete("Admin.deleteMember",email);
	}
	@Override
	public int deleteDriver(String email) {
		return SqlMapClient.getSession().delete("Admin.deleteDriver",email);
	}
	
	//회원등급 수정
	@Override
	public int modifyGrade(MemberDto dto) {
		return SqlMapClient.getSession().update("Admin.modifyGrade", dto);
	}
	
	//광고
	@Override
	public int updateAd(AdDto dto) {
		return SqlMapClient.getSession().update("Admin.updateAd", dto);
	}
	public int adnumCheck(int ad_num) {
		return SqlMapClient.getSession().selectOne("Admin.adnumCheck", ad_num);
	}
	@Override
	public int insertAd(AdDto dto) {
		return SqlMapClient.getSession().insert("Admin.insertAd", dto);
	}
	
}
