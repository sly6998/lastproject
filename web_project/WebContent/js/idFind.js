/**
 아이디 찾기 js 
 */

 // 유효성 검사(인포커스)
function infocus(element){
	var el_id = element.id;// Element id
	var el_v = element.value;// Element value
	
	var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var email_re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 


	 if(el_id == 'MEMBER_NAME'){
		 if(el_v == '' || !name_re.test(el_v)){
			 $('#name_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
	 }else if(el_id == 'MEMBER_EMAIL'){
		 if(el_v == '' || !email_re.test(el_v)){
			 $('#email_cl').collapse('show');
			 el_v = el_v.replace(/-/gi,'');
			 element.style.borderBottomColor='red';
			 return;
		 }
	 }else if(el_id == 'MEMBER_TEL'){
		 if(el_v == '' || !tel_re.test(el_v)){
			 $('#tel_cl').collapse('show');
			 el_v = el_v.replace(/-/gi,'');
			 element.style.borderBottomColor='red';
			 return;
		 }
	 }
} 
 // 유효성 검사(아웃포커스)
 function valchk(element){
	 
	 var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var email_re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 var el_id = element.id;// Element id
	 var el_v = element.value;// Element value
	 
	 
	 if(el_id == 'MEMBER_NAME'){
		 if(el_v == '' || !name_re.test(el_v)){
			 $('#name_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
		 $('#name_cl').collapse('hide');
		 element.style.borderColor="green";
	 }else if(el_id == 'MEMBER_EMAIL'){
		 if(el_v == '' || !email_re.test(el_v)){
			 $('#email_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
		 $('#email_cl').collapse('hide');
		 element.style.borderColor="green";
	 }else if(el_id == 'MEMBER_TEL'){
		 if(el_v == '' || !tel_re.test(el_v)){
			 $('#tel_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
		 el_v = el_v.replace(/-/gi,'');
		 $('#tel_cl').collapse('hide');
		 element.style.borderColor="green";
		 
	 }
 }
 
 
 function sub(){
	 
	 var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var email_re = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
 
	if(document.getElementById('MEMBER_NAME').value=='' || !name_re.test(document.getElementById('MEMBER_NAME').value)){
		alert('이름을 형식에 맞게 입력하여 주세요.');
		document.getElementById('MEMBER_NAME').value='';
		document.getElementById('MEMBER_NAME').focus();
	}else if(document.getElementById('MEMBER_EMAIL').value=='' || !email_re.test(document.getElementById('MEMBER_EMAIL').value)){
		  alert('이메일을 형식에 맞게 입력하여 주세요.');
		  document.getElementById('MEMBER_EMAIL').value='';
		  document.getElementById('MEMBER_EMAIL').focus();
	}else if(document.getElementById('MEMBER_TEL').value==''|| !tel_re.test(document.getElementById('MEMBER_TEL').value)){
		alert('전화번호를 형식에 맞게 입력하여 주세요.');
		document.getElementById('MEMBER_TEL').value='';
		document.getElementById('MEMBER_TEL').focus();
	}else if(document.id_search_form.MEMBER_YEAR.value==''|| document.id_search_form.MEMBER_MONTH.value==''|| document.id_search_form.MEMBER_DAY.value==''){
		alert('생년월일을 선택하여 주세요.');
	}else{
		var name = document.getElementsByName("MEMBER_NAME")[0].value;
		var tel = document.getElementsByName("MEMBER_TEL")[0].value;
		var year = document.getElementsByName("MEMBER_YEAR")[0].value;
		var month = document.getElementsByName("MEMBER_MONTH")[0].value;
		var day = document.getElementsByName("MEMBER_DAY")[0].value;
		var email = document.getElementsByName("MEMBER_EMAIL")[0].value;
		
		
		window.open("./MemberFindIDAction.html?MEMBER_NAME="+name+"&MEMBER_TEL="+tel+"&MEMBER_YEAR="+year+"&MEMBER_EMAIL="+email+"&MEMBER_MONTH="+month+"&MEMBER_DAY="+day,"",'left='+(screen.availWidth-300)/2+',top='+(screen.availHeight-120)/4+', width=300,height=120px');
		
	}
	 
 }
 
 
 function result_close(){
	 window.close();
	 
 }


