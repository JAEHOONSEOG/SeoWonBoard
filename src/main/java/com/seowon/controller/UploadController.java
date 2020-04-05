package com.seowon.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seowon.util.MimeMediaUtil;
import com.seowon.util.UploadFileUtil;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	@RequestMapping(value="/uploadForm", method=RequestMethod.GET) 
//	public void uploadForm() {}
	 
	
//	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
//	public String uploadForm(MultipartFile file, Model model) throws Exception {
//		
//		logger.info("originalName: " + file.getOriginalFilename());
//		logger.info("size: " + file.getSize());
//		logger.info("contentType : " + file.getContentType());
//		
//		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//		
//		model.addAttribute("savedName", savedName);
//		
//		return "uploadResult";
//	}
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uplaodAjax() {}
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST)
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		return new ResponseEntity<String>(
				UploadFileUtil.uploadFile(
						uploadPath,
						file.getOriginalFilename(),
						file.getBytes()), 
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("FILE NAME: " + fileName);
		
		try {
			
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			MediaType mType = MimeMediaUtil.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
			in = new FileInputStream(uploadPath + fileName);
			
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\''"+ 
						new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\''");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	} 
	
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//		
//		UUID uid = UUID.randomUUID();
//		
//		String savedName = uid.toString() + "_" + originalName;
//		
//		File target = new File(uploadPath, savedName);
//		
//		FileCopyUtils.copy(fileData, target);
//		
//		return savedName;
//	}
}
