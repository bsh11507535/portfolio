package com.moviews.dto;

import java.util.Date;

public class EvalDto {
	int evalNo;
	int	userNo;
	Date evalDate;
	String evalContent;
	int evalRating;
	int movieNo;
	int evalCall;
	int evalGood;
	int evalStatus;
	String userName;
	public int getEvalNo() {
		return evalNo;
	}
	public void setEvalNo(int evalNo) {
		this.evalNo = evalNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(Date evalDate) {
		this.evalDate = evalDate;
	}
	public String getEvalContent() {
		return evalContent;
	}
	public void setEvalContent(String evalContent) {
		this.evalContent = evalContent;
	}
	public int getEvalRating() {
		return evalRating;
	}
	public void setEvalRating(int evalRating) {
		this.evalRating = evalRating;
	}
	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public int getEvalCall() {
		return evalCall;
	}
	public void setEvalCall(int evalCall) {
		this.evalCall = evalCall;
	}
	public int getEvalGood() {
		return evalGood;
	}
	public void setEvalGood(int evalGood) {
		this.evalGood = evalGood;
	}
	public int getEvalStatus() {
		return evalStatus;
	}
	public void setEvalStatus(int evalStatus) {
		this.evalStatus = evalStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "EvalDto [evalNo=" + evalNo + ", userNo=" + userNo + ", evalDate=" + evalDate + ", evalContent="
				+ evalContent + ", evalRating=" + evalRating + ", movieNo=" + movieNo + ", evalCall=" + evalCall
				+ ", evalGood=" + evalGood + ", evalStatus=" + evalStatus + ", userName=" + userName + "]";
	}
	
}
