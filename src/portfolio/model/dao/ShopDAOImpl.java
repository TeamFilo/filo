package portfolio.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import portfolio.model.dto.IconDTO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	//아이콘가져오기
	@Override
	public List<IconDTO> getIcon() {
		List getIcon = sqlSession.selectList("game.getIcon");
		return getIcon;
	}

	// 현재 사용중인 아이템인지 확인
	@Override
	public int usingItemCh(String user, String item, String result) {
		
		Map map =  new HashMap<String, String>();
		map.put("user", user);
		map.put("item", item);
		map.put("result", result);
		
		int res = sqlSession.selectOne("game.usingItemCh", map);
		return res;
	}

}
