package com.seven.sins.alert.service;

import java.util.List;

import com.seven.sins.alert.vo.AlertVO;

public interface AlsertServceinter {

	List<AlertVO> getAlertList(String userId, int start, int limit);

	int getAllcount(String userId);

	int alertDelete(AlertVO alvo);

	List<AlertVO> alertListAjaxTop(String userId);

}
