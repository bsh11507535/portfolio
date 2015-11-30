package com.moviews.dto;

import java.util.Date;

public class FileDto {
	int fileNo;
	int boardNo;
	String fileName;
	String fileSave;
	long fileSize;
	String fileDate;
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSave() {
		return fileSave;
	}
	public void setFileSave(String fileSave) {
		this.fileSave = fileSave;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileDate() {
		return fileDate;
	}
	public void setFileDate(String fileDate) {
		this.fileDate = fileDate;
	}
	@Override
	public String toString() {
		return "FileDto [fileNo=" + fileNo + ", boardNo=" + boardNo + ", fileName=" + fileName + ", fileSave="
				+ fileSave + ", fileSize=" + fileSize + ", fileDate=" + fileDate + "]";
	}
	
	

}
