package model.crewbus;

import java.util.List;
import java.util.Map;

import model.CrewDto;
import model.CrewMemberDto;
import model.StationDto;

public interface CrewBusDao {
	public List<CrewMemberDto> getCrewmembers(String crewid);
	public int isMember(Map<String,String> map);
	public CrewDto getCrewInfo(String crewid);
	public int getArticleCount(List<String> mem_email);
	public List<StationDto> getArticles(Map<String,String> map);
}
