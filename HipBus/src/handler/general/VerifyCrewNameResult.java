package handler.general;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.general.GeneralDao;

@Controller
public class VerifyCrewNameResult implements CommandHandler {
	@Resource(name="generalDao")
	private GeneralDao generalDao;
	@RequestMapping("/verifyCrewNameResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String crewname = request.getParameter("crewname");
		String ex_crewname = request.getParameter("ex_crewname");
		
		int result = generalDao.verifyCrew(crewname);
		if(ex_crewname != null){
			//만일 이전 크루 이름이라는 parameter가 있는 경우(crewBusEdit.jsp)
			if(ex_crewname.equals(crewname)){
				//검색하려는 크루 이름이 이전 크루 이름과 같으면 true -> 입력 가능하게 함
				result = 0;
			}
		}
		request.setAttribute("result", result);
		return new ModelAndView("verifyCrewNameResult");
	}

}
