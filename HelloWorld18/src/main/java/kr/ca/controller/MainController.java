package kr.ca.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;
import kr.ca.service.MainService;
import kr.ca.utils.MediaUtils;
import kr.ca.utils.UploadFileUtils;

@RestController
public class MainController {

	@Inject
	private MainService service;
	@Resource
	private String uploadPath;

	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public List<MenuDTO> getMenu() {
		List<MenuDTO> list = null;

		try {
			list = service.getMenu();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@RequestMapping(value = "footerInfo", method = RequestMethod.GET)
	public FooterInfoDTO getFooterInfo() {
		FooterInfoDTO dto = null;

		try {
			dto = service.getFooterInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@RequestMapping(value = "uploadAjax", method = RequestMethod.POST)
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request) {
		ResponseEntity<String> entity = null;

		MultipartFile file = request.getFile("file");

		try {
			String msg = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "displayFile", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) {
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
			MediaType mType = MediaUtils.getMeidaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(fileName);
			if (mType != null) {
				headers.setContentType(mType);
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		ResponseEntity<String> entity = null;

		fileName = fileName.replace('/', File.separatorChar);
		
		try {
			File file = new File(fileName);
			file.delete();

			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
