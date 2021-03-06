package com.moviews.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DownloadViewImpl extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest req, HttpServletResponse res) throws Exception {
		String fileName= null;	
		File file =(File)model.get("filename");
		
		res.setContentType("application/download");		
		int length =(int)file.length();
		res.setContentLength(length);

//		모든 부라우저가 지원
		fileName = URLEncoder.encode(file.getName(),"utf-8").replace("+","%20"); 
			
//		익스플로러는 지원 안됨
//		fileName = new String(file.getName().getBytes("utf-8"),"iso-8859-1").replace("+","%20");	


		res.setHeader("Content-Disposition", "attachment;" +" filename=\""+fileName+ "\";");		//한줄
		OutputStream out = res.getOutputStream();
		FileInputStream fis = null;
		
		try{
			int temp;			
			fis = new FileInputStream(file);
			while((temp=fis.read())!=-1){
				out.write(temp);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(fis!=null){
				try{
					fis.close();					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}

	}

}
