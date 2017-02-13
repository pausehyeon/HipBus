package model;

public class TopDriversDto {

	private String driver;
	private int driverRanking;
	private int passengersCount;
	private String imglocation;
	private String nick;
	private String url;
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDriver() {
		return driver;
	}
	public int getDriverRanking() {
		return driverRanking;
	}
	public int getPassengersCount() {
		return passengersCount;
	}
	public String getImglocation() {
		return imglocation;
	}
	public String getNick() {
		return nick;
	}
	
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public void setDriverRanking(int driverRanking) {
		this.driverRanking = driverRanking;
	}
	public void setPassengersCount(int passengersCount) {
		this.passengersCount = passengersCount;
	}
	public void setImglocation(String imglocation) {
		this.imglocation = imglocation;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}
