package model.general;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

public class ImageResize {

	public String resize(HttpServletRequest request, String imglocation, double xyRatio, int maxWidth) {
		// 이미지를 사이즈에 맞게 잘라주는 모듈.
		// request, 사이즈 조정이 필요한 이미지, 가로세로 비율, 최대크기
		
		String newImglocation = "r_" + imglocation;
		String path = request.getSession().getServletContext().getRealPath("/hipbusSave") + "\\";
		RenderedOp op = JAI.create("fileload", path + imglocation); // fileload는 고정값
		BufferedImage oldImageBuffer = op.getAsBufferedImage();

		int[] centerPoint = { oldImageBuffer.getWidth() / 2, oldImageBuffer.getHeight() / 2 };

		// calculate crop area
		int cropWidth = oldImageBuffer.getWidth();
		int cropHeight = oldImageBuffer.getHeight();

		if (cropHeight > cropWidth * xyRatio) {
			// long image
			cropHeight = (int) (cropWidth * xyRatio);
		} else {
			// wide image
			cropWidth = (int) ((float) cropHeight / xyRatio);
		}

		// set target image size
		int newImageWidth = cropWidth;
		int newImageHeight = cropHeight;

		if (newImageWidth > maxWidth) {
			// too big image
			newImageWidth = maxWidth;
			newImageHeight = (int) (newImageWidth * xyRatio);
		}

		BufferedImage newImageBuffer = new BufferedImage(newImageWidth, newImageHeight, BufferedImage.TYPE_INT_RGB); 
		Graphics2D g = (Graphics2D) newImageBuffer.getGraphics();
		g.drawImage(oldImageBuffer, 0, 0, newImageWidth, newImageHeight, centerPoint[0] - (int) (cropWidth / 2),
				centerPoint[1] - (int) (cropHeight / 2), centerPoint[0] + (int) (cropWidth / 2),
				centerPoint[1] + (int) (cropHeight / 2), null);
		try {
			ImageIO.write(newImageBuffer, "jpg", new File(path + newImglocation));
			ImageIO.write(newImageBuffer, "jpeg", new File(path + newImglocation));
			ImageIO.write(newImageBuffer, "png", new File(path + newImglocation));
			ImageIO.write(newImageBuffer, "gif", new File(path + newImglocation));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return newImglocation;
		
		/*
		 * resize를 원하는 이미지를 먼저 업로드(FileUpload.class)한 후, 아래와 같이 변형한 이미지를 대입.
		 * imglocation = new ImageResize().resize(request, imglocation, 1, 900);
		 * 
		 * */
	}
}
