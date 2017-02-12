package model.garage;

import java.util.List;
import java.util.Map;

import model.MemberDto;
import model.NewsDto;

public interface GarageDao {
	
	public int getCount();
	public int insertNews(NewsDto article);
	public List<NewsDto> getArticles(Map<String, Integer> map);	
	public NewsDto getArticle(int num);
	public void addCount(int num);
	public MemberDto getMember(String email); //nick값 불러오기위한 메소드
	
	
	
}