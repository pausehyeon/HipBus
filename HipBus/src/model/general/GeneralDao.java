package model.general;

import java.util.List;

import model.ChannelDto;
import model.CrewDto;
import model.MemberDto;

public interface GeneralDao {
	public MemberDto getMember(String email);
	public int verifyEmail(String email);
	public int verifyNick(String nick);
	public int checkEmailPasswd(String email, String passwd);
	public List<CrewDto> getMyCrews(String email);
	public List<ChannelDto> getChannels();
}
