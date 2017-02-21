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
	public List<CrewMemberDto> getCrewId() {
		return SqlMapClient.getSession().selectList("Admin.getCrewId");
	}
	
	@Override
	public List<MemberDto> getSearch(Map<String, Object> smap) {
		return SqlMapClient.getSession().selectList("Admin.getSearch", smap);
	}//검색
	public int searchNum(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Admin.searchNum", nmap);
	}//검색되는 페이지 수
	
	//****회원관리****	
	//회원삭제시-크루장 위임 강제
	@Override
	public List<String> crewLeader(String email) {
		return SqlMapClient.getSession().selectList("Admin.crewLeader",email);
	}
	@Override
	public List<MemberDto> crewId(String crewid) {
		return SqlMapClient.getSession().selectList("Admin.crewId", crewid);
	}
	@Override
	public int updateLeader(Map<String,String> map) {
		return SqlMapClient.getSession().update("Admin.updateLeader", map);
	}

	//일반 삭제
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
	
	//****상업광고 삽입****
	//광고
	@Override
	public int updateAd(AdDto dto) {
		return SqlMapClient.getSession().update("Admin.updateAd", dto);
	}//광고 update
	public int adnumCheck(int ad_num) {
		return SqlMapClient.getSession().selectOne("Admin.adnumCheck", ad_num);
	}//기존에 광고가 있는지 확인
	@Override
	public int insertAd(AdDto dto) {
		return SqlMapClient.getSession().insert("Admin.insertAd", dto);
	}//기존 저장된 데이터가 없는 경우 새로 insert
	
	//****관리자 정보****
	//정보수정(닉네임, 비밀번호만 수정 /memEmail 기준)
	@Override
	public int updateAdmin(MemberDto dto) {
		return SqlMapClient.getSession().update("Admin.updateAdmin", dto);
	}
}
