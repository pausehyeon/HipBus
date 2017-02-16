package model.garage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.FAQDto;
import model.MemberDto;
import model.NewsDto;
import model.SqlMapClient;
import model.UpcomingDto;

@Component("garageDao")
public class GarageDBBean implements GarageDao {
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne( "Garage.getCount" );
	}

	@Override
	public List<NewsDto> getArticles(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList( "Garage.getArticles",map);
	}
	
	@Override
	public NewsDto getArticle(int num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Garage.getArticle",num);
	}

	@Override
	public MemberDto getMember(String email) { //nick값 불러오기위해씀
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Garage.getMember",email);
	}


	@Override
	public int insertNews(NewsDto article) {
		
		return SqlMapClient.getSession().insert("Garage.insertNews",article);
	}

	@Override
	public void addCount(int num) {
		// TODO Auto-generated method stub
		
		SqlMapClient.getSession().update( "Garage.addCount", num );
		
	}

	@Override
	public int updateArticle(NewsDto dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Garage.updateArticle",dto);
	}

	@Override
	public int deleteArticle(int num) {
		// TODO Auto-generated method stub
		int result = 0;
		
		result = SqlMapClient.getSession().delete("Garage.deleteArticle",num);
		
		return result;
	}

	@Override
	public List<FAQDto> getFAQList(Map<String,Integer> map) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectList( "Garage.getFAQList");
	}

	@Override
	public int insertFAQ(FAQDto article) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().insert("Garage.insertFAQ",article);
	}

	@Override
	public FAQDto getFAQArticle(int num) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne("Garage.getFAQArticle",num);
	}

	@Override
	public int updateFAQArticle(FAQDto dto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().update("Garage.updateFAQArticle",dto);
	}

	@Override
	public int getFAQCount() {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne( "Garage.getFAQCount" );
	}

	@Override
	public int faqDeleteArticle(int num) {
		// TODO Auto-generated method stub
		int result = 0;
		
		result = SqlMapClient.getSession().delete("Garage.faqDeleteArticle",num);
		
		return result;
	}

	@Override
	public int getUpcomingCount() {
		return SqlMapClient.getSession().selectOne("Garage.getUpcomingCount");
	}

	@Override
	public List<UpcomingDto> getUpcomingArticles(Map<String, Integer> startAndEnd) {
		return SqlMapClient.getSession().selectList("Garage.getUpcomingArticles", startAndEnd);
	}
	
}

