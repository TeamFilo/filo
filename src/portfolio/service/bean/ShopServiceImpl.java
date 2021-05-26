package portfolio.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import portfolio.model.dao.ShopDAO;
import portfolio.model.dto.IconDTO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopDAO shopDAO = null;

	@Override
	public List<IconDTO> getIcon() {
		System.out.println("서비스");
		List getIcon = shopDAO.getIcon();
		System.out.println("서비스나옴");
		return getIcon;
	}

}
