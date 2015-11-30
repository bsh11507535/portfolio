package com.moviews.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class FileReplace {
	public static List<String> changeFileNm(String str) {
		List<String> result = new ArrayList<>();
		StringBuffer out = new StringBuffer();
		Pattern patternSrc =Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String sendString;
		Matcher matcherSrc= patternSrc.matcher(str);
		while (matcherSrc.find()) {
			sendString=matcherSrc.group(1).substring(13);
			if(!sendString.substring(0,8).equals("fileName")){
				result.add(sendString);
			}
			System.out.println(matcherSrc.group(1).substring(13));
		}
		matcherSrc.appendTail(out);
		return result;
	}
	public static String uploadFile(String uploadPath, String originalName,byte[] fileData)throws Exception{
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+originalName;
		String savedPath=File.separator+"temp";
		File target=new File(uploadPath+savedPath,savedName);
		FileCopyUtils.copy(fileData,  target);
		String formatName=originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName=null;
		if(MediaUtils.getMediaType(formatName)!=null){
			uploadedFileName=makeThumbnail(uploadPath,savedPath, savedName);
		}else{
			uploadedFileName="";
		}
		return uploadedFileName;
	}
	public static String calcPath(String uploadPath){
		Calendar cal=Calendar.getInstance();
		String yearPath=File.separator+cal.get(Calendar.YEAR);
		String monthPath=yearPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String datePath=monthPath+File.separator+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath,yearPath,monthPath,datePath);
		return datePath;
	}
	private static void makeDir(String uploadPath, String... paths){
		if(new File(paths[paths.length-1]).exists()){
			return;
		}
		for(String path:paths){
			File dirPath=new File(uploadPath+path);
			if(! dirPath.exists()){
				dirPath.mkdir();
			}
		}
	}
	public static String changeCalcPath(){
		Calendar cal=Calendar.getInstance();
		String yearPath=new DecimalFormat("0000").format(cal.get(Calendar.YEAR))+"/";
		String monthPath=yearPath+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1)+"/";
		String datePath=monthPath+new DecimalFormat("00").format(cal.get(Calendar.DATE))+"/";
		return datePath;
	}
	public static String makeThumbnail(String uploadPath, String path, String fileName)throws Exception{
		BufferedImage sourceImg=ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,200);
		String thumbnailName=uploadPath+path+File.separator+"s_"+fileName;
		File newFile=new File(thumbnailName);
		String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
		ImageIO.write(destImg, formatName.toUpperCase(),newFile);
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
