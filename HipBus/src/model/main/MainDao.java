package model.main;

import java.util.List;

import model.CrewDto;
import model.MemberDto;
import model.NewsDto;
import model.TopDriversDto;
import model.UpcomingDto;

public interface MainDao {
	
	public int insertMember( MemberDto dto );
	public List<TopDriversDto> getTopDrivers();
	public List<NewsDto> getNewsArticles();
	public List<UpcomingDto> getUpcomings();

}
