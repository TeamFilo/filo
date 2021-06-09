package portfolio.model.dao;

import java.util.List;

import portfolio.model.dto.IconDTO;

public interface ShopDAO {
	
	//아이콘가져오기
	public List<IconDTO> getIcon();
	// 현재 사용중인 아이템인지 확인
	public int usingItemCh(String user, String item, String result);
}
