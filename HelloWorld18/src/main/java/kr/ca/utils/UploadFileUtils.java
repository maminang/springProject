package kr.ca.utils;

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
	//썸네일 이미지 생성
	private static String makeThumbnail(
		String uploadPath,
		String path,
		String fileName) throws IOException {
		
		BufferedImage sourceImg=ImageIO.read(new File(uploadPath+path, fileName));
		
		BufferedImage destImg=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 100);
		
		String thumbnailName=uploadPath+path+File.separator+"s_"+fileName;
				//s_ 로 썸네일이라는 표시는 해준다.
		File newFile=new File(thumbnailName);
		String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar,'/');
	}
	
	private static String makeIcon(
		String uploadPath,
		String path,
		String fileName){
		
		String iconName=uploadPath+path+File.separator+fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException {
		//겹치지 않는 파일명을 만들기 위한 값 생성
		UUID uid = UUID.randomUUID();
		
		//원본파일 이름과 UUID를 결합
		String savedName=uid.toString()+"_"+originalName;//uid를 가져온 이유는 파일명 중복을 막기 위해서
		
		//파일을 저장할 폴더 생성
		String savedPath=calPath(uploadPath);
		
		//저장할 파일 준비
		File target=new File(uploadPath+savedPath, savedName);
		
		//파일을 저장
		FileCopyUtils.copy(fileData, target);
		
		//=======================================
		
		
		
		
		/* makeIcon() 호출할지 makeThumbnail() 호출할지 알 수 없음 */
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1)
				.toUpperCase();
		if(MediaUtils.getMediaType(formatName)!=null) {
			return makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			return makeIcon(uploadPath, savedPath, savedName);
		}
		
	}
	//폴더 생성 함수
	private static String calPath(String uploadPath) {
		
		
		Calendar cal = Calendar.getInstance();
		String yearPath=File.separator+cal.get(Calendar.YEAR);
		String monthPath=yearPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		
		
		/*String datePath=yearPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));*/
		//monthPath 안에 이미 yearPath 포함되어 있으므로 위와 같이 하면 안되고, 아래와 같이 해야한다.
		String datePath=monthPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}

	/*
	 * varagrs 가변인자 public void me(int a, int b, int c, int d, .....int )
	 String...paths 이 부분 배열로 인식. 일일이 여러게 적지 명기하지 않아도 자동으로 다음꺼 있으면 도는거 같음*/
	private static void makeDir(String uploadPath, String...paths) {
		// TODO Auto-generated method stub
		File f = new File(uploadPath+paths[paths.length-1]);
		
		if(f.exists()) {
			return;
		}
		for(String path:paths) {
			File dirPath=new File(uploadPath+path);
			if(!dirPath.exists()) {
				dirPath.mkdirs();
			}
		}
	}
}
