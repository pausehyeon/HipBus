package handler.general;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.general.GeneralDao;

@Controller
public class DriverSearchResult implements CommandHandler {
	@Resource(name = "generalDao")
	private GeneralDao dao;
	
	@RequestMapping("/driverSearchResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		String keyword = request.getParameter("keyword");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("keyword",keyword);
		List<MemberDto> searchMember = dao.getSearchMember(map);
		request.setAttribute("searchMember", searchMember);
		
		return new ModelAndView("driverSearchResult");
	}

}
