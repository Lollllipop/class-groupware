package com.ja.classgroupware.base.util;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

public class FileUploadManager {
	
	private String realPath;
	private String openboardPath;
	private String referenceboardPath;
	// ... 등등의 여러 파일을 다루는 게시판들
	
	private String savedFileName;
	private String uploadedLink;
	private String thumbnailLink;
	
	public void upload(MultipartFile file) {
		try {
			String path 			= this.getPath();
	
			String originalFileName = file.getOriginalFilename();
			String savedFileLink 	= null;
			
			// 중복되지 않도록 유니크한 파일 이름으로 변경
			UUID uid = UUID.randomUUID();
			savedFileName = uid.toString() +"_"+originalFileName;
			savedFileLink = path + savedFileName;
			
			// 파일 객체 생성
			File targetFile = new File(path, savedFileName);
			
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
		String splitPoint = "resources";
		
		String substitutedLink = savedFileLink.replace("\\", "/");
		
		String resultLink = substitutedLink.substring(realPath.length() - 1, substitutedLink.length());
		
		return resultLink;
	}
	
	public void setPath(String boardKind, HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("");
		
		String imageFolderPath = "resources\\image";
		
		Calendar 	cal 	= Calendar.getInstance();
		String 		year 	= Integer.toString(cal.get(Calendar.YEAR));
		String 		month 	= Integer.toString(cal.get(Calendar.MONTH) + 1);
		String 		date 	= Integer.toString(cal.get(Calendar.DATE));
		
		if (boardKind.equals("openboard")) {
			openboardPath = realPath + imageFolderPath + "\\" + boardKind + "\\"  + year + "\\" + month + "\\" + date + "\\";
			System.out.println(openboardPath);
		} else if (boardKind.equals("referenceboard")) {
			referenceboardPath = realPath + imageFolderPath + "\\" + boardKind + "\\"  + year + "\\" + month + "\\" + date + "\\";
			System.out.println(referenceboardPath);
		}
	}
	
	public String getPath() {
		if (openboardPath != null) {
			return openboardPath;
		} else if (referenceboardPath != null) {
			return referenceboardPath;
		} else {
			return null;
		}
	}
	
	public String changeBackSlashToSlash(String stringWithBackSlash) {
		return stringWithBackSlash.replace("\\", "/");
	}
	
	public void setRealPath(HttpServletRequest request) {
		realPath = request.getSession().getServletContext().getRealPath("");
	}
	
	public String getRealPath() {
		return realPath;
	}
	
	public String getUploadedLink() {
		return uploadedLink;
	}

	public void delete(String fileLink) {
		String src = this.changeBackSlashToSlash(this.getRealPath()) + fileLink.substring(1, fileLink.length());
		
		System.out.println(src);
		
		File file = new File(src);
			
        if (file.exists()) {
            if (file.delete()) {
                System.out.println("파일삭제 성공");
            } else {
                System.out.println("파일삭제 실패");
            }
		} else {
		    System.out.println("파일이 존재하지 않습니다.");
		}
	}

	public void makeThumbnail(MultipartFile file) {
		String formatName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
		
		if (MediaUtils.getMediaType(formatName) != null) {
			this.thumbnailLink = makeImageIcon(file);
		}else{
			this.thumbnailLink = makeFileIcon(file);
		}
	}

	public String getThumbnailLink() {
		return thumbnailLink;
	}
	
	public String makeImageIcon(MultipartFile file) {
		String thumbnailPath = null;
		
	    try {
	    	thumbnailPath = this.getPath() + savedFileName.replace(file.getOriginalFilename(), "thumbnail_" + file.getOriginalFilename());
	    	
			File originalFile 	= new File(this.getPath() + savedFileName);
			File thumbnail		= new File(thumbnailPath);
	    	
	    	if (originalFile.exists()) {
	    		Thumbnails.of(originalFile).size(70, 70).toFile(thumbnail);
	    	}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return makeURI(thumbnailPath);
	}
	
	public String makeFileIcon(MultipartFile file) {
		String thumbnailPath = this.getRealPath() + "resources\\image\\file_thumbnail.png";
		
		System.out.println(this.getRealPath() + "file_thumbnail.png");
		
		return makeURI(thumbnailPath);
	}
	
	public String makeUniqueFileName(String originalFileName) {
		UUID uid = UUID.randomUUID();
		return uid.toString() +"_"+originalFileName;
	}

}
