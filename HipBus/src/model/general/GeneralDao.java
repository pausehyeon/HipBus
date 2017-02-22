package model.general;

import java.util.List;
import java.util.Map;

import model.ChannelDto;
import model.CrewDto;
import model.MemberDto;

public interface GeneralDao {
	public MemberDto getMember(String email);
	public CrewDto getCrew(String crewid);	
	public int verifyEmail(String email);
	public int verifyNick(String nick);
	public int checkEmailPasswd(String email, String passwd);
	public List<CrewDto> getMyCrews(String email);
	public List<ChannelDto> getChannels();
	public int getVerificationCode(String email);
	public List<MemberDto> getHoppedOnMembers(String email);
	public List<CrewDto> getHoppedOnCrews(String email);
	public List<MemberDto> getSearchMember(Map<String,String> map);
	public int verifyCrew(String crewname);
}
