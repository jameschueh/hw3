package com.systex.hw3.game;

public class GuessGame {
	
	private int remains;
	private int luckyNumber;
	
	public GuessGame(int remains, int luckyNumber) {
		this.remains = remains;
		this.luckyNumber = luckyNumber;
	}
	
    public boolean guess(int number) {
        if (remains > 0) {
            remains--;
            return number == luckyNumber;
        } else {
            return false;
        }
    }
	
    public int getRemains() {
        return remains;
    }
	
}
