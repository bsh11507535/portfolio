package com.moviews.admin.controller;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.apache.cxf.io.CachedOutputStream;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.moviews.admin.service.AdminService;
import com.moviews.domain.UserVO;
import com.moviews.dto.BoxOfficeDto;
import com.moviews.page.SearchCriteria;
import com.moviews.util.Gmail;

@Controller
@RequestMapping(value="/admin")
public class AjaxController {
	ModelAndView mav;
	HashMap<String, Object> map;

	@Inject
	AdminService service;
	//상태변경
	@Transactional
	@RequestMapping(value="/statusChange", method=RequestMethod.POST)
	public @ResponseBody void statusChange(HttpServletRequest req,HttpServletResponse resp){
		map=new HashMap<>();
		int statusNum=0;
		String statusChange = req.getParameter("statusChange");
		switch(statusChange){
		case "activate": statusNum=1;
		break;
		case "week": statusNum=2;
		break;
		case "month": statusNum=3;
		break;
		case "deactivate": statusNum=4;
		break;
		}
		String userNoList[]=req.getParameterValues("userNo");
		for(String userNo:userNoList){
			map=new HashMap<>();
			map.put("statusNum", statusNum);
			map.put("userNo", Integer.parseInt(userNo));
			service.userStatus(map);
		}
	}

