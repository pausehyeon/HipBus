package model;

public class CrewMemberDto {
	private String email;
	private String crewid;
	private int leader;
	private String nick;
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCrewid() {
		return crewid;
	}
	public void setCrewid(String crewid) {
		this.crewid = crewid;
	}
	public int getLeader() {
		return leader;
	}
	public void setLeader(int leader) {
		this.leader = leader;
	}
	
}
