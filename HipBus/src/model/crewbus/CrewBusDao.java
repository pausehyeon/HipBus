package model.crewbus;

import java.util.List;

import model.CrewDto;
import model.CrewMemberDto;

public interface CrewBusDao {
	public List<CrewMemberDto> getCrewmembers(String crewid);
	public CrewDto getCrewInfo(String crewid);

}
