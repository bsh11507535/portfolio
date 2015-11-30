package com.moviews.dto;

public class FavoriteDto {
	int favoriteNo;
	int userNo;
	int movieNo;
	public int getFavoriteNo() {
		return favoriteNo;
	}
	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
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
	@Override
	public String toString() {
		return "favoriteDto [favoriteNo=" + favoriteNo + ", userNo=" + userNo + ", movieNo=" + movieNo + "]";
	}
	
}
