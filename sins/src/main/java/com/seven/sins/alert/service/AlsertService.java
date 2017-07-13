package com.seven.sins.alert.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.alert.dao.AlsertDAO;
import com.seven.sins.alert.vo.AlertVO;

@Service("alertservice")
public class AlsertService implements AlsertServceinter{

	@Autowired
	private AlsertDAO alertDAO;
	
	@Override
	public List<AlertVO> getAlertList(String userId, int start, int limit) {
		return alertDAO.getAlertList(userId, start, limit);
	}

	@Override
	public int getAllcount(String userId) {
		return alertDAO.getAllcount(userId);
	}

	@Override
	public int alertDelete(AlertVO alvo) {
		return alertDAO.alertDelete(alvo);
	}

	@Override
	public List<AlertVO> alertListAjaxTop(String userId) {
		return alertDAO.alertListAjaxTop(userId);
	}

}
