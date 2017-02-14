package model.general;

import java.util.List;

import model.CrewDto;

public interface GeneralDao {
	public int verifyEmail(String email);
	public int verifyNick(String nick);
	public int checkEmailPasswd(String email, String passwd);
	public List<CrewDto> getMyCrews(String email);
}
