package com.ja.classgroupware.base.util;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateConverter {
	
	private final int oneMinute = 60;
	private final int oneHour  	= oneMinute * 60;	// 3600
	private final int oneDay  	= oneHour * 24;		// 86400
	
	public String convert(Date rawDate) {
		
		try {
			
			String 		convertedDate 	= null;
			DateFormat 	dateFormat 		= new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
			
			long currentTimestamp 	= System.currentTimeMillis() / 1000;
			long targetTimestamp 	= rawDate.getTime() / 1000;
		
			long subtractionValueOfTwoTimestamp = currentTimestamp - targetTimestamp;
			
			if (subtractionValueOfTwoTimestamp < oneMinute * 5) {
				
				convertedDate = "방금";
				
			} else if (subtractionValueOfTwoTimestamp < oneHour) {
				
				convertedDate = Integer.toString((int) (subtractionValueOfTwoTimestamp / oneMinute)) + "분";
				
			} else if (subtractionValueOfTwoTimestamp < oneDay) {
				
				convertedDate = Integer.toString((int) (subtractionValueOfTwoTimestamp / oneHour)) + "시간";
				
			} else {
				
				convertedDate = dateFormat.format(rawDate);
				
			}
			
			return convertedDate;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return null;
			
		}
		
	}
	
}
