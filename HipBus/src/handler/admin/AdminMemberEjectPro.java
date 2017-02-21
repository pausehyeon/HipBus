package handler.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.MemberDto;
import model.admin.AdminDao;

@Controller
public class AdminMemberEjectPro implements CommandHandler {
	@Autowired(required=false)
	@Resource(name="adminDao")
	public AdminDao adminDao;
	
	@RequestMapping("/adminMemberEjectPro.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String email = request.getParameter("email");
		
		List<String> list = adminDao.crewLeader(email);	
		
		int result = 0;
		int resultcheck = 0;
		
		if(list.size() == 0){
			result = adminDao.deleteMember(email);
			resultcheck = adminDao.deleteDriver(email);
		}

		if(list.size() != 0){
			for(int i=0;i<list.size();i++){
				List<MemberDto> clist = null;
				clist = adminDao.crewId( list.get(i) );
				Map<String,String> map = new HashMap<String,String>();
				if(clist.isEmpty()){
					result = adminDao.deleteMember(email);
					resultcheck = adminDao.deleteDriver(email);
				} else {
					map.put("email", clist.get(0).getEmail());
					map.put("crewid", list.get(i));
					
					adminDao.updateLeader(map);
					result = adminDao.deleteMember(email);
					resultcheck = adminDao.deleteDriver(email);
				}
			}
		}

		request.setAttribute("result", result);
		request.setAttribute("resultcheck", resultcheck);
		
		return new ModelAndView("adminMemberEjectPro");
	}

}
