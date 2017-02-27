package model.crewbus;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.CrewDto;
import model.CrewMemberDto;
import model.MemberDto;
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
	public int isMem(Map<String, String> map) {
		return SqlMapClient.getSession().selectOne("CrewBus.isMem", map);
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
	@Override
	public int applyCrew(Map<String, String> map) {
		return SqlMapClient.getSession().insert("CrewBus.applyCrew", map);
	}
	@Override
	public List<MemberDto> getApplyMembers(String crewid) {
		return SqlMapClient.getSession().selectList("CrewBus.getApplyMembers", crewid);
	}
	@Override
	public int acceptMember(Map<String, String> map) {
		return SqlMapClient.getSession().insert("CrewBus.acceptMember", map);
	}
	@Override
	public int ejectMember(Map<String, String> map) {
		return SqlMapClient.getSession().delete("CrewBus.ejectMember", map);
	}
	@Override
	public int isApplied(Map<String, String> map) {
		return SqlMapClient.getSession().selectOne("CrewBus.isApplied", map);
	}

}
