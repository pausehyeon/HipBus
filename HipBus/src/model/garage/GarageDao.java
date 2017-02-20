package model.garage;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import model.FAQDto;
import model.MemberDto;
import model.NewsDto;
import model.UpcomingDto;
import model.WantedDto;

public interface GarageDao {

	public int getCount();

	public int insertNews(NewsDto article);

	public List<NewsDto> getArticles(Map<String, Integer> map);

	public NewsDto getArticle(int num);

	public void addCount(int num);

	public MemberDto getMember(String email); // nick값 불러오기위한 메소드

	public int updateArticle(NewsDto dto);

	public int deleteArticle(int num);

	public List<FAQDto> getFAQList();

	public int insertFAQ(FAQDto article);

	public FAQDto getFAQArticle(int num);

	public int updateFAQArticle(FAQDto dto);

	public int faqDeleteArticle(int num);

	public List<WantedDto> getWantedArticles(Map<String, Integer> map);

	public int getWantedCount();

	public int getWantedSearch(Map<String, String> searchMap);

	public List<WantedDto> getSearchResult(Map<String, Object> searchResesultMap);

	public int getUpcomingCount();

	public List<UpcomingDto> getUpcomingArticles(Map<String, Integer> startAndEnd);

	public List<UpcomingDto> getDateList(Map<String, Object> upcomingMap);

	public int searchDate(Map<String, Object> dateMap);

}