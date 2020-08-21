<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>


</head>
<body>
<nav class="navbar navbar-expand-sm bg-light"> 
	<ul class="navbar-nav">
		
		<li class="nav-item">
		
			<a href="" class="nav-link"> 메뉴1</a> 
			
		</li>
		
		<li class="nav-item">
		
			<a href="" class="nav-link"> 메뉴2</a>
			
		</li>
		
		<li class="nav-item">
		
			<a href="" class="nav-link"> 메뉴3</a>
			
		</li>
		
		<li class="nav-item">
		
			<a href="" class="nav-link"> 메뉴4</a>
			
		</li>
	
	
	</ul>



</nav>
<div class="conainer">
	${sessionScope.user.ui_name}님 반갑습니다.<br>
	<c:if test="${sessionScope.user.ui_admin =='1'}">
	<a href="/views/userlist"><button  class="btn btn-info" >유저리스트</button></a>
	</c:if>
	
	<button class="btn btn-info" onclick="doLogout()">logout</button>&nbsp
	<a href="/views/modify"><button class="btn btn-info">정보수정</button></a>
</div>
<script>
function doLogout(){

	$.ajax({
		url : '/ajax/user',
		method: 'POST',
		data : JSON.stringify({cmd:'logout'}),
		success : function(res){
			if(res.result){
			alert('로그아웃');
			location.href='views/login';
		}
		}
	})
}
</script>
</body>
</html>