package com.ttotto.board.model.vo;

public class Board {
	private int boardNo;
	private int projNo;
	private String boardName;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, int projNo, String boardName) {
		super();
		this.boardNo = boardNo;
		this.projNo = projNo;
		this.boardName = boardName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getProjNo() {
		return projNo;
	}

	public void setProjNo(int projNo) {
		this.projNo = projNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

}
