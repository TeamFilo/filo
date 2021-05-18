package portfolio.model.dto;

import java.sql.Timestamp;

public class GameRecordDTO {

	private String id;
	private Integer gameCate, score;
	private Timestamp reg;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getGameCate() {
		return gameCate;
	}
	public void setGameCate(Integer gameCate) {
		this.gameCate = gameCate;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
}
