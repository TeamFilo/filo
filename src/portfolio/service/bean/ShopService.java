package portfolio.service.bean;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import portfolio.model.dto.IconDTO;

public interface ShopService {

	public List<IconDTO> getIcon();

}

