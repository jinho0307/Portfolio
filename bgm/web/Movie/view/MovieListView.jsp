
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*, java.util.*,  member.model.vo.*"%>

<%
ArrayList<Movie> movieMap = (ArrayList<Movie>) request.getAttribute("movieMap");
	Member loginUser = (Member)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
isLogin=false;
<%
if(loginUser!=null){
%>
isLogin=true;
<%}%>
$(function() {
	$('header').load('/bgm/common/view/header.jsp');
	$('footer').load('/bgm/common/view/footer.jsp');
});
</script>
<title>Insert title here</title>

<style>

#nlistContainer {
	width: 1150px;
	margin: auto;
}

.thDiv:not(#last) {
	border-right: 1px solid rgba(200, 200, 200, 1);
}

#boardMenu #innerMenu {
	list-style: none;
	overflow: auto;
}

#boardMenu #innerMenu li {
	float: left;
	margin-right: 30px;
}

#boardMenu #innerMenu li a {
	color: black;
	font-weight: bold;
}

#boardMenu #innerMenu #btnLi {
	float: right;
}

.writeBtn {
	width: 120px;
	height: 30px;
	font-size: 12pt;
	color: white;
	background: rgba(200, 0, 0, 0.7);
}

#nSearchContainer {
	position: relative;
	clear: left;
	height: 25px;
	margin: 30px;
}

#nSearchContainer>span {
	right: 0;
	position: absolute;
	text-align: right;
}

#nSearchContainer .searchSelect {
	width: 100px;
	height: 25px;
	margin-right: 5px;
}

#nSearchContainer #searchText {
	position: absolute;
	top: 0;
	width: 150px;
	height: 20px;
}

#nSearchContainer #submitBtn {
	position: absolute;
	top: 0;
	height: 25px;
	left: 160px;
}

#listDiv #nlistTable {
	width: 1100px;
	margin: 0 auto;
	border-collapse: collapse;
}

#listDiv #nlistTable a {
	color: #555;
}

#listDiv #nlistTable th {
	border-top: 2px solid rgba(200, 200, 200, 1);
	border-bottom: 2px solid rgba(200, 200, 200, 1);
}

#listDiv #nlistTable tr {
	height: 50px;
}

#listDiv #nlistTable .nTd {
	text-align: center;
	width: 130px;
}

#listDiv #nlistTable #td3 {
	padding-left: 20px;
}

#listDiv #nlistTable tr {
	border-bottom: 1px solid rgba(200, 200, 200, 0.5);
}

#paging {
	text-align: center;
}

#listDiv {
	height: 400px auto;
	margin-bottom: 40px;
}

#bottomBtn {
	float: right;
	margin-right: 30px;
}

</style>
</head>
<header></header>
<body>
<center>
<%if(loginUser!=null&&loginUser.getManager()==0){ %>
	<h1>관리자 전용 영화 목록 보기 페이지</h1>
	<br><br>
	<form action="/bgm/mmsearch2" method="post"
			onsubmit="return validate();" style="width: 1150px;"><select name="sel" id="sel">
	<option value="1" selected>전체검색</option>
	<option value="2">영화제목</option>
	<option value="3">감독</option>
	<option value="4">장르</option>
  </select><input type="text" id="select" name="select"  placeholder="검색 단어 입력">
<input type="submit" value="검색하기" id="sub1">
</form>
<br><br>
<div id="listDiv">
	<table id="nlistTable" cellspacing="0" style="width:1150px;">
	<tr class="nTr"><th><div class="thDiv">영화아이디</div></th><th><div class="thDiv">영화제목</div></th><th><div class="thDiv">영화개봉일</div></th><th><div class="thDiv">감독</div></th>
	<th><div class="thDiv">출연진</div></th><th><div class="thDiv">장르</div></th><th><div class="thDiv">등급</div></th><th><div class="thDiv">영화금액</div></th>
	<th><div class="thDiv">상영/종영여부(1/2)</div></th></tr>
	<%int i=0; int j =0;
		for(i=0;i<movieMap.size();i++){
			Movie movie = movieMap.get(i);
	%>
	<%if(i<5){%>
	<tr class="nTr0"><td><%= movie.getmId() %></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;">
		<a href="/bgm/mdetail?movieid=<%=movie.getmId()%>"
					class="movie" style="color:green;"><%= movie.getmName() %></a>
		</div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmDate() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmDirector() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmCast() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmGenre() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmAge() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmPay() %>원</div></td>
		<%int a= movie.getmYN();
		String aa="";
		if(a==1){
			aa+="상영중";
		}else{
			aa+="종영";
		}
		%>
		<td><%= aa%></td>
	</tr>
	<%}else if(i%5==0){ j++;%>
	<tr class="nTr<%=j%>" style="display:none;"><td><%= movie.getmId() %></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;">
		<a href="/bgm/mdetail?movieid=<%=movie.getmId()%>"
					class="movie" style="color:green;"><%= movie.getmName() %></a>
		</div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmDate() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmDirector() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmCast() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmGenre() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmAge() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmPay() %>원</div></td>
		<%int a= movie.getmYN();
		String aa="";
		if(a==1){
			aa+="상영중";
		}else{
			aa+="종영";
		}
		%>
		<td><%= aa%></td>
	</tr><%}else if(i%5!=0){ %>
	
	<tr class="nTr<%=j%>" style="display:none;"><td><%= movie.getmId() %></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;">
		<a href="/bgm/mdetail?movieid=<%=movie.getmId()%>"
					class="movie" style="color:green;"><%= movie.getmName() %></a>
		</div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmDate() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmDirector() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmCast() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmGenre() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmAge() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmPay() %>원</div></td>
		<%int a= movie.getmYN();
		String aa="";
		if(a==1){
			aa+="상영중";
		}else{
			aa+="종영";
		}
		%>
		<td><%=aa%></td>
	</tr><%}else if(i==movieMap.size()-1){ %>
	<tr class="nTr<%=j%>" style="display:none;"><td><%= movie.getmId() %></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;">
		<a href="/bgm/mdetail?movieid=<%=movie.getmId()%>"
					class="movie" style="color:green;"><%= movie.getmName() %></a>
		</div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmDate() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmDirector() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmCast() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 150px; text-overflow: ellipsis;  display: block;"><%= movie.getmGenre() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmAge() %></div></td>
		<td><div style="overflow:hidden;  white-space  : nowrap; width : 100px; text-overflow: ellipsis;  display: block;"><%= movie.getmPay() %>원</div></td>
		<%int a= movie.getmYN();
		String aa="";
		if(a==1){
			aa+="상영중";
		}else{
			aa+="종영";
		}
		%>
		<td><%= aa%></td>
	</tr><%} %>
	<%} %>
	</table>
	<br>
	<input type="button" id="bbb" value="이전">
	<input type="button" id="aaa" value="다음">	
	<br>
	<input type="button" value="새 영화정보 추가하기" onclick="location='/bgm/Movie/view/MovieInsert.jsp'">
	</div>
</center>
<script>
var count =0; var j=<%=j%>;
$("#aaa").click(function(){
	if(count==j){}else{
	$(".nTr"+count).hide();
	count++;
	$(".nTr"+count).show();
	}
	


});
 $("#bbb").click(function(){
	if(count==0){
	}else{
	$(".nTr"+count).hide();
	count--;
	$(".nTr"+count).show();
	}
}); 
</script>		
<%}else{ %>
<h1>권한이 없는 페이지 입니다</h1>
<br>
<input type="button" value="메인으로 돌아가기" onclick="location='/bgm/index.jsp'">
<%} %>
</body>
<footer></footer>
</html>