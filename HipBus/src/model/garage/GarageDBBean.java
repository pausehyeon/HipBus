package model.garage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.MemberDto;
import model.NewsDto;
import model.SqlMapClient;

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

	

	
	
}

