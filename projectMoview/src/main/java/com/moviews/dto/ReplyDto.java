package com.moviews.dto;

import java.util.Date;

public class ReplyDto {
	int commentNo;
	Date commentDate;
	String commentContent;
	String userNo;
	String userName;
	int boardNo;
	int commentCall;
	int commentGood;
	int commentStatus;
	
	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getCommentCall() {
		return commentCall;
	}

	public void setCommentCall(int commentCall) {
		this.commentCall = commentCall;
	}

	public int getCommentGood() {
		return commentGood;
	}

	public void setCommentGood(int commentGood) {
		this.commentGood = commentGood;
	}

	public int getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(int commentStatus) {
		this.commentStatus = commentStatus;
	}

	@Override
	public String toString() {
		return "ReplyDto [commentNo=" + commentNo + ", commentDate=" + commentDate + ", commentContent="
				+ commentContent + ", userNo=" + userNo + ", userName=" + userName + ", boardNo=" + boardNo
				+ ", commentCall=" + commentCall + ", commentGood=" + commentGood + ", commentStatus=" + commentStatus
				+ "]";
	}

}
