package model;

import java.sql.Timestamp;

public class UpcomingDto {
	private int num;
	private String driver;
	private String nick;
	private String subject;
	private String perf_place;
	private Timestamp perf_date;
	private String perf_cast;
	private int perf_runningtime;
	private int perf_price;
	private String content;
	private String imglocation;
	private int readcount;
	private Timestamp reg_date;
	
	private String formattedperf_date;	//db컬럼은 아니고 나중에 db 컬럼 내용을 출력할 때 "yy.MM.dd a HH:mm"처럼 출력하려고 추가한 변수.
	private String url; //역시 DB컬럼은 아니고 크루/마이버스 구분해서 redirect해주기 위해 추가한 변수.
	
	public int getNum() {
		return num;
	}
	public String getDriver() {
		return driver;
	}
	public String getNick() {
		return nick;
	}
	public String getSubject() {
		return subject;
	}
	public String getPerf_place() {
		return perf_place;
	}
	public Timestamp getPerf_date() {
		return perf_date;
	}
	public String getPerf_cast() {
		return perf_cast;
	}
	public int getPerf_runningtime() {
		return perf_runningtime;
	}
	public int getPerf_price() {
		return perf_price;
	}
	public String getContent() {
		return content;
	}
	public String getImglocation() {
		return imglocation;
	}
	public int getReadcount() {
		return readcount;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public String getFormattedperf_date() {
		return formattedperf_date;
	}
	public String getUrl() {
		return url;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setPerf_place(String perf_place) {
		this.perf_place = perf_place;
	}
	public void setPerf_date(Timestamp perf_date) {
		this.perf_date = perf_date;
	}
	public void setPerf_cast(String perf_cast) {
		this.perf_cast = perf_cast;
	}
	public void setPerf_runningtime(int perf_runningtime) {
		this.perf_runningtime = perf_runningtime;
	}
	public void setPerf_price(int perf_price) {
		this.perf_price = perf_price;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setImglocation(String imglocation) {
		this.imglocation = imglocation;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public void setFormattedperf_date(String formattedperf_date) {
		this.formattedperf_date = formattedperf_date;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
