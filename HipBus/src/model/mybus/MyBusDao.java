package model.mybus;

import java.util.List;

import model.BoardDto;
import model.MemberDto;

public interface MyBusDao {
	public String getNick( String email );
	public List<BoardDto> getBoardList( String driver );
	public BoardDto getLastBoard( String driver );
	public int appendBoard( BoardDto dto );
	public int deleteBoard( int num );
	public int modifyBoard( BoardDto dto );
}
