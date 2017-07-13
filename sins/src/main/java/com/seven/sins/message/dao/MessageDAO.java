package com.seven.sins.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;
import com.seven.sins.message.vo.SpamUser;


@Repository("messageDAO")
public class MessageDAO {

	private static final String NAMESPACE = "Message.";

	@Autowired
	private SqlSession sqlSession;
	//받은 메시지 리스트카운트
	public int getListCount(String userid) {
		return (int)sqlSession.selectOne(NAMESPACE + "listcount", userid);
	}

	//받은메시지 리스트
	@SuppressWarnings("unchecked")
	public List<MessageVO> getMsgList(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	 
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (List<MessageVO>)sqlSession.selectList(NAMESPACE + "readlist", userid, rowbound);
	}

	//보낸메시지 리스트 카운트
	public int getSendListCount(String userid) {
		return (int)sqlSession.selectOne(NAMESPACE + "sendlistcount", userid);
	}

	//보낸메시지 리스트
	@SuppressWarnings("unchecked")
	public List<MessageVO> getMsgSendList(String userId, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (List<MessageVO>)sqlSession.selectList(NAMESPACE + "sendlist", userId, rowbound);
	}

	// 스팸 등록
	public int messageSpamInsert(int[] check_no) {
		int result = 0;
		for(int i = 0 ; i < check_no.length;i++){
			result += (int)sqlSession.update(NAMESPACE + "spaminsert",check_no[i]);
		}
		return result;
	}

	//리시브쪽 삭제y바꾸기
	public int messageResiveDelet(int[] check_no) {
		int result = 0;
		if(check_no != null && check_no.length>0){
			for(int i =0;i<check_no.length;i++){
				result += (int)sqlSession.update(NAMESPACE + "resivedel", check_no[i]);
			}
		}
		return result;
	}
	//받은서치리스트 카운트 
	public int getSeachListCount(MessageListVO listvo) {
		listvo.setSeach("%"+ listvo.getSeach()+"%");
		return (int)sqlSession.selectOne(NAMESPACE+"seachlistcount", listvo);
	}
	//받은메시지서치 리스트 
	@SuppressWarnings("unchecked")
	public List<MessageVO> getMsgSeachList(MessageListVO listvo, int currentPage, int limit) {
		List<MessageVO> msglist = null;
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		listvo.setSeach("%" + listvo.getSeach() + "%");
		if(listvo.getSelect().equals("id")){
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "idseachlist", listvo, rowbound);
		}else if(listvo.getSelect().equals("name")){
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "nameseachlist", listvo, rowbound);
		}else{
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "contentseachlist", listvo, rowbound);
		}
		return msglist;
	}

	//메세지 1개 선택(받은거 보낸거둘다)
	public MessageVO getMessageOne(int msgno, String recive) {
		//리시브쪽 디테일 일경우 읽음 y 표시
		if(recive != null){
			int result = (int)sqlSession.update(NAMESPACE + "msgread" , msgno);
		}
					
		return (MessageVO)sqlSession.selectOne(NAMESPACE+"selectone", msgno);
	}
	// 친구목록 가져오기
	@SuppressWarnings("unchecked")
	public List<String> autocomresiveid(MessageVO msgvo) {
		msgvo.setReceivie_id("%"+ msgvo.getReceivie_id() + "%");
		RowBounds rowBound = new RowBounds(0,9);
		return (List<String>)sqlSession.selectList(NAMESPACE + "autocomresiveid", msgvo,rowBound);
	}
	// 메시지 보내기
	public int messageSend(MessageVO sendmsg) {
		return (int)sqlSession.insert(NAMESPACE + "sendmsg", sendmsg);
	}
	//보낸 메시지 삭제
	public int gessageSendDel(int[] check_no) {
		int result = 0;
		if(check_no != null && check_no.length>0){
			for(int i =0;i<check_no.length;i++){
				result += (int)sqlSession.update(NAMESPACE + "senddel", check_no[i]);
			}
		}
		return result;
	}
	//보낸 검색 리스트 카운트
	public int getSendSeachListCount(MessageListVO listvo) {
		return (int)sqlSession.selectOne(NAMESPACE + "sendseachlistcount", listvo);
	}
	// 보낸 검색 메시지 리스트 
	@SuppressWarnings("unchecked")
	public List<MessageVO> getSendSeachMsgList(MessageListVO listvo, int currentPage, int limit) {
		List<MessageVO> msglist = null;
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		listvo.setSeach("%" + listvo.getSeach() + "%");
		if(listvo.getSelect().equals("id")){
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "idsendseachlist", listvo, rowbound);
		}else if(listvo.getSelect().equals("name")){
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "namesendseachlist", listvo, rowbound);
		}else{
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "contentsendseachlist", listvo, rowbound);
		}
		return msglist;
	}

	//스팸 리스트 카운트
	public int getSpamSeachListCount(MessageListVO listvo,String userid) {
		int result = 0;
		if(listvo.getLoginid() != null){
			result = (int)sqlSession.selectOne(NAMESPACE+"spamseachlistcount", listvo);
		}else{
			result = (int)sqlSession.selectOne(NAMESPACE + "spamlistcount", userid);
		}
		return result;
	}

	//스팸 리스트 
	@SuppressWarnings("unchecked")
	public List<MessageVO> getSpamMsgSeachList(String loginid, MessageListVO listvo, int currentPage, int limit) {
		List<MessageVO> msglist = null;

		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		
		if(listvo.getLoginid() == null || listvo.getLoginid().equals("")){
		
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "spamseachlist", loginid, rowbound);
		}else if(listvo.getSelect().equals("name")){
		
			listvo.setSeach("%" + listvo.getSeach() + "%");
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "namespamseachlist", listvo, rowbound);
		}else if(listvo.getSelect().equals("cont")){
		
			listvo.setSeach("%" + listvo.getSeach() + "%");
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "contentspamseachlist", listvo, rowbound);
		}else{
		
			listvo.setSeach("%" + listvo.getSeach() + "%");
			msglist = (List<MessageVO>)sqlSession.selectList(NAMESPACE + "idspamseachlist", listvo, rowbound);
		}
		return msglist;
	}
	
	//스팸유저 메시지 카운트
	public int getSpamUserListCount(String userId) {
		return (int)sqlSession.selectOne(NAMESPACE + "spamuserlistcount", userId);
	}

	//스팸 유저 리스트
	@SuppressWarnings("unchecked")
	public List<MessageVO> getSpamUserMsgList(String userId, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (List<MessageVO>)sqlSession.selectList(NAMESPACE + "spamuserlist", userId, rowbound);
	}
	//스팸 등록 삭제
	public int spamRemove(String userId, String[] check_spamid) {
		MessageVO vo = new MessageVO();
		vo.setSend_id(userId);
		
		int result = 0;
		for(int i = 0 ; i < check_spamid.length;i++){
			vo.setReceivie_id(check_spamid[i]);
			result += (int)sqlSession.delete(NAMESPACE + "spamremove", vo);
		}
		return result;
	}

	public MessageVO getMessageOne(int msgno) {
		return (MessageVO)sqlSession.selectOne(NAMESPACE + "msglisthead", msgno);
	}


/*	@SuppressWarnings("unchecked")
	public Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit; 
	    int endRow = startRow + limit - 1; 
	    
	    RowBounds rowbound= new RowBounds(startRow, endRow);
		return (Map<String, MessageVO>)sqlSession.selectMap(NAMESPACE + "selectmap", userid, "message_no", rowbound);
	}*/
	
	
}
