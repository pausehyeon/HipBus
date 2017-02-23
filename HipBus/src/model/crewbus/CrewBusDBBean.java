package model.crewbus;

import java.util.List;

import org.springframework.stereotype.Component;

import model.CrewDto;
import model.CrewMemberDto;
import model.SqlMapClient;

@Component("crewBusDao")
public class CrewBusDBBean implements CrewBusDao {
//	해당크루의 모든 멤버
	public List<CrewMemberDto> getCrewmembers(String crewid) {
		return SqlMapClient.getSession().selectList("CrewBus.getCrewmembers", crewid);
	}

	@Override
	public CrewDto getCrewInfo(String crewid) {
		return SqlMapClient.getSession().selectOne("CrewBus.getCrewInfo", crewid);
	}

}
