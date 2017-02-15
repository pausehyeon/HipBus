package model.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

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
	public List<MemberDto> getSearch(Map<String, String> smap) {
		return SqlMapClient.getSession().selectList("Admin.getSearch", smap);
	}//검색
	public int searchNum(Map<String, String> nmap) {
		return SqlMapClient.getSession().selectOne("Admin.searchNum", nmap);
	}//페이지 번호
		
	//회원삭제
	@Override
	public int deleteMember(String email) {
		return SqlMapClient.getSession().delete("Admin.deleteMember",email);
	}
	
	//회원등급 수정
	@Override
	public int modifyGrade(MemberDto dto) {
		return SqlMapClient.getSession().update("Admin.modifyGrade", dto);
	}
	
	
}
