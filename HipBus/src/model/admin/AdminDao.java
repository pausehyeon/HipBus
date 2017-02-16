package model.admin;

import java.util.List;
import java.util.Map;

import model.MemberDto;

public interface AdminDao {
	//관리자현황
	public int reportMember();		//전체멤버 수 불러오기
	public int reportGrade();		//3등급관리자 수만 부르기
	public int reportCrew();		//크루 수 전체
	public int reportPost();		//게시글 수 전체
	
	//멤버 목록 부르기
	public List<MemberDto> getMemberLists(Map<String, Integer> map);
	
	//검색
	public List<MemberDto> getSearch(Map<String, Object> map);
	public int searchNum(Map<String, String> map);
	
	//수정
	public int modifyGrade(MemberDto dto);
	
	//삭제시 크루장 인계
	public List<String> crewLeader(String email);
	public List<MemberDto> crewId(String crewid);
	public int updateLeader(String email);
	
	//삭제
	public int deleteMember(String email);
	public int deleteDriver(String email);
	
}
