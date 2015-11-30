package com.moviews.dto;

public class BoxOfficeDto {
	int dateNo;
	String boxOfDate;
	int userNo;
	int movieNo;
	String movieNm;
	int rnum;
	int rank;
	int rankInten;
	long salesAcc;
	long audiAcc;
	String openDt;
	
	String userName;

	public int getDateNo() {
		return dateNo;
	}

	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}

	public String getBoxOfDate() {
		return boxOfDate;
	}

	public void setBoxOfDate(String boxOfDate) {
		this.boxOfDate = boxOfDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getRankInten() {
		return rankInten;
	}

	public void setRankInten(int rankInten) {
		this.rankInten = rankInten;
	}

	public long getSalesAcc() {
		return salesAcc;
	}

	public void setSalesAcc(long salesAcc) {
		this.salesAcc = salesAcc;
	}

	public long getAudiAcc() {
		return audiAcc;
	}

	public void setAudiAcc(long audiAcc) {
		this.audiAcc = audiAcc;
	}

	public String getOpenDt() {
		return openDt;
	}

	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "BoxOfficeDto [dateNo=" + dateNo + ", boxOfDate=" + boxOfDate + ", userNo=" + userNo + ", movieNo="
				+ movieNo + ", movieNm=" + movieNm + ", rnum=" + rnum + ", rank=" + rank + ", rankInten=" + rankInten
				+ ", salesAcc=" + salesAcc + ", audiAcc=" + audiAcc + ", openDt=" + openDt + ", userName=" + userName
				+ "]";
	}

	
}
