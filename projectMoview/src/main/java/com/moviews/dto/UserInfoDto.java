package com.moviews.dto;

import java.util.Date;

public class UserInfoDto {
	int	userNo;
	String userMail;
	String userName;
	String userPass;
	int userCheck;
	Date userJoin;
	Date userAcc;
	int userStatus;
	Date userBlind;	
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
	public int getUserCheck() {
		return userCheck;
	}
	public void setUserCheck(int userCheck) {
		this.userCheck = userCheck;
	}
	public Date getUserJoin() {
		return userJoin;
	}
	public void setUserJoin(Date userJoin) {
		this.userJoin = userJoin;
	}
	public Date getUserAcc() {
		return userAcc;
	}
	public void setUserAcc(Date userAcc) {
		this.userAcc = userAcc;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public Date getUserBlind() {
		return userBlind;
	}
	public void setUserBlind(Date userBlind) {
		this.userBlind = userBlind;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	@Override
	public String toString() {
		return "UserInfoDto [userNo=" + userNo + ", userMail=" + userMail + ", userName=" + userName + ", userPass="
				+ userPass + ", userCheck=" + userCheck + ", userJoin=" + userJoin + ", userAcc=" + userAcc
				+ ", userStatus=" + userStatus + ", userBlind=" + userBlind + ", userLevel=" + userLevel + "]";
	}
	
}