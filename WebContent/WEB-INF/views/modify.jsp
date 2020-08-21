<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('/res/images/Kakao.jpg')">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					<input type="hidden" name="ui_num" id="ui_num" value="${user.ui_num}">
					<span class="login100-form-title p-b-49">
						회원정보수정
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "name is reauired">
						<span class="label-input100">Name</span>
						<input class="input100" type="text" name="ui_name" id="ui_name" value="${user.ui_name}" placeholder="Type your name">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="ID is required">
						<span class="label-input100">ID</span>
						<input class="input100" type="text" name="ui_id" id="ui_id" value="${user.ui_id}" placeholder="Type your ID">
						<span class="focus-input100" data-symbol="&#9733;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "password is reauired">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="ui_password" id="ui_password" value="${user.ui_PWD}" placeholder="Type your Password">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="nickname is required">
						<span class="label-input100">NickName</span>
						<input class="input100" type="text" name="ui_nickname" id="ui_nickname" value="${user.ui_nickname}" placeholder="Type your Nickname">
						<span class="focus-input100" data-symbol="&#x2620;"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-23" data-validate = "age is reauired">
						<span class="label-input100">Age</span>
						<input class="input100" type="text" name="ui_age" id="ui_age" value="${user.ui_age}" placeholder="Type your age">
						<span class="focus-input100" data-symbol="&#9787;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="birthday is required">
						<span class="label-input100">Birthday</span>
						<input class="input100" type="date" name="ui_birth" id="ui_birth" value="${user.ui_birth}" placeholder="Type your birthday">
						<span class="focus-input100" data-symbol="&#x212C;"></span>
					</div>
					
						<div class="wrap-input100 validate-input m-b-23" data-validate = "phone is reauired">
						<span class="label-input100">Phone</span>
						<input class="input100" type="text" name="ui_phone" id="ui_phone" value="${user.ui_phone}" placeholder="Type your phone">
						<span class="focus-input100" data-symbol="&#x2706;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="email is required">
						<span class="label-input100">email</span>
						<input class="input100" type="text" name="ui_email" id="ui_email" value="${user.ui_email}"placeholder="Type your email">
						<span class="focus-input100" data-symbol="&#x2709;"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="button" class="login100-form-btn" onclick="domodify()">
								정보수정
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span>
							Or Sign Up Using
						</span>
					</div>

					<div class="flex-c-m">
						<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>
					</div>

					<div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							Or Sign Up Using
						</span>

						<a href="#" class="txt2">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>


<script>
function domodify(){
	var els = document.querySelectorAll('input');
	var params ={};
	for(var i=0;i<els.length;i++){
		var el = els[i]
		params[el.name] = el.value;
	}
	params.cmd = 'modify;'
	$.ajax({
		url :'ajax/user',
		method : 'POST',
		data : JSON.stringify(params),
		contentType : 'application/json',
		success : function(res){
			if(res.result===1){
				alert('회원정보가 수정되었습니다.');
				location.href='/';
			  }else if(res.result===-1){
 				  alert('이미 존재하는 아이디입니다.');
 			  }else{
 				  alert('문제 있음');
 			  }
		}
		
	})
}
function setUiAge(f){
	   var birthDate = new Date(f.value);
	   var toDate = new Date();  
	   document.querySelector('#ui_age').value = (toDate.getFullYear()-birthDate.getFullYear()+1);
}
function checkID(){
	   var id = document.querySelector('#ui_id').value;
	   var url = '/ajax/user';
	   $.ajax({
		   url : url,
		   method : 'GET',
		   data : {ui_id:id,cmd:'checkID'},
		   success : function(res){
			   if(res.result){
				   alert('가입 가능합니다.');
			   }else{
				   alert('가입이 불가능한 아이디입니다.');
			   }
		   }
	   });
}
</script>	


</body>
</html>