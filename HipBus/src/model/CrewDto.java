package model;

public class CrewDto {

	private String crewid;		//크루아이디
	private String crewname;	//크루이름
	private String imgname;		//이미지 파일명
	private String imglocation;	//서버상 이미지 파일명
	
	public String getCrewid() {
		return crewid;
	}
	public void setCrewid(String crewid) {
		this.crewid = crewid;
	}
	public String getCrewname() {
		return crewname;
	}
	public void setCrewname(String crewname) {
		this.crewname = crewname;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgName(String imgname) {
		this.imgname = imgname;
	}
	public String getImglocation() {
		return imglocation;
	}
	public void setImglocation(String imglocation) {
		this.imglocation = imglocation;
	}
	
	
	
}
