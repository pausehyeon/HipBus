package model.crewbus;

import java.util.List;

import model.CrewMemberDto;

public interface CrewBusDao {
	public List<CrewMemberDto> getCrewmembers(String crewid);
}
