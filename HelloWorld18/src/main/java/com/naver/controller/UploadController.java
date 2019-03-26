package com.naver.controller;

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

import kr.co.utils.MediaUtils;
import kr.co.utils.UploadFileUtils;

@Controller
public class UploadController {
	@Resource(name = "uploadPath")
	private String uploadPath;

	@ResponseBody
	@RequestMapping("displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) {
		ResponseEntity<byte[]> entity = null;

		InputStream in = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
			MediaType mType = MediaUtils.getMeidaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; fileName=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
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

	@RequestMapping(value = "uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "uploadForm", method = RequestMethod.POST)
	public void upload(MultipartHttpServletRequest request, Model model) throws IOException {
		MultipartFile file = request.getFile("file");

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + file.getOriginalFilename();

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
	}

	@RequestMapping(value = "iUploadForm", method = RequestMethod.POST)
	public String iUploadForm(MultipartFile file, Model model) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + file.getOriginalFilename();

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);

		model.addAttribute("savedName", savedName);

		return "uploadResult";
	}

	@RequestMapping(value = "uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
	}

	@ResponseBody
	@RequestMapping(value = "uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartHttpServletRequest request, Model model) {
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

	@ResponseBody
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {
		ResponseEntity<String> entity = null;

		fileName = fileName.replace('/', File.separatorChar);
		
		try {
			File file = new File(uploadPath + fileName);
			file.delete();

			String formatType = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMeidaType(formatType);
			if (mType != null) {
				String prefix = fileName.substring(0, 12);
				String suffix = fileName.substring(14);
				File imgOriginalFile = new File(uploadPath + prefix + suffix);
				imgOriginalFile.delete();
			}
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
