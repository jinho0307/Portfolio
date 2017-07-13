package com.seven.sins.message.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seven.sins.message.dao.MessageDAO;
import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;

@Service("messageservice")
public class MessageServiceImpl implements MessageService{

	@Autowired
	protected MessageDAO messageDAO;
	
	@Override
	public int getListCount(String userid) {
		return messageDAO.getListCount(userid);
	}

	@Override
	public List<MessageVO> getMsgList(String userid, int currentPage, int limit) {
		return messageDAO.getMsgList(userid, currentPage, limit);
	}

	@Override
	public int getSendListCount(String userid) {
		return messageDAO.getSendListCount(userid);
	}

	@Override
	public List<MessageVO> getSendMsgList(String userId, int currentPage, int limit) {
		return messageDAO.getMsgSendList(userId, currentPage, limit);
	}

	@Override
	public int messageSpamInsert(int[] check_no) {
		return messageDAO.messageSpamInsert(check_no);
	}

	@Override
	public int messageResiveDelet(int[] check_no) {
		return messageDAO.messageResiveDelet(check_no);
	}

	@Override
	public int getSeachListCount(MessageListVO listvo) {
		return messageDAO.getSeachListCount(listvo);
	}

	@Override
	public List<MessageVO> getMsgSeachList(MessageListVO listvo, int currentPage, int limit) {
		return messageDAO.getMsgSeachList(listvo, currentPage, limit);
	}

	@Override
	public MessageVO getMessageOne(int msgno, String recive) {
		return messageDAO.getMessageOne(msgno, recive);
	}

	@Override
	public List<String> autocomresiveid(MessageVO msgvo) {
		return messageDAO.autocomresiveid(msgvo);
	}

	@Override
	public int messageSend(MessageVO sendmsg) {
		return messageDAO.messageSend(sendmsg);
	}

	@Override
	public int messageSendDel(int[] check_no) {
		return messageDAO.gessageSendDel(check_no);
	}

	@Override
	public int getSendSeachListCount(MessageListVO listvo) {
		return messageDAO.getSendSeachListCount(listvo);
	}

	@Override
	public List<MessageVO> getSendSeachMsgList(MessageListVO listvo, int currentPage, int limit) {
		return messageDAO.getSendSeachMsgList(listvo, currentPage, limit);
	}

	@Override
	public int getSpamSeachListCount(MessageListVO listvo, String userid) {
		return messageDAO.getSpamSeachListCount(listvo, userid);
	}

	@Override
	public List<MessageVO> getSpamMsgSeachList(String loginid, MessageListVO listvo, int currentPage, int limit) {
		return messageDAO.getSpamMsgSeachList(loginid, listvo, currentPage, limit);
	}

	@Override
	public int getSpamUserListCount(String userId) {
		return messageDAO.getSpamUserListCount(userId);
	}

	@Override
	public List<MessageVO> getSpamUserMsgList(String userId, int currentPage, int limit) {
		return messageDAO.getSpamUserMsgList(userId, currentPage, limit);
	}

	@Override
	public int spamRemove(String userId, String[] check_spamid) {
		return messageDAO.spamRemove(userId, check_spamid);
	}

	@Override
	public MessageVO getMessageOne(int msgno) {
		return messageDAO.getMessageOne(msgno);
	}

	/*@Override
	public Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit) {
		return messageDAO.getMsgMap(userid, currentPage, limit);
	}*/

}
