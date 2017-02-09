package model.general;

public interface GeneralDao {
	public int verifyEmail(String email);
	public int verifyNick(String nick);
	public int checkEmailPasswd(String email, String passwd);
}
