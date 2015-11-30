package com.moviews.dto;

public class MovieDto {
	int movieNo;
	String movieNm;
	String movieOg;	
	int movieShowTm; 
	int movieOpenDt; 
	String moviePrdt;
	String movieNation;
	String movieDirectorNo;	
	String movieStory;
	String genreNm;
	String movieWatch;
	String moviePoster;
	String movieTrailer;
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
	public String getMovieOg() {
		return movieOg;
	}
	public void setMovieOg(String movieOg) {
		this.movieOg = movieOg;
	}
	public int getMovieShowTm() {
		return movieShowTm;
	}
	public void setMovieShowTm(int movieShowTm) {
		this.movieShowTm = movieShowTm;
	}
	public int getMovieOpenDt() {
		return movieOpenDt;
	}
	public void setMovieOpenDt(int movieOpenDt) {
		this.movieOpenDt = movieOpenDt;
	}
	public String getMoviePrdt() {
		return moviePrdt;
	}
	public void setMoviePrdt(String moviePrdt) {
		this.moviePrdt = moviePrdt;
	}
	public String getMovieNation() {
		return movieNation;
	}
	public void setMovieNation(String movieNation) {
		this.movieNation = movieNation;
	}
	public String getMovieDirectorNo() {
		return movieDirectorNo;
	}
	public void setMovieDirectorNo(String movieDirectorNo) {
		this.movieDirectorNo = movieDirectorNo;
	}
	public String getMovieStory() {
		return movieStory;
	}
	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}
	public String getGenreNm() {
		return genreNm;
	}
	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}
	public String getMovieWatch() {
		return movieWatch;
	}
	public void setMovieWatch(String movieWatch) {
		this.movieWatch = movieWatch;
	}
	public String getMoviePoster() {
		return moviePoster;
	}
	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}
	public String getMovieTrailer() {
		return movieTrailer;
	}
	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}
	@Override
	public String toString() {
		return "MovieDto [movieNo=" + movieNo + ", movieNm=" + movieNm + ", movieOg=" + movieOg + ", movieShowTm="
				+ movieShowTm + ", movieOpenDt=" + movieOpenDt + ", moviePrdt=" + moviePrdt + ", movieNation="
				+ movieNation + ", movieDirectorNo=" + movieDirectorNo + ", movieStory=" + movieStory + ", genreNm="
				+ genreNm + ", movieWatch=" + movieWatch + ", moviePoster=" + moviePoster + ", movieTrailer="
				+ movieTrailer + "]";
	}	
	
}
