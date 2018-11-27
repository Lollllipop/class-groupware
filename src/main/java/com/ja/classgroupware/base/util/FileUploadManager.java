package com.ja.classgroupware.base.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadManager {
	
	private String realPath;
	private String openboardPath;
	private String referenceboardPath;
	// ... 등등의 여러 파일을 다루는 게시판들
	
	private String uploadedLink;
	
	public void upload(MultipartFile file) {
		try {
			String originalFileName = file.getOriginalFilename();
			String savedFileName 	= null;
			String savedFileLink 	= null;
			
			// 중복되지 않도록 유니크한 파일 이름으로 변경
			UUID uid = UUID.randomUUID();
			savedFileName = uid.toString() +"_"+originalFileName;
			savedFileLink = openboardPath + savedFileName;
			
			// 파일 객체 생성
			File targetFile = new File(openboardPath, savedFileName);
			
			// 파일이 위치하는 이전 디렉토리들이 존재하지 않으면 생성
			if (!targetFile.getParentFile().exists()) {
				targetFile.getParentFile().mkdirs();
			}
			
			byte[] fileData = file.getBytes();
			
			// 파일 생성
			FileCopyUtils.copy(fileData, targetFile);

			uploadedLink = makeURI(savedFileLink);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String makeURI(String savedFileLink) {
		// TODO 파일 이름 가공해서 리턴해야 함 /resources ... image.jpg 이런형태
		String splitPoint = "resources";
		
		// 백슬래시 모두 슬래시로 바꾸고
		String substitutedLink = savedFileLink.replace("\\", "/");
		
		// splitpoint로 잘라서 뒤에거를 리턴한다!!
		String resultLink = substitutedLink.substring(realPath.length() - 1, substitutedLink.length());
		
		System.out.println(resultLink);
		
		return resultLink;
	}
	
	public void setPath(String boardKind, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("");
		
		String imageFolderPath = "resources/image";
		
		Calendar 	cal 	= Calendar.getInstance();
		String 		year 	= Integer.toString(cal.get(Calendar.YEAR));
		String 		month 	= Integer.toString(cal.get(Calendar.MONTH) + 1);
		String 		date 	= Integer.toString(cal.get(Calendar.DATE));
		
		if (boardKind.equals("openboard")) {
			openboardPath = realPath + imageFolderPath + "\\" + boardKind + "\\"  + year + "\\" + month + "\\" + date + "\\";
		}
	}
	
	public String getUploadedLink() {
		return uploadedLink;
	}

}
