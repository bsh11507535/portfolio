package com.moviews.dto;

import java.util.Date;

public class BoardDto {
	int boardNo;
	int boardCategory;
	int boardBeforeCt;
	String boardTitle;
	int userNo;
	String boardContent;
	Date boardDate;
	int boardGrupId;
	int boardPos;
	int boardHit;
	int boardStatus;
	
	int boardGood;
	int boardCall;
	
	int boardSecret;
	int boardAnswer;
	
	int boardRating;
	int movieNo;
	
	String userName;
	String movieNm;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}
	public int getBoardBeforeCt() {
		return boardBeforeCt;
	}
	public void setBoardBeforeCt(int boardBeforeCt) {
		this.boardBeforeCt = boardBeforeCt;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardGrupId() {
		return boardGrupId;
	}
	public void setBoardGrupId(int boardGrupId) {
		this.boardGrupId = boardGrupId;
	}
	public int getBoardPos() {
		return boardPos;
	}
	public void setBoardPos(int boardPos) {
		this.boardPos = boardPos;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	public int getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}
	public int getBoardGood() {
		return boardGood;
	}
	public void setBoardGood(int boardGood) {
		this.boardGood = boardGood;
	}
	public int getBoardCall() {
		return boardCall;
	}
	public void setBoardCall(int boardCall) {
		this.boardCall = boardCall;
	}
	public int getBoardSecret() {
		return boardSecret;
	}
	public void setBoardSecret(int boardSecret) {
		this.boardSecret = boardSecret;
	}
	public int getBoardAnswer() {
		return boardAnswer;
	}
	public void setBoardAnswer(int boardAnswer) {
		this.boardAnswer = boardAnswer;
	}
	public int getBoardRating() {
		return boardRating;
	}
	public void setBoardRating(int boardRating) {
		this.boardRating = boardRating;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", boardBeforeCt=" + boardBeforeCt
				+ ", boardTitle=" + boardTitle + ", userNo=" + userNo + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardGrupId=" + boardGrupId + ", boardPos=" + boardPos + ", boardHit="
				+ boardHit + ", boardStatus=" + boardStatus + ", boardGood=" + boardGood + ", boardCall=" + boardCall
				+ ", boardSecret=" + boardSecret + ", boardAnswer=" + boardAnswer + ", boardRating=" + boardRating
				+ ", movieNo=" + movieNo + ", userName=" + userName + ", movieNm=" + movieNm + "]";
	}

}