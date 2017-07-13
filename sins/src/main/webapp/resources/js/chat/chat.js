/**
 * 
 */

$(function() {
	var userid = $('#userid').val();
	var wsuri = "ws://192.168.20.89:9999/sins/test-ws";
	websocket = new WebSocket(wsuri);
	websocket.onopen = function(event) {
		sendText();	
	}
	websocket.onmessage = function(event) {
		msg = JSON.parse(event.data);
		if(msg.command == "message"){
			switch(msg.type){
				case "event":{
					var text = "<div class='youtext'>"+
					msg.id + "<br/>" + msg.message +
					"<div>";
					writeToScreen(text);
					$('#text').scrollTop($('#text')[0].scrollHeight);
					break;
				}
			}
		}
	}
	$('#chat').keydown(function(event) {
		var msg = $(this).val();
		if(msg != "" && event.keyCode == 13){
			sendText();
		}
	})
})
function sendbtn() {
	var msg = $('#chat').val();
	if(msg != ""){
		sendText();
	}
}
	
//Send text to all users through the server
function sendText() {
  // Construct a msg object containing the data the server needs to process the message from the chat client.
	var id = "<div id='mytext'>" +
		$('#username').val() +"<br/>" + $('#chat').val()+
		"</div>";
	writeToScreen(id);
	
  var msg = {
	groupno : $('#groupno').val(),
    type: "message",
    text: $('#chat').val(),
    id:   $('#username').val(),
    date: Date.now()
  };
  // Send the msg object as a JSON-formatted string.
  websocket.send(JSON.stringify(msg));
  // Blank the text input element, ready to receive the next line of text from the user.
  $('#chat').val("");
  $('#text').scrollTop($('#text')[0].scrollHeight);  
}

function writeToScreen(message) {
    var pre = document.createElement("p");
    pre.style.wordWrap = "break-word";
    pre.innerHTML = message;
    
    text.appendChild(pre);
}
function exitchat() {
	websocket.close();
}
