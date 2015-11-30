package com.moviews.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.moviews.admin.service.AdminService;
import com.moviews.domain.UserVO;
import com.moviews.dto.BoardDto;
import com.moviews.dto.BoxOfficeDto;
import com.moviews.dto.EvalDto;
import com.moviews.dto.FileDto;
import com.moviews.dto.MovieDto;
import com.moviews.dto.ReplyDto;
import com.moviews.dto.UserInfoDto;
import com.moviews.page.PageMaker;
import com.moviews.page.SearchCriteria;
import com.moviews.util.RecaptchaCheck;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	int page;
	HashMap<String, Object> map;
	ModelAndView mav;

	@Inject
	AdminService service;

	@Transactional
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req){
		mav=new ModelAndView();
		mav.setViewName("admin/home");
		return mav;
	}

	@Transactional
	@RequestMapping(value="/userList",method=RequestMethod.GET)
	public ModelAndView userList(SearchCriteria cri,String type){
		mav=new ModelAndView();
		PageMaker pageMaker= new PageMaker();
		List<UserInfoDto> userList=new ArrayList<>();
		pageMaker.setCri(cri);
		if(type==null||type==""){
			pageMaker.setTotalCount(service.getAllUserCnt(cri));
			userList=service.userAllList(cri);
		}else{
			int typeNo=Integer.parseInt(type);
			if(typeNo==0){
				pageMaker.setTotalCount(service.getUserMailCnt(cri));
				userList=service.userMailList(cri);
			}else{
				pageMaker.setTotalCount(service.getUserCnt(cri,typeNo));
				userList=service.userList(cri,typeNo);
			}
		}
		mav.addObject("cri", cri);
		mav.addObject("type", type);
		mav.addObject("userList", userList);
		mav.addObject("pageMaker",pageMaker);
		mav.setViewName("admin/user/userList");
		return mav;
	}
	@Transactional
	@RequestMapping(value="/userDetail", method=RequestMethod.GET)
	public ModelAndView userDetail(HttpSession session, HttpServletRequest req, SearchCriteria cri){
		mav=new ModelAndView();
		map=new HashMap<>();
		int userNo=Integer.parseInt(req.getParameter("userNo"));
		UserInfoDto userInfo=service.getUserInfo(userNo);
		req.setAttribute("userInfo", userInfo);
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.getUserBoardCnt(userNo));
		map.put("userNo",userNo);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		List<BoardDto> BoardList=service.userBoardList(map);
		mav.addObject("boardList", BoardList);
		mav.addObject("pageMaker",pageMaker);
		mav.setViewName("admin/user/userDetail");
		return mav;
	}


	//movieDB
	@Transactional
	@RequestMapping(value="/movieDBList",method=RequestMethod.GET)
	public ModelAndView movieDBList(SearchCriteria cri,String type){
		mav=new ModelAndView();
		List<MovieDto> movieList=new ArrayList<>();
		List<BoxOfficeDto> boxofficeList=new ArrayList<>();
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("type"+type);
		if(type==null||type.equals("0")){
			pageMaker.setTotalCount(service.getAllboxofficeCnt(cri));
			boxofficeList=service.boxofficeAllList(cri);
			mav.addObject("boxofficeList", boxofficeList);
			mav.setViewName("admin/db/boxofficeList");
		}else{
			int typeNo=Integer.parseInt(type);
			switch (typeNo) {
			case 1:
				//				영화
				pageMaker.setTotalCount(service.getAllMovieCnt(cri));
				movieList=service.movieAllList(cri);
				mav.addObject("movieList", movieList);
				mav.setViewName("admin/db/movieList");
				break;
			case 2:
				//				인물
				pageMaker.setTotalCount(service.getAllPeopleCnt(cri));
				movieList=service.peopleAllList(cri);
				break;
			default:
				//				상영관
				pageMaker.setTotalCount(service.getAllTheaterCnt(cri));
				movieList=service.theaterAllList(cri);
				break;
			}
		}
		mav.addObject("cri", cri);
		mav.addObject("type", type);
		mav.addObject("pageMaker",pageMaker);

		return mav;
	}
	@Transactional
	@RequestMapping(value="/movieDBDetail",method=RequestMethod.GET)
	public ModelAndView movieDBDetail(HttpSession session, HttpServletRequest req, SearchCriteria cri, String type){
		mav=new ModelAndView();
		map=new HashMap<>();
		int typeNo=Integer.parseInt(type);
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		switch (typeNo) {
		case 1:
			int movieNo=Integer.parseInt(req.getParameter("movieNo"));
			MovieDto movieInfo=service.getMovieInfo(movieNo);
			req.setAttribute("movieInfo", movieInfo);
			pageMaker.setTotalCount(service.getMovieEvalCnt(movieNo));
			map.put("movieNo",movieNo);
			map.put("pageStart",cri.getPageStart());
			map.put("perPageNum",cri.getPerPageNum());
			List<EvalDto> evalList=service.movieEvalList(map);
			mav.addObject("evalList", evalList);
			mav.addObject("pageMaker",pageMaker);
			mav.setViewName("admin/db/movieDetail");
			break;
			
		case 2:

			break;
			
		case 3:

			break;
			
		default:
			int dateNo=Integer.parseInt(req.getParameter("dateNo"));
			BoxOfficeDto boxofficeData=service.boxoffice(dateNo);
			pageMaker.setTotalCount(service.getBoxofficeCnt(dateNo));
			List<BoxOfficeDto> boxofficeList=service.boxofficeList(dateNo);
			mav.addObject("boxofficeData", boxofficeData);
			mav.addObject("boxofficeList", boxofficeList);
			mav.addObject("pageMaker",pageMaker);
			mav.setViewName("admin/db/boxofficeDetail");
			break;
		}
		
		return mav;
	}
	//board
	@Transactional
	@RequestMapping(value="/boardList",method=RequestMethod.GET)
	public ModelAndView freeList(HttpServletRequest req, SearchCriteria cri){
		mav=new ModelAndView();
		List<BoardDto> boardList=new ArrayList<>();
		String boardCategory=req.getParameter("boardCategory");
		PageMaker pageMaker= new PageMaker();
		pageMaker.setCri(cri);
		if(boardCategory==null||boardCategory==""){
			pageMaker.setTotalCount(service.getAllBoardCnt(cri));
			boardList=service.boardAllList(cri);
		}else{
			int category=Integer.parseInt(boardCategory);
			pageMaker.setTotalCount(service.getBoardCnt(cri,category));
			boardList=service.boardList(cri,category);
		}
		mav.addObject("cri", cri);
		mav.addObject("boardCategory", boardCategory);
		mav.addObject("boardList", boardList);
		mav.addObject("pageMaker",pageMaker);
		mav.setViewName("admin/board/boardList");
		return mav;
	}
	@Transactional
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public ModelAndView boardDetail(HttpSession session, HttpServletRequest req, SearchCriteria cri,String boardCategory){
		mav=new ModelAndView();
		map=new HashMap<>();
		int boardNo=Integer.parseInt(req.getParameter("boardNo"));
		map.put("boardCategory", boardCategory);
		map.put("boardNo", boardNo);
		BoardDto boardInfo=service.getBoardInfo(map);
		List<ReplyDto> replyList=service.getReplyList(cri,boardNo);
		List<FileDto> fileList=service.getFileList(boardNo);
		ReplyDto answer=service.getAnswer(boardNo);
		req.setAttribute("boardInfo", boardInfo);
		mav.addObject("replyList", replyList);
		mav.addObject("fileList", fileList);
		mav.addObject("answer", answer);
		mav.addObject("boardCategory", boardCategory);
		mav.setViewName("admin/board/boardDetail");
		return mav;
	}
}
