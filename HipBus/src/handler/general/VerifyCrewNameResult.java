package handler.general;

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
		int result = generalDao.verifyCrew( request.getParameter("crewname") );
		request.setAttribute("result", result);
		return new ModelAndView("verifyCrewNameResult");
	}

}