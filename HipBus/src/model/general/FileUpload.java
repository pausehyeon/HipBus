package model.general;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUpload {

	public MultipartRequest getMultipartRequest(HttpServletRequest request) throws IOException {
		// 핸들러에서 request만 넘겨주면 파일을 저장해주는 모듈

		String path = request.getSession().getServletContext().getRealPath("/hipbusSave");
		new File(path).mkdir();

		MultipartRequest multi;

		multi = new MultipartRequest(request, path, 1024 * 1024 * 5, "utf-8", new DefaultFileRenamePolicy());

		return multi;
		
		/*
		 * 각 핸들러는 아래 부분을 복사해서 쓰면 됨.
		 * 
		 * MultipartRequest multi = new FileUpload().getMultipartRequest(request);
		 * String filename = multi.getOriginalFileName("upload"); 
		 * String filelocation = multi.getFilesystemName("upload");
		 * 
		 * ^ 위에서 "upload"는 form에서 데이터 보낼때 <input type="file" name="바로 여기">에 작성한 이름
		 * 
		 * 단,
		 * <form method="post" enctype="multipart/form-data"
		 * ^ 위와 같이 enctype을 반드시 추가해야함!
		 * 
		 * 나중에 db에 저장된 이름을 이용하여 읽어올 때는
		 * <img alt="img" src="${project}/hipbusSave/${filelocation}">
		 * ^ 태그로 읽으면 됩니다!
		 * 
		 */
	}
}
