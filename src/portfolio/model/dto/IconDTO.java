package portfolio.model.dto;

public class IconDTO {
	
	private Integer iNo;
	private String name, iRoot;
	private Integer needPoint;

	public Integer getiNo() {
		return iNo;
	}
	public void setiNo(Integer iNo) {
		this.iNo = iNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getiRoot() {
		return iRoot;
	}
	public void setiRoot(String iRoot) {
		this.iRoot = iRoot;
	}
	public Integer getNeedPoint() {
		return needPoint;
	}
	public void setNeedPoint(Integer needPoint) {
		this.needPoint = needPoint;
	}
	
}
