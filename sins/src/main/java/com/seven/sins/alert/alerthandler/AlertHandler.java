package com.seven.sins.alert.alerthandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.seven.sins.alert.vo.AlertVO;

@ServerEndpoint("/alert-ws")
public class AlertHandler {

	private static Logger logger = LoggerFactory.getLogger("sinsLog");
	private static Map<String, Session> alluser = new HashMap<String, Session>();
	private Session user;
	@OnOpen
	public void alertOpen(Session session) throws IOException{
		user = session;
		logger.info(session + "접속");
	}
	
	@OnMessage
	public void alertOnMessage(String message) throws IOException{

		AlertVO alertvo = convert(message);
		if(alertvo.getType().equals("alert")){
			if(alluser.containsValue(user) && !(alertvo.getSend_id().equals(alluser.get(alertvo.getUser_id()) ))){
				if(alluser.containsKey(alertvo.getUser_id())){
					alluser.get(alertvo.getUser_id()).getBasicRemote().sendText(JSONConverter(alertvo,"alert"));
				}
			}else{
				//로그인이 안된 상대에게 메시지 부분
			}
		}else{

			alluser.put(alertvo.getUser_id(), user);
		}

	}
	
	private AlertVO convert(String message) {
		Gson gson = new Gson();
		AlertVO alertvo = gson.fromJson(message, AlertVO.class);
		return alertvo;
	}

	@OnClose
	public void alsertOnClose(Session session) throws Exception{
		Set key = alluser.keySet();
		Iterator iter = key.iterator();
		while(iter.hasNext()){
			String i = (String) iter.next();
			if(alluser.get(i) == session){
				alluser.remove(i);
			}
		}
		logger.info(session + "나가기");
		
	}
	
	public String JSONConverter(AlertVO alertvo,String type) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("user_id", alertvo.getUser_id());
		jsonObject.put("classify", alertvo.getClassify());
		jsonObject.put("content_no", alertvo.getContent_no());
		jsonObject.put("type", type);
		return jsonObject.toString();
	}
}
