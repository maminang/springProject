package kr.ca.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ca.utils.MediaUtils;
import kr.ca.utils.UploadFileUtils;

/*displayfile  파일 다운로드 테스트*/
/*http://localhost:8089/displayfile?fileName=/2019/03/21/97ca9451-79e7-406a-8376-dd2a135dc1f0_새 텍스트 문서.txt
http://localhost:8089/displayfile?fileName=/2019/03/21/c9ea9f13-7188-4f85-992c-5fca57f504be_Hydrangeas.jpg
http://localhost:8089/displayfile?fileName=/2019/03/21/595d789b-7aba-471d-bc22-d56ae47b2b4c_qual_01.hwp
*/
@Controller
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		ResponseEntity<String> entity = null;
			
	      fileName = fileName.replace('/', File.separatorChar);
	      
	      try {
	         
	         

	         String formatType = fileName.substring(fileName.lastIndexOf(".") + 1);
	         MediaType mType = MediaUtils.getMediaType(formatType);
	         if (mType != null) {
	            String prefix = fileName.substring(0, 12);
	            String suffix = fileName.substring(14);
	            File f1 = new File(uploadPath + prefix + suffix);
	            f1.delete();
	         }
	         
	         
	         File f2 = new File(uploadPath + fileName);
	         f2.delete();
	         
	         entity = new ResponseEntity<String>(HttpStatus.OK);
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
	      }

	      return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/displayfile", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayfile(String fileName){
		ResponseEntity<byte[]> entity=null;
				
		InputStream in=null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1).toUpperCase();
			MediaType mType= MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers=new HttpHeaders();
			in=new FileInputStream(uploadPath+fileName);
			
			if(mType!=null) {
				headers.setContentType(mType);
			}else {
				fileName=fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
			}
			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			if(in!=null) {
				try {
					in.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		return entity;
	}
	
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request) {
		ResponseEntity<String> entity=null;
		
		MultipartFile file = request.getFile("file");
		
		try {
			
			String msg=UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
			entity=new ResponseEntity<String>(msg,HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	@RequestMapping(value="/iuploadForm", method=RequestMethod.POST)
	public String iUploadForm(MultipartFile file, Model model) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName=uid.toString()+"_"+file.getOriginalFilename();//uid를 가져온 이유는 파일명 중복을 막기 위해서
		File target=new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(),target);//실질적으로 파일을 업로드하는 역할 
		
		model.addAttribute("savedName",savedName);
		
		return "uploadResult";
	}

	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		
	}
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public void uploadForm(MultipartHttpServletRequest request, Model model) throws IOException {
		MultipartFile file = request.getFile("file");
		String id = request.getParameter("id");
		
		
		
		
		
		
		UUID uid = UUID.randomUUID();
		String savedName=uid.toString()+"_"+file.getOriginalFilename();//uid를 가져온 이유는 파일명 중복을 막기 위해서
		
		/* File target=new File(uploadPath, file.getOriginalFilename()); */
		//위와 같이 쓰면 이름이 중복된 파일이 업로드될 때에 덮어쓰기가 된다.
		File target=new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(),target);//실질적으로 파일을 업로드하는 역할 
		/*
		 * request.getFile("file"); request.getParameter(name);
		 */
		
	}
}
