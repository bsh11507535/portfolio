package com.moviews.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moviews.admin.dao.AdminDaoService;
import com.moviews.domain.UserVO;
import com.moviews.dto.BoardDto;
import com.moviews.dto.BoxOfficeDto;
import com.moviews.dto.EvalDto;
import com.moviews.dto.FileDto;
import com.moviews.dto.MovieDto;
import com.moviews.dto.ReplyDto;
import com.moviews.dto.UserInfoDto;
import com.moviews.page.SearchCriteria;

@Service
public class AdminImpl implements AdminService {
	int pageNum;
	HashMap<String, Object> map;

	@Inject
	AdminDaoService dao;

	//login
	@Override
	public UserVO login(UserInfoDto dto) {
		return dao.adminLogin(dto);
	}
	@Override
	public int adminNo(UserInfoDto dto) {
		return dao.adminNo(dto.getUserMail());
	}

	//userList
	@Override
	public int getAllUserCnt(SearchCriteria cri) {
		return dao.getAllUserCnt(cri);
	}
	
	@Override
	public int getUserMailCnt(SearchCriteria cri) {
		return dao.getUserMailCnt(cri);
	}
	@Override
	public int getUserCnt(SearchCriteria cri,int userStatus) {
		map=new HashMap<>();
		map.put("userStatus",userStatus);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		map.put("searchType",cri.getSearchType());
		map.put("keyword",cri.getKeyword());
		return dao.getUserCnt(map);
	}
	@Override
	public List<UserInfoDto> userAllList(SearchCriteria cri) {
		return dao.userAllList(cri);
	}

	@Override
	public List<UserInfoDto> userMailList(SearchCriteria cri) {
		return dao.userMailList(cri);
	}
	@Override
	public List<UserInfoDto> userList(SearchCriteria cri, int userStatus) {
		map=new HashMap<>();
		map.put("userStatus",userStatus);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		map.put("searchType",cri.getSearchType());
		map.put("keyword",cri.getKeyword());
		return dao.userList(map);
	}

	@Override
	public String getUserMail(int userNo) {
		return dao.getUserMail(userNo);
	}
	@Override
	public void resetPass(Map<String, Object> map) {
		dao.resetPass(map);
	}

	//userDetail
	@Override
	public int getUserBoardCnt(int userNo) {
		return dao.getUserBoardCnt(userNo);
	}
	@Override
	public UserInfoDto getUserInfo(int userNo) {
		return dao.getUserInfo(userNo);
	}
	@Override
	public List<BoardDto> userBoardList(Map<String, Object> map) {
		return dao.userBoardList(map);
	}

	//about Blind
	@Override
	public void blind(int boardNo) {
		dao.blind(boardNo);
	}
	@Override
	public void unblind(int boardNo) {
		dao.unblind(boardNo);
	}

	@Override
	public void userStatus(Map<String, Object> map) {
		dao.userStatus(map);
	}
	//movieDB
	@Override
	public int getAllboxofficeCnt(SearchCriteria cri) {
		return dao.getAllboxofficeCnt(cri);
	}
	@Override
	public List<BoxOfficeDto> boxofficeAllList(SearchCriteria cri) {
		return dao.boxofficeAllList(cri);
	}
	@Override
	public int getBoxofficeCnt(int dateNo) {
		return dao.getBoxofficeCnt(dateNo);
	}
	
	@Override
	public BoxOfficeDto boxoffice(int dateNo) {
		return dao.boxoffice(dateNo);
	}
	@Override
	public List<BoxOfficeDto> boxofficeList(int dateNo) {
		return dao.boxofficeList(dateNo);
	}

	@Override
	public void insertBoxDate(Map<String, Object> map) {
		dao.insertBoxDate(map);
	}
	@Override
	public void insertBoxOffice(Map<String, Object> map) {
		dao.insertBoxOffice(map);
	}
	
