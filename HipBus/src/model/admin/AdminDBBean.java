package model.admin;

import org.springframework.stereotype.Component;
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
	
	
}
