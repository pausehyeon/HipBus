package model.crewbus;

import java.util.List;
import java.util.Map;

import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
import model.StationDto;

public interface CrewBusDao {
	public List<CrewMemberDto> getCrewmembers(String crewid);
	public int isMember(Map<String,String> map);
	public int isMem(Map<String,String> map);
	public CrewDto getCrewInfo(String crewid);
	public int getArticleCount(List<String> mem_email);
	public List<StationDto> getArticles(Map<String,String> map);
	public int applyCrew(Map<String,String> map);
	public List<MemberDto> getApplyMembers(String crewid);
	public int acceptMember(Map<String,String> map);
	public int ejectMember(Map<String, String> map);
	public int isApplied(Map<String, String> map);
	public int updateLeader(Map<String,String>map);
	public int leaderChange(Map<String,String>map);
	public int deleteCrew(String crewid);
	public int updateImglocation(CrewDto dto);
	public int updateCrewname(CrewDto dto);
}
