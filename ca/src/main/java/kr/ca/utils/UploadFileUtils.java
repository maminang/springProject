package kr.ca.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String orginalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + orginalName;

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return (uploadPath +File.separator+ savedName).replace(File.separatorChar, '/');
	}

}
