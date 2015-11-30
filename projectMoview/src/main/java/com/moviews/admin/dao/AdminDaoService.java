package com.moviews.admin.dao;

import java.util.List;
import java.util.Map;

import com.moviews.domain.UserVO;
import com.moviews.dto.BoardDto;
import com.moviews.dto.BoxOfficeDto;
import com.moviews.dto.EvalDto;
import com.moviews.dto.FileDto;
import com.moviews.dto.MovieDto;
import com.moviews.dto.ReplyDto;
import com.moviews.dto.UserInfoDto;
import com.moviews.page.SearchCriteria;

public interface AdminDaoService {
	//login
	public UserVO adminLogin(UserInfoDto dto);
	public int adminNo(String AdminId);
	//user
	public int getAllUserCnt(SearchCriteria cri);
	public int getUserMailCnt(SearchCriteria cri);
	public int getUserCnt(Map<String, Object> map);
	
	public List<UserInfoDto> userAllList(SearchCriteria cri);
	public List<UserInfoDto> userMailList(SearchCriteria cri);
	public List<UserInfoDto> userList(Map<String, Object> map);
	
	public void userStatus(Map<String, Object> map);
	public String getUserMail(int userNo);
	public void resetPass(Map<String, Object> map);
	
	public int getUserBoardCnt(int userNo);
	public UserInfoDto getUserInfo(int userNo);
	public List<BoardDto> userBoardList(Map<String, Object> map);
	
	public void blind(int boardNo);
	public void unblind(int boardNo);
	//movieDB
	public int getAllboxofficeCnt(SearchCriteria cri);
	public List<BoxOfficeDto> boxofficeAllList(SearchCriteria cri);
	
	public int getBoxofficeCnt(int dateNo);
	public BoxOfficeDto boxoffice(int dateNo);
	public List<BoxOfficeDto> boxofficeList(int dateNo);
	
	public void insertBoxDate(Map<String, Object> map);
	public void insertBoxOffice(Map<String, Object> map);
	
	public int getAllMovieCnt(SearchCriteria cri);
	public List<MovieDto> movieAllList(SearchCriteria cri);
	public MovieDto getMovieInfo(int MovieNo);
	public int getMovieEvalCnt(int movieNo);
	public List<EvalDto> movieEvalList(Map<String, Object> map);
	public void movieDelete(int movieNo);
	public void insertMovie(Map<String, Object> map);
	
	
	//board
	public int getAllBoardCnt(SearchCriteria cri);
	public int getBoardCnt(Map<String, Object> map);
	public List<BoardDto> boardAllList(SearchCriteria cri);
	public List<BoardDto> boardList(Map<String, Object> map);
	
	public void boardChange(Map<String, Object> map);
	public void boardReplace(int boardNo);
	public void replyQA(Map<String, Object> map);
	public void writeReply(int boardNo);
	
	public BoardDto getBoardInfo(Map<String, Object> map);
	public List<ReplyDto> getReplyList(Map<String, Object> map) ;
	public List<FileDto> getFileList(int boardNo);
	public ReplyDto getAnswer(int boardNo);
	
	public void writeForm(Map<String, Object> map);
	public void updateForm(Map<String, Object> map);
	
	public void insertFileUpload(FileDto fileDto);
	
	public void addAttach(Map<String, Object> map);
	public void updateAttach(Map<String, Object> map);
}
