package com.seven.sins.message.service;

import java.util.List;
import java.util.Map;

import com.seven.sins.message.vo.MessageListVO;
import com.seven.sins.message.vo.MessageVO;

public interface MessageService {

	int getListCount(String userid);

	List<MessageVO> getMsgList(String userid, int currentPage, int limit);

	int getSendListCount(String userId);

	List<MessageVO> getSendMsgList(String userId, int currentPage, int limit);

	int messageSpamInsert(int[] check_no);

	int messageResiveDelet(int[] check_no);

	int getSeachListCount(MessageListVO listvo);

	List<MessageVO> getMsgSeachList(MessageListVO listvo, int currentPage, int limit);

	MessageVO getMessageOne(int msgno, String recive);

	List<String> autocomresiveid(MessageVO msgvo);

	int messageSend(MessageVO sendmsg);

	int messageSendDel(int[] check_no);

	int getSendSeachListCount(MessageListVO listvo);

	List<MessageVO> getSendSeachMsgList(MessageListVO listvo, int currentPage, int limit);

	int getSpamSeachListCount(MessageListVO listvo, String userid);

	List<MessageVO> getSpamMsgSeachList(String loinid, MessageListVO listvo, int currentPage, int limit);

	int getSpamUserListCount(String userId);

	List<MessageVO> getSpamUserMsgList(String userId, int currentPage, int limit);

	int spamRemove(String userId, String[] check_spamid);

	MessageVO getMessageOne(int msgno);

	//Map<String, MessageVO> getMsgMap(String userid, int currentPage, int limit);

}
