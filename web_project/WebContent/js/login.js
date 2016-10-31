/**
 로그인 js
 */

function login(){
	
	var id = document.getElementsByName('MEMBER_ID')[0].value;
	var password = document.getElementsByName('MEMBER_PWD')[0].value;
	var saveID = document.getElementsByName('save_id')[0].checked;
	
	document.getElementsByName('MEMBER_ID')[0].value = id;
	document.getElementsByName('MEMBER_PWD')[0].value = password;
	document.getElementsByName('save_id')[0].value = saveID;
	document.getElementsByName('loginform')[0].submit();
	
}

