package handler.general;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import model.AdDto;
import model.general.GeneralDao;

@Controller
public class CommercialAds implements CommandHandler {
	@Resource(name="generalDao")
	private GeneralDao generalDao;
	@RequestMapping("/commercialAds.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		AdDto ad = generalDao.getAds(1);
		AdDto aad = generalDao.getAds(2);
		AdDto aaad = generalDao.getAds(3);
		
		if(ad.getImglocation()!=null){
			request.setAttribute("ad1_img", ad.getImglocation());
		} else if(ad.getHtml()!=null){
			request.setAttribute("ad1_html", ad.getHtml());
		}
		if(aad.getImglocation()!=null){
			request.setAttribute("ad2_img", aad.getImglocation());
		} else if(aad.getHtml()!=null){
			request.setAttribute("ad2_html", aad.getHtml());
		}
		if(aaad.getImglocation()!=null){
			request.setAttribute("ad3_img", aaad.getImglocation());
		} else if(aaad.getHtml()!=null){
			request.setAttribute("ad3_html", aaad.getHtml());
		}
		
		return new ModelAndView("commercialAds");
	}

}
