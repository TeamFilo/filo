package portfolio.model.dto;

public class WalletDTO {
	
	private String id;
	private Integer point, lotteryCnt, rouletteVCnt;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public Integer getLotteryCnt() {
		return lotteryCnt;
	}
	public void setLotteryCnt(Integer lotteryCnt) {
		this.lotteryCnt = lotteryCnt;
	}
	public Integer getRouletteVCnt() {
		return rouletteVCnt;
	}
	public void setRouletteVCnt(Integer rouletteVCnt) {
		this.rouletteVCnt = rouletteVCnt;
	}

	
}
