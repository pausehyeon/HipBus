package model.crewbus;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.CrewDto;
import model.CrewMemberDto;
import model.SqlMapClient;
import model.StationDto;

@Component("crewBusDao")
public class CrewBusDBBean implements CrewBusDao {
//	해당크루의 모든 멤버
	public List<CrewMemberDto> getCrewmembers(String crewid) {
		return SqlMapClient.getSession().selectList("CrewBus.getCrewmembers", crewid);
	}
	public int isMember(Map<String,String> map){
		return SqlMapClient.getSession().selectOne("CrewBus.isMember", map);
	}

	@Override
	public CrewDto getCrewInfo(String crewid) {
		return SqlMapClient.getSession().selectOne("CrewBus.getCrewInfo", crewid);
	}

	@Override
	public int getArticleCount(List<String> mem_email) {
		return SqlMapClient.getSession().selectOne("CrewBus.getArticleCount", mem_email);
	}

	@Override
	public List<StationDto> getArticles(Map<String,String> map) {
		return SqlMapClient.getSession().selectList("CrewBus.getArticles", map);
	}

}