	//메일전송
	@Transactional
	@RequestMapping(value="/userCheckMail", method=RequestMethod.POST)
	public @ResponseBody void userCheckMail(HttpServletRequest req,HttpServletResponse resp){
		map=new HashMap<>();
		String userNoList[]=req.getParameterValues("userNo");
		String recipient,subject,body;
		String url="localhost:8090/emailCheck?userNo=";
		for(String userNo:userNoList){

			recipient = service.getUserMail(Integer.parseInt(userNo)); 
			subject = "Moviews에서 Mail체크를 부탁드립니다."; 
			body = "인증메일 <a href='https://"+url+userNo+"'>전송 완료</a>"; 
			try {
				Gmail.MailSend(recipient, subject, body);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	@Transactional
	@RequestMapping(value="/userRePassword", method=RequestMethod.POST)
	public @ResponseBody void userRePassword(HttpServletRequest req,HttpServletResponse resp){
		map=new HashMap<>();
		String userNoList[]=req.getParameterValues("userNo");
		String recipient,subject,body;
		for(String userNo:userNoList){
			int userNoSend=Integer.parseInt(userNo);
			String resetPass=Gmail.resetPass();
			map.put("userNo", userNoSend);
			map.put("userPass", resetPass);
			service.resetPass(map);
			recipient = service.getUserMail(userNoSend); 
			subject = "Moviews에서 비밀번호를 초기화 하였습니다."; 
			body = "비밀번호:"+resetPass; 
			try {
				Gmail.MailSend(recipient, subject, body);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	//작성글 블라인드 처리
	@Transactional
	@RequestMapping(value="/boardBlind", method=RequestMethod.POST)
	public @ResponseBody void boardBlind(HttpServletRequest req,HttpServletResponse resp){
		String boardNoList[]=req.getParameterValues("boardNo");
		for(String boardNo:boardNoList){
			service.blind(Integer.parseInt(boardNo));
		}
	}
	@Transactional
	@RequestMapping(value="/boardUnBlind", method=RequestMethod.POST)
	public @ResponseBody void uboardUnblind(HttpServletRequest req,HttpServletResponse resp){
		String boardNoList[]=req.getParameterValues("boardNo");
		for(String boardNo:boardNoList){
			service.unblind(Integer.parseInt(boardNo));
		}
	}

	//MovieDB
	@Transactional
	@RequestMapping(value="/movieDelete", method=RequestMethod.POST)
	public @ResponseBody void movieDelete(HttpServletRequest req,HttpServletResponse resp){
		String movieNoList[]=req.getParameterValues("movieNo");
		for(String movieNo:movieNoList){
			service.movieDelete(Integer.parseInt(movieNo));
		}

	}
	@Transactional
	@RequestMapping(value="/refresh", method=RequestMethod.GET)
	public void refresh( HttpServletRequest req,HttpServletResponse resp) throws Exception{
		resp.setCharacterEncoding("UTF-8");
		String jsonCall = boxofficeCall(req.getParameter("targetDt"));
		PrintWriter writer=resp.getWriter();
		writer.print(JSONBoxoffice(jsonCall));
	}
	@Transactional
	@RequestMapping(value="/boxofficeWrite", method=RequestMethod.POST)
	public ModelAndView boxofficeWrite( HttpServletRequest req,HttpServletResponse resp) throws Exception{
		mav=new ModelAndView();
		String date=req.getParameter("datevo");
		System.out.println("##### boxOfficeWrite #####");
		map=new HashMap<>();
		UserVO userVo=(UserVO)req.getSession().getAttribute("userVO");
		map.put("userNo", userVo.getUserNo());
		map.put("boxOfDate", date);
		service.insertBoxDate(map);
		for(int i=1;i<=10;i++){
			map=new HashMap<>();
			map.put("rnum",req.getParameter("rnum"+i));
			map.put("movieNo",req.getParameter("movieCd"+i));
			map.put("movieNm",req.getParameter("movieNm"+i));
			map.put("rank",req.getParameter("rank"+i));
			map.put("rankInten",req.getParameter("rankInten"+i));
			map.put("salesAcc",req.getParameter("salesAcc"+i));
			map.put("audiAcc",req.getParameter("audiAcc"+i));
			map.put("openDt",req.getParameter("openDt"+i));
			map.put("boxOfDate",date);
			service.insertBoxOffice(map);
		}
		mav.setViewName("/admin/db/write/writeFormPOST");
		return mav; 
	}
	private String boxofficeCall(String date) throws Exception {
		String callAddr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList";
		String key = "6d04d988d4dd90c77967f734fc70b4df";
		String utfKey = URLEncoder.encode(key,"UTF-8");
		String targetDt = date;
		String json = ".json";
		String resultKey = null;
		
		resultKey = "?" + "key=" + utfKey;
		targetDt = "&" + "targetDt=" + targetDt;
		callAddr = callAddr + json + resultKey + targetDt;
		URL url = new URL(callAddr);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		return bos.getOut().toString();
	}
	public JSONArray JSONBoxoffice(String jsonCall) throws Exception {
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonCall);
		JSONObject boxOfficeResult = (JSONObject)(jsonObject.get("boxOfficeResult"));
		JSONArray dailyBoxOfficeList = (JSONArray)boxOfficeResult.get("dailyBoxOfficeList");
		return dailyBoxOfficeList;
	}
	@Transactional
	@RequestMapping(value="/movieWrite", method=RequestMethod.POST)
	public void movieInfo( HttpServletRequest req,HttpServletResponse resp) throws Exception{
		resp.setCharacterEncoding("UTF-8");
		String jsonCall = movieCall(req.getParameter("movieCd"));
		PrintWriter writer=resp.getWriter();
		writer.print(JSONMovie(jsonCall));
	}
	public JSONObject JSONMovie(String jsonCall) throws Exception {
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonCall);
		JSONObject movieInfoResult = (JSONObject)(jsonObject.get("movieInfoResult"));
		JSONObject movieInfo = (JSONObject)(movieInfoResult.get("movieInfo"));
		return movieInfo;
	}
	private String movieCall(String movieCd) throws Exception {
		String callAddr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo";
		String key = "6d04d988d4dd90c77967f734fc70b4df";
		String utfKey = URLEncoder.encode(key,"UTF-8");
		String json = ".json";
		String resultKey = null;
		
		resultKey = "?" + "key=" + utfKey;
		movieCd = "&" + "movieCd=" + movieCd;
		callAddr = callAddr + json + resultKey + movieCd;
		URL url = new URL(callAddr);
		InputStream in = url.openStream();
		CachedOutputStream bos = new CachedOutputStream();
		IOUtils.copy(in, bos);
		in.close();
		bos.close();
		return bos.getOut().toString();
	}
	//board
	@Transactional
	@RequestMapping(value="/boardChange", method=RequestMethod.POST)
	public @ResponseBody void boardChange(HttpServletRequest req,HttpServletResponse resp,SearchCriteria cri){
		int category=0;
		String boardChange = req.getParameter("boardChange");
		switch(boardChange){
		case "free": category=6;
		break;
		case "question": category=5;
		break;
		default:category=0;
		}
		String boardNoList[]=req.getParameterValues("boardNo");
		for(String boardNo:boardNoList){
			map=new HashMap<>();
			map.put("category", category);
			map.put("boardNo", Integer.parseInt(boardNo));
			service.boardChange(map);
		}
	}
	@Transactional
	@RequestMapping(value="/boardReplace", method=RequestMethod.POST)
	public @ResponseBody void boardReplace(HttpServletRequest req,HttpServletResponse resp,SearchCriteria cri){
		String boardNoList[]=req.getParameterValues("boardNo");
		for(String boardNo:boardNoList){
			service.boardReplace(Integer.parseInt(boardNo));
		}
	}
	@Transactional
	@RequestMapping(value="/replyQA", method=RequestMethod.POST)
	public @ResponseBody void replyQA(HttpServletRequest req,HttpServletResponse resp,SearchCriteria cri){
		map=new HashMap<>();
		int boardNo=Integer.parseInt(req.getParameter("boardNo"));
		UserVO userVo=(UserVO)req.getSession().getAttribute("userVO");
		map.put("userNo", userVo.getUserNo());
		map.put("boardNo", boardNo);
		map.put("commentContent", req.getParameter("replyContent"));
		service.replyQA(map);
		service.writeReply(boardNo);
	}

}
