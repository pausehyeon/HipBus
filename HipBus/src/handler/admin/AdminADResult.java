package handler.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.AdDto;
import model.admin.AdminDao;

@Controller
public class AdminADResult implements CommandHandler {
	
	@Resource(name="adminDao")
	private AdminDao adminDao;

	@RequestMapping("/adminADResult.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int ad_num = Integer.parseInt( request.getParameter("ad_num"));
		
		AdDto article = adminDao.getData(ad_num);
		
		String result = null;
		if(article!=null){
			if(article.getImglocation()!=null){
				result = "<img class='w3-circle' src='/HipBus/hipbusSave/"+article.getImglocation()+"' width='100px'>";
			} else if(article.getHtml()!=null){
				result = article.getHtml();		
			}
		}
			/*if(imglocation == null && html != null){
				imglocation = "imglocation : ";
			} else if (html == null && imglocation != null){
				html = "html : ";
			} else {
				imglocation = "업음";
				html = "없음";
			}*/
			request.setAttribute("result", result);
		
		return new ModelAndView("adminADResult");
	}

}
