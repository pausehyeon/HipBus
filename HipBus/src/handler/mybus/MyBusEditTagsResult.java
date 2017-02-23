package handler.mybus;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.mybus.MyBusDao;

@Controller
public class MyBusEditTagsResult implements CommandHandler {
	
	@Resource(name="myBusDao")
	private MyBusDao myBusDao;
	

	@RequestMapping("/myBusEditTagsResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub		
		String driver = request.getParameter("driver");
		String tag = request.getParameter("tag");
		
		Map<String, String> ms = new HashMap<String, String>();
		ms.put("driver", driver);
		ms.put("tag", tag);
				
		int insertTag = myBusDao.insertTag(ms);
		int deleteTag = myBusDao.deleteTag(ms);
		
		request.setAttribute("driver", driver);
		request.setAttribute("tag", tag);
		request.setAttribute("insertTag", insertTag);
		request.setAttribute("deleteTag", deleteTag);		
		
		return new ModelAndView("myBusEditTagsResult");
	}

}
