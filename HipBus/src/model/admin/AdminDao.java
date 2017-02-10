package model.admin;

public interface AdminDao {
	//관리자현황
	public int reportMember();		//전체멤버 수 불러오기
	public int reportGrade();		//3등급관리자 수만 부르기
	public int reportCrew();		//크루 수 전체
	public int reportPost();		//게시글 수 전체
	
	//멤버 목록 부르기
	
}
