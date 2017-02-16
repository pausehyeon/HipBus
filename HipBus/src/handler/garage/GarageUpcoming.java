package handler.garage;

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
import model.StationDto;
import model.UpcomingDto;
import model.garage.GarageDao;

@Controller
public class GarageUpcoming implements CommandHandler {

	@Resource(name="garageDao")
	private GarageDao dao;
	
	@RequestMapping("/garageUpcoming.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int pageSize = 8; // 한페이지에 출력할 글 개수
		int pageBlock = 5; // 한 번에 보여줄 페이지 개수
		int count = 0;

		String pageNum = null;
		int currentPage = 0; // 현재 페이지
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 끝 번호

		int pageCount = 0; // 페이지 개수
		int startPage = 0; // 보여줄 페이지의 시작 번호
		int endPage = 0; // 보여줄 페이지의 끝 번호

		count = dao.getUpcomingCount();

		pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = count / pageSize + (count % pageSize > 0 ? 1 : 0);
		if (currentPage > pageCount)
			currentPage = pageCount;

		start = (currentPage - 1) * pageSize + 1; // ( 5 - 1 ) * 10 + 1 41
		end = start + pageSize - 1; // 41 + 10 - 1 50
		if (end > count)
			end = count;

		if (count > 0) {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			// ( 15 / 10 ) * 10 + 1 11
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock;
			endPage = startPage + pageBlock - 1;
			// 11 + 10 -1 20
			if (endPage > pageCount)
				endPage = pageCount;
		}

		request.setAttribute("count", count);
		request.setAttribute("pagenum", pageNum);

		if (count != 0) {
			// 글이 있는 경우

			Map<String, Integer> startAndEnd = new HashMap<String, Integer>();
			startAndEnd.put("start", start);
			startAndEnd.put("end", end);
			List<UpcomingDto> articles = dao.getUpcomingArticles(startAndEnd);
			request.setAttribute("articles", articles);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageBlock", pageBlock);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);

		}

		return new ModelAndView("garageUpcoming");
	}

}
