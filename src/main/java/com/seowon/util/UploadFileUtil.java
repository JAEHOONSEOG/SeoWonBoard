package com.seowon.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtil {

	private static Logger logger = LoggerFactory.getLogger(UploadFileUtil.class);

	public static String uploadFile(
			String uploadPath, String originalName, byte[] fileData) throws Exception {
		// Get UID
		UUID uid = UUID.randomUUID();
		// Set file name
		String savedName = uid.toString() + "_" + originalName;
		// Calculate the file directory to save
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		// For saving original file
		FileCopyUtils.copy(fileData, target);
		// Get file extension
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		
		String uploadedFileName = null;
		// Divide the process by classifying extension of file
		if(MimeMediaUtil.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String makeIcon(
			String uploadPath, String path, String fileName) throws Exception {
		
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) throws Exception {
		Calendar cal = Calendar.getInstance();
		
		// Get Year
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// Get Month
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		// Get Date
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// Make Directory
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info("Date Path: " + datePath);
		
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) throws Exception {
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(
			String uploadPath, String path, String fileName) throws Exception {
		// Source Image
		BufferedImage sourceImg = 
				ImageIO.read(new File(uploadPath + path, fileName));
		// Destination Image
		BufferedImage destImg = 
				Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// Thumbnail Name
		String thumbnailName = 
				uploadPath + path + File.separator + "S_" + fileName;
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
