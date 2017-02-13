package model.mybus;

import java.util.List;

import org.springframework.stereotype.Component;

import model.BoardDto;
import model.SqlMapClient;

@Component("myBusDao")
public class MyBusDBBean implements MyBusDao {
	public String getNick( String email ) {
		return SqlMapClient.getSession().selectOne("MyBus.getNick", email);
	}
	public List<BoardDto> getBoardList( String driver ) {
		return SqlMapClient.getSession().selectList("MyBus.getBoards", driver);
	}
	public BoardDto getLastBoard( String driver ) {
		return SqlMapClient.getSession().selectOne("MyBus.getLastBoard", driver);
	}
	public int appendBoard( BoardDto dto ) {
		return SqlMapClient.getSession().insert("MyBus.appendBoard", dto);
	}
	public int deleteBoard( int num ) {
		return SqlMapClient.getSession().delete("MyBus.deleteBoard", num);
	}
	public int modifyBoard( BoardDto dto ){
		return SqlMapClient.getSession().update("MyBus.modifyBoard", dto);
	}
}
