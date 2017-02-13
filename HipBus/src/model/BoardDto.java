package model;

import java.sql.Timestamp;

public class BoardDto {
	private String driver;		// 작성된 방명록 주인의 회원이메일이나 크루아이디
	private int num;			// 글번호시퀀스, 프라이머리키
	private String email;		// 방명록작성자의 이메일
	private String nick;		// 방명록작성자의 닉네임
	private String content;		// 방명록 내용
	private Timestamp reg_date;	// 방명록 작성일
	private Timestamp mod_date;	// 방명록 수정일
	
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getMod_date() {
		return mod_date;
	}
	public void setMod_date(Timestamp mod_date) {
		this.mod_date = mod_date;
	}
}
