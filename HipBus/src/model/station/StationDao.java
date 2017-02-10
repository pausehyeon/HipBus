package model.station;

import java.util.List;
import java.util.Map;


import model.StationDto;

public interface StationDao {
	public int getCount();
	public List<StationDto> getArticles( Map<String, Integer> map );
	public StationDto getArticle( int num );
	public void addCount(int num);
	
}
