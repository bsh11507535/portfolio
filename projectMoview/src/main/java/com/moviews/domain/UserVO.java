package com.moviews.domain;

import java.util.Date;
//세션에 저장할 사용자 정보 집합
public class UserVO {
	int userNo;
	String userMail;
	String userName;
	String userPass;
	Date userAcc;
	int userLevel;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public Date getUserAcc() {
		return userAcc;
	}
	public void setUserAcc(Date userAcc) {
		this.userAcc = userAcc;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	@Override
	public String toString() {
		return "UserVO [userNo=" + userNo + ", userMail=" + userMail + ", userName=" + userName + ", userPass="
				+ userPass + ", userAcc=" + userAcc + ", userLevel=" + userLevel + "]";
	}
	
}
