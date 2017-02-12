package handler.general;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;

import handler.CommandHandler;
import handler.HandlerException;
import model.general.FileUpload;

@Controller
public class ImageUpload implements CommandHandler {

	@RequestMapping("/imageUpload.do")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		// ckeditor가 다음과 같이 get 방식으로 정보를 넘겨줌.
		// CKEditor=editor2&CKEditorFuncNum=2&langCode=de
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter printWriter;

		try {
			MultipartRequest multi = new FileUpload().getMultipartRequest(request);
			String filename = multi.getOriginalFileName("upload"); // 사용자가 올린 이미지의 이름
			String filelocation = multi.getFilesystemName("upload"); // 실제 저장된 이름

			printWriter = response.getWriter();

			String fileUrl = request.getSession().getServletContext().getContextPath() + "/hipbusSave/" + filelocation;// url경로

			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ request.getParameter("CKEditorFuncNum") + ",'" + fileUrl + "'" + ",'이미지를 업로드 하였습니다.'" + ");"
					+ "</script>");
			// ckeditor에게
			// window.parent.CKEDITOR.tools.callFunction(CKEditorFuncNum, 실제로 저장된 경로, 메시지);로 callback하기로 약속되어 있음.
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
