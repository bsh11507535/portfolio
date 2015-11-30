package com.moviews.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.moviews.admin.service.AdminService;
import com.moviews.domain.UserVO;
import com.moviews.dto.BoardDto;
import com.moviews.dto.FileDto;
import com.moviews.page.SearchCriteria;
import com.moviews.util.FileMover;
import com.moviews.util.FileReplace;

@Controller
@RequestMapping(value="/admin")
public class WriteController {
	ModelAndView mav;
	HashMap<String, Object> map;
	FileDto fileDto;

	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	AdminService service;
	
	@Transactional
	@RequestMapping(value="/writeBoxOfficeForm", method=RequestMethod.GET)
	public ModelAndView writeBoxOfficeForm(HttpSession session, HttpServletRequest req, SearchCriteria cri){
		mav=new ModelAndView();
		mav.setViewName("admin/db/write/boxofficeWrite");
		return mav;
	}
	
	@Transactional
	@RequestMapping(value="/writeMovieForm", method=RequestMethod.GET)
	public ModelAndView writeMovieForm(HttpSession session, HttpServletRequest req, SearchCriteria cri){
		mav=new ModelAndView();
		mav.setViewName("admin/db/write/movieWrite");
		return mav;
	}
	
	@Transactional
	@RequestMapping(value="/writeMovieForm", method=RequestMethod.POST)
	public ModelAndView writeMovieFormPOST(HttpSession session, HttpServletRequest req, SearchCriteria cri){
		mav=new ModelAndView();
		map=new HashMap<>();
		map.put("movieNm",req.getParameter("movieNm"));
		map.put("movieOg",req.getParameter("movieOg"));
		map.put("movieShowTm",Integer.parseInt(req.getParameter("movieShowTm")));
		map.put("movieOpenDt",Integer.parseInt(req.getParameter("movieOpenDt")));
		map.put("movieNation",req.getParameter("movieNation"));
		map.put("movieDirectorNo",req.getParameter("movieDirectorNo"));
		map.put("movieStory",req.getParameter("movieStory"));
		map.put("genreNm",req.getParameter("genreNm"));
		map.put("movieWatch",req.getParameter("movieWatch"));
		map.put("moviePoster",req.getParameter("moviePoster"));
		System.out.println(req.getParameter("moviePoster"));
		service.insertMovie(map);
		mav.setViewName("admin/db/write/writeFormPOST");
		return mav;
	}
	@Transactional
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public ModelAndView writeForm(HttpSession session, HttpServletRequest req, SearchCriteria cri,String boardCategory){
		mav=new ModelAndView();
		if(boardCategory.equals("1")){
			mav.setViewName("admin/board/noticeForm");
		}else{
			mav.setViewName("admin/board/writeForm");
		}
		
		return mav;
	}
	@Transactional
	@RequestMapping(value="/writeForm", method=RequestMethod.POST)
	public ModelAndView writeFormPOST(HttpSession session, MultipartHttpServletRequest req, SearchCriteria cri,String boardCategory){
		mav=new ModelAndView();
		map=new HashMap<>();
		String content= req.getParameter("content");
		List<String> changeFileNm=FileReplace.changeFileNm(content);
		String savedPath=FileReplace.calcPath(uploadPath);
		String changeCalcPath=FileReplace.changeCalcPath();
		for(String changer:changeFileNm){
			FileMover.fileMove(uploadPath+"\\temp\\"+changer.replace("+-+^","."), uploadPath+savedPath+"\\"+changer.replace("+-+^","."));
			content=content.replace("src=\"/displayFile/"+changer,"src=\"/displayFile?fileName=/"+ changeCalcPath+changer.replace("+-+^","."));
		}
		UserVO userVo=(UserVO)session.getAttribute("userVO");
		map.put("userNo", userVo.getUserNo());
		map.put("boardTitle", req.getParameter("title"));
		map.put("boardContent", content);
		map.put("boardCategory", 1);
		service.insertBoard(map,changeFileNm,changeCalcPath);
		File dir=new File(uploadPath+"\\");
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		List<MultipartFile> mfile=req.getFiles("uploadName");
		for(MultipartFile uploadFile:mfile){
			String originFileName=uploadFile.getOriginalFilename();
			String saveFileName=null;		
			if(!originFileName.isEmpty()) {			
				saveFileName = UUID.randomUUID().toString()+ "_" +originFileName;				
				fileDto = new FileDto();					
				fileDto.setFileName(originFileName);
				fileDto.setFileSave(saveFileName);
				fileDto.setFileSize(uploadFile.getSize()); 	
				fileDto.setFileDate(changeCalcPath);
				service.insertFileUpload(fileDto);
				try{
					uploadFile.transferTo(new File(uploadPath +savedPath+"\\"+ saveFileName));
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		mav.setViewName("admin/board/writeFormPOST");
		return mav;
	}
	@Transactional
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public ModelAndView updateForm(HttpSession session, HttpServletRequest req, SearchCriteria cri,String boardCategory){
		mav=new ModelAndView();
		map=new HashMap<>();
		int boardNo=Integer.parseInt(req.getParameter("boardNo"));
		map.put("boardNo", boardNo);
		BoardDto boardInfo=service.getBoardInfo(map);
		List<FileDto> fileList=service.getFileList(boardNo);
		req.setAttribute("boardInfo", boardInfo);
		mav.addObject("fileList", fileList);
		mav.setViewName("admin/board/updateForm");
		return mav;
	}
	@Transactional
	@RequestMapping(value="/updateForm", method=RequestMethod.POST)
	public ModelAndView updateFormPOST(HttpSession session, HttpServletRequest req, SearchCriteria cri,String boardCategory){
		mav=new ModelAndView();
		map=new HashMap<>();
		int boardNo=Integer.parseInt(req.getParameter("boardNo"));
		String content= req.getParameter("content");
		List<String> changeFileNm=FileReplace.changeFileNm(content);
		String savedPath=FileReplace.calcPath(uploadPath);
		String changeCalcPath=FileReplace.changeCalcPath();
		for(String changer:changeFileNm){
			FileMover.fileMove(uploadPath+"\\temp\\"+changer.replace("+-+^","."), uploadPath+savedPath+"\\"+changer.replace("+-+^","."));
			content=content.replace("src=\"/displayFile/"+changer,"src=\"/displayFile?fileName=/"+ changeCalcPath+changer.replace("+-+^","."));
		}
		map.put("boardNo", boardNo);
		map.put("boardTitle", req.getParameter("title"));
		map.put("boardContent", content);
		map.put("boardCategory", 1);
		service.updateBoard(map,boardNo,changeFileNm,changeCalcPath);
		mav.setViewName("admin/board/writeFormPOST");
		return mav;
	}
}
