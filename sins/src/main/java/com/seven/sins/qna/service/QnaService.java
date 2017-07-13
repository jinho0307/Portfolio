package com.seven.sins.qna.service;

import java.util.ArrayList;
import java.util.List;

import com.seven.sins.qna.vo.QnaComment;
import com.seven.sins.qna.vo.QnaContent;

public interface QnaService {

	List<QnaContent> selectList(int currentPage, int listLimit);

	int getListCount();

	QnaContent getContent(int qNo);

	int insertCom(QnaComment qc);

	ArrayList<QnaComment> getCommentList(int qNo);

	int insertQna(QnaContent qna);

	void increaseCount(int qNo);

	int getKeywordCount(String option, String keyword);

	List<QnaContent> searchList(int currentPage, int listLimit, String option, String keyword);

	void deleteCom(int qnaNo, int comNo);

	void deleteQna(int qnaNo);

	int updateQna(QnaContent qna);

	

	


}
