package model.main;

import java.util.List;

import model.CrewDto;
import model.MemberDto;
import model.NewsDto;
import model.TopDriversDto;

public interface MainDao {
	
	public int insertMember( MemberDto dto );
	public List<TopDriversDto> getTopDrivers();
	public CrewDto getCrew(String crewid);
	public List<NewsDto> getNewsArticles();
}
