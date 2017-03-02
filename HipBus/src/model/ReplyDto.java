package model;

import java.sql.Timestamp;

public class ReplyDto {
	private int replynum;
	private int num;
	private String email;
	private String content;
	private int ref_num;
	private int re_step;
	private int re_level;
	private Timestamp reg_date;
	private int status;
	
	private String imglocation;	// join용 프로필사진
	private String nick;
	
	public int getReplynum() {
		return replynum;
	}
	public int getNum() {
		return num;
	}
	public String getEmail() {
		return email;
	}
	public String getContent() {
		return content;
	}
	public int getRef_num() {
		return ref_num;
	}
	public int getRe_step() {
		return re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public int getStatus() {
		return status;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRef_num(int ref_num) {
		this.ref_num = ref_num;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getImglocation() {
		return imglocation;
	}
	public void setImglocation(String imglocation) {
		this.imglocation = imglocation;
	}
}
