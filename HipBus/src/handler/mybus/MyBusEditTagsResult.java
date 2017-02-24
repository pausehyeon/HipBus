package handler.mybus;

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
import model.mybus.MyBusDao;

@Controller
public class MyBusEditTagsResult implements CommandHandler {
	
	@Resource(name="myBusDao")
	private MyBusDao myBusDao;
	

	@RequestMapping("/myBusEditTagsResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub		
		String type = request.getParameter("type");
		String driver = request.getParameter("driver");		
		String tag = request.getParameter("tag");
		request.setAttribute("driver", driver);
		Map<String, String> ms = new HashMap<String, String>();
		
		if ( driver != null && tag != null ) {			
			ms.put("driver", driver);		
			ms.put("tag", tag);
		}	
		
		switch(type) {
			case "list" : List<String> selectResult = myBusDao.selectTag(driver);
							request.setAttribute("selectResult", selectResult);
							System.out.println(selectResult.size());
				break;
			case "insert" : int insertResult = myBusDao.insertTag(ms);
							request.setAttribute("insertResult", insertResult);							
				break;			
			case "delete" : int deleteResult = myBusDao.deleteTag(ms);
							request.setAttribute("deleteResult", deleteResult);
				break;
		}			
		
		return new ModelAndView("myBusEditTagsResult");
	}

}
