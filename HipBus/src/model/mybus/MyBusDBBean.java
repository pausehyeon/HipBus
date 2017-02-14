package model.mybus;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import model.BoardDto;
import model.MemberDto;
import model.SqlMapClient;

@Component("myBusDao")
public class MyBusDBBean implements MyBusDao {
	public List<BoardDto> getBoardList( Map<String, String> map ) {
		return SqlMapClient.getSession().selectList("MyBus.getBoards", map);
	}
	public BoardDto getLastBoard( String driver ) {
		return SqlMapClient.getSession().selectOne("MyBus.getLastBoard", driver);
	}
	public MemberDto getMember( String email ){
		return SqlMapClient.getSession().selectOne("MyBus.getMember", email);
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
	public String getChannelid( String driver ) {
		return SqlMapClient.getSession().selectOne("MyBus.getChannelid", driver);
	}
}
