package model.admin;

import java.util.List;
import java.util.Map;

import model.AdDto;
import model.CrewMemberDto;
import model.MemberDto;

public interface AdminDao {
		//관리자현황
		public int reportMember();		//전체멤버 수 불러오기
		public int reportGrade();		//3등급관리자 수만 부르기
		public int reportCrew();		//크루 수 전체
		public int reportPost();		//게시글 수 전체
		
		//멤버 목록 부르기
		public List<MemberDto> getMemberLists(Map<String, Integer> map);
		public List<CrewMemberDto> getCrewId();
		
		//검색
		public List<MemberDto> getSearch(Map<String, Object> map);
		public int searchNum(Map<String, String> map);
		
		//수정
		public int modifyGrade(MemberDto dto);
		
		//삭제시 크루장 인계
		public List<String> crewLeader(String email); 
		//이메일로 해당 크루의 리더여부확인 후 리더인크루아이디를 가져옴
		public List<MemberDto> crewId(String crewid);
		//가져온 크루아이디에 크루원중 가장 먼저 가입한 사람가져오기 리스트 or 이메일만?
		public int updateLeader(Map<String,String> map);
		//가져온 이메일 적용해서 크루장으로 인계시킴 leader=2
		
		//삭제
		public int deleteMember(String email);
		public int deleteDriver(String email);
		
		//광고
		public int updateAd(AdDto dto);
		public int adnumCheck(int ad_num);
		public int insertAd(AdDto dto);
		
		//관리자 정보수정
		public int updateAdmin(MemberDto dto);
		
		//관리자 이메일 인증
		public int updateValidate(Map<String,String> ms);
		public int validateCheck(Map<String, String> map);
		public int inviteCode(String iemail);
		
		public int gradAdmin(String email);
		
		
}
