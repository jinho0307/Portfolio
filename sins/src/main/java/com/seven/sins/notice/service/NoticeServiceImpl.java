package com.seven.sins.notice.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.notice.dao.NoticeDAO;
import com.seven.sins.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public int getListCount() {
		return noticeDAO.getListCount();
	}

	@Override
	public List<NoticeVO> selectNotice(int currentPage, int listLimit) {
		return noticeDAO.selectNotice(currentPage, listLimit);
	}

	@Override
	public void increaseCount(int nNo) {
		noticeDAO.increaseCount(nNo);
	}

	@Override
	public NoticeVO getNotice(int nNo) {
		return noticeDAO.getNotice(nNo);
	}

	@Override
	public void noticeDelete(int no) {

		noticeDAO.noticeDelete(no);
	}

	@Override
	public void noticeUpdate(NoticeVO notice) {
		noticeDAO.noticeUpdate(notice);
	}

	@Override
	public void noticeWrite(NoticeVO notice) {
		noticeDAO.noticeWrite(notice);
	}

	

}
