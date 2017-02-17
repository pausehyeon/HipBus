package model;

import java.sql.Timestamp;

public class MemberDto {
	
	private String email;		//회원 고유식별 id
	private String nick;		//닉네임
	private String passwd;		//비밀번호
	private int mem_level;		//회원등급
	private Timestamp joindate;	//가입일
	private String imglocation;	//서버상 이미지 파일명		
	private String crewid;		//크루멤버의 크루아이디를 같이 부르기 때문에 추가	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getMem_level() {
		return mem_level;
	}
	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}

	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	public String getImglocation() {
		return imglocation;
	}
	public void setImglocation(String imglocation) {
		this.imglocation = imglocation;
	}

	public String getCrewid() {
		return crewid;
	}
	public void setCrewid(String crewid) {
		this.crewid = crewid;
	}
	
	
	
	
	
}
