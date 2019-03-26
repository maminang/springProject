package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String orginalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + orginalName;

		String savedPath = calPath(uploadPath);

		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);

		String formatName = orginalName.substring(orginalName.lastIndexOf(".") + 1).toUpperCase();
		if (MediaUtils.getMeidaType(formatName) != null) {
			return makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			System.out.println(uploadPath);
			return makeIcon(uploadPath, savedPath, savedName);
		}

	}

	private static String calPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		File f = new File(uploadPath + paths[paths.length - 1]);
		if (f.exists())
			return;

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists())
				dirPath.mkdir();
		}
	}

	private static String makeIcon(String uploadPath, String path, String fileName) {
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 100);
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;

		File newFile = new File(thumbnailName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
