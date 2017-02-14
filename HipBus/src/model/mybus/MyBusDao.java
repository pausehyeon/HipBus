package model.mybus;

import java.util.List;
import java.util.Map;

import model.BoardDto;
import model.MemberDto;

public interface MyBusDao {
	public List<BoardDto> getBoardList( Map<String, String> map );
	public BoardDto getLastBoard( String driver );
	public MemberDto getMember( String email );
	public int appendBoard( BoardDto dto );
	public int deleteBoard( int num );
	public int modifyBoard( BoardDto dto );
	public String getChannelid( String driver );
	public int isHop( Map<String,String> map );
	public int hopOn( Map<String,String> map );
	public int hopOff( Map<String,String> map );
}
