package com.moviews.main.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.moviews.admin.service.AdminService;
import com.moviews.main.service.RegisterService;
import com.moviews.util.FileReplace;
import com.moviews.util.MediaUtils;
import com.moviews.util.UploadFileUtils;

@Controller
public class MainController {
	@Resource(name="uploadPath")
	String uploadPath;

	ModelAndView mav;

	@Inject
	RegisterService reService;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Transactional
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public ModelAndView emailCheck(HttpServletRequest req,HttpServletResponse resp){
		mav=new ModelAndView();
		int userNo=Integer.parseInt(req.getParameter("userNo"));
		reService.emailCheck(userNo);
		mav.setViewName("/index");
		return mav;
	}
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main(Locale locale, Model model) {
		mav=new ModelAndView();
		mav.setViewName("/site/index");
		return mav;
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView main2(Locale locale, Model model) {
		mav=new ModelAndView();
		// mav를 사용하여 boxOffice, freeBBS, questionBBS, reviewBBS,userRecom을 전송

		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/uploadPoster", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, Model model)throws Exception{
		logger.info("originalName:" + file.getOriginalFilename());

		return new ResponseEntity<>(FileReplace.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),HttpStatus.CREATED);
	}
	@ResponseBody
	@RequestMapping(value="/displayPoster")
	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
		InputStream in=null;
		ResponseEntity<byte[]> entity=null;
		logger.info("FILE NAME:" + fileName);
		try{
			String formatName=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType=MediaUtils.getMediaType(formatName);
			HttpHeaders headers= new HttpHeaders();
			in=new FileInputStream(uploadPath+fileName);
			if(mType!=null){
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}

			entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}


}
