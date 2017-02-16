package model.garage;

import java.util.List;
import java.util.Map;

import model.FAQDto;
import model.MemberDto;
import model.NewsDto;
import model.UpcomingDto;

public interface GarageDao {
	
	public int getCount();
	public int insertNews(NewsDto article);
	public List<NewsDto> getArticles(Map<String, Integer> map);	
	public NewsDto getArticle(int num);
	public void addCount(int num);
	public MemberDto getMember(String email); //nick값 불러오기위한 메소드
	public int updateArticle( NewsDto dto );
	public int deleteArticle(int num);
	public List<FAQDto> getFAQList(Map<String,Integer> map);
	public int insertFAQ(FAQDto article);
	public FAQDto getFAQArticle(int num);
	public int updateFAQArticle( FAQDto dto );
	public int getFAQCount();
	public int faqDeleteArticle(int num);
	public int getUpcomingCount();
	public List<UpcomingDto> getUpcomingArticles(Map<String, Integer> startAndEnd );
	
}