	@Override
	public int getAllMovieCnt(SearchCriteria cri) {
		return dao.getAllMovieCnt(cri);
	}
	@Override
	public List<MovieDto> movieAllList(SearchCriteria cri) {
		return dao.movieAllList(cri);
	}
	@Override
	public MovieDto getMovieInfo(int movieNo) {
		return dao.getMovieInfo(movieNo);
	}
	@Override
	public int getMovieEvalCnt(int movieNo) {
		return dao.getMovieEvalCnt(movieNo);
	}
	@Override
	public List<EvalDto> movieEvalList(Map<String, Object> map) {
		return dao.movieEvalList(map);
	}
	@Override
	public int getAllPeopleCnt(SearchCriteria cri) {
		return 0;
	}
	@Override
	public List<MovieDto> peopleAllList(SearchCriteria cri) {
		return null;
	}
	@Override
	public int getAllTheaterCnt(SearchCriteria cri) {
		return 0;
	}
	@Override
	public List<MovieDto> theaterAllList(SearchCriteria cri) {
		return null;
	}
	@Override
	public void movieDelete(int movieNo) {
		dao.movieDelete(movieNo);
	}
	@Override
	public void insertMovie(Map<String, Object> map) {
		dao.insertMovie(map);
	}

	//board
	@Override
	public int getAllBoardCnt(SearchCriteria cri) {
		return dao.getAllBoardCnt(cri);
	}
	@Override
	public int getBoardCnt(SearchCriteria cri,int boardCategory) {
		map=new HashMap<>();
		map.put("boardCategory", boardCategory);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		map.put("searchType",cri.getSearchType());
		map.put("keyword",cri.getKeyword());
		return dao.getBoardCnt(map);
	}
	@Override
	public List<BoardDto> boardAllList(SearchCriteria cri) {
		return dao.boardAllList(cri);
	}
	@Override
	public List<BoardDto> boardList(SearchCriteria cri,int boardCategory) {
		map=new HashMap<>();
		map.put("boardCategory", boardCategory);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		map.put("searchType",cri.getSearchType());
		map.put("keyword",cri.getKeyword());
		return dao.boardList(map);
	}

	@Override
	public void boardChange(Map<String, Object> map) {
		dao.boardChange(map);
	}
	@Override
	public void boardReplace(int boardNo) {
		dao.boardReplace(boardNo);
	}
	@Override
	public void replyQA(Map<String, Object> map) {
		dao.replyQA(map);
	}
	@Override
	public void writeReply(int boardNo) {
		dao.writeReply(boardNo);
	}

	@Override
	public BoardDto getBoardInfo(Map<String, Object> map) {
		return dao.getBoardInfo(map);
	}
	@Override
	public List<ReplyDto> getReplyList(SearchCriteria cri,int boardNo) {
		map=new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
		map.put("searchType",cri.getSearchType());
		map.put("keyword",cri.getKeyword());
		return dao.getReplyList(map);
	}
	@Override
	public List<FileDto> getFileList(int boardNo) {
		return dao.getFileList(boardNo);
	}
	
	@Override
	public ReplyDto getAnswer(int boardNo) {
		return dao.getAnswer(boardNo);
	}

	@Override
	public void insertBoard(Map<String, Object> map,List<String> changeFileNm,String changeCalcPath) {
		dao.writeForm(map);
		for(String fileName:changeFileNm){
			this.map=new HashMap<>();
			this.map.put("fileName", fileName.replace("+-+^","."));
			this.map.put("fileSave", fileName.replace("+-+^","."));
			this.map.put("fileDate", changeCalcPath);
			dao.addAttach(this.map);
		};
	}
	
	@Override
	public void insertFileUpload(FileDto fileDto) {
		dao.insertFileUpload(fileDto);
	}

	@Override
	public void updateBoard(Map<String, Object> map,int boardNo,List<String> changeFileNm,String changeCalcPath) {
		dao.updateForm(map);
		for(String fileName:changeFileNm){
			this.map=new HashMap<>();
			this.map.put("boardNo", boardNo);
			this.map.put("fileName", fileName);
			this.map.put("fileSave", fileName);
			this.map.put("fileDate", changeCalcPath);
			dao.updateAttach(this.map);
		};

	}


}
