package com.seven.sins.qna.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.qna.dao.QnaDAO;
import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDao;
	
	

	@Override
	public List<QnaContent> selectList(int currentPage, int listLimit) {
		return qnaDao.selectList(currentPage, listLimit);
	}

	@Override
	public int getListCount() {
		return qnaDao.selectCount();
	}

	@Override
	public QnaContent getContent(int qNo) {
		return qnaDao.getContent(qNo);
	}

	@Override
	public int insertCom(QnaComment qc) {
		return qnaDao.insertCom(qc);
	}

	@Override
	public ArrayList<QnaComment> getCommentList(int qNo) {
		
		return qnaDao.getCommentList(qNo);
	}

	@Override
	public int insertQna(QnaContent qna) {
		return qnaDao.insertQna(qna);
	}

	@Override
	public void increaseCount(int qNo) {
		qnaDao.increaseCount(qNo);
		
	}

	@Override
	public int getKeywordCount(String option, String keyword) {
		return qnaDao.getKeywordCount(option, keyword);
		
	}

	@Override
	public List<QnaContent> searchList(int currentPage, int listLimit, String option, String keyword) {
		return qnaDao.searchList(currentPage, listLimit, option, keyword);
	}

	@Override
	public void deleteCom(int qnaNo, int comNo) {

		qnaDao.deleteCom(qnaNo, comNo);
	}

	@Override
	public void deleteQna(int qnaNo) {

		qnaDao.deleteQna(qnaNo);
	}

	@Override
	public int updateQna(QnaContent qna) {
		return qnaDao.updateQna(qna);
	}



	

	
	
}
