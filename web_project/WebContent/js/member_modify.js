/**
 마이페이지 js
 */
// 우편번호 검색
 function execDaumPost() {
  new daum.Postcode(
    {
     oncomplete : function(data) {
      var fullAddr = ''; 
      var extraAddr = ''; 

      if (data.userSelectedType === 'R') { 
       fullAddr = data.roadAddress;

      } else { 
       fullAddr = data.jibunAddress;
      }

      if (data.userSelectedType === 'R') {
       if (data.bname !== '') {
        extraAddr += data.bname;
       }
       if (data.buildingName !== '') {
        extraAddr += (extraAddr !== '' ? ', '
          + data.buildingName : data.buildingName);
       }
       fullAddr += (extraAddr !== '' ? ' (' + extraAddr
         + ')' : '');
      }

      document.getElementById('MEMBER_ADDR_ZIP').value = data.zonecode; 
      document.getElementById('MEMBER_ADDR_1').value = fullAddr;
      document.getElementById('MEMBER_ADDR_ZIP').style.borderColor="green";
      document.getElementById('MEMBER_ADDR_1').style.borderColor="green";
      document.getElementById('MEMBER_ADDR_2').focus();
     }
    }).open();
 }
 
 
 // 유효성 검사(인포커스)
 function infocus(element){
 	var el_id = element.id;// Element id
 	var el_v = element.value;// Element value
 	
 	var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
 	var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 	/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
 	
 	if(el_id == 'MEMBER_PWD'){
 		 if(el_v == '' || !pwd_re.test(el_v)){
 			 $('#pwd_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 	 }else if(el_id == 'MEMBER_PWD2'){
 		 if(el_v != document.getElementById('MEMBER_PWD').value){
 			 $('#pwd2_cl').collapse('show');
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
 	 }/*else if(el_id == 'MEMBER_ADDR_ZIP'){
 		 if(el_v == ''){
 			 $('#zip_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 	 }else if(el_id == 'MEMBER_ADDR_1'){
 		 if(el_v == ''){
 			 $('#addr1_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 	 }*/else if(el_id == 'MEMBER_ADDR_2'){
 		 if(el_v == ''){
 			 $('#addr2_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 	 }
 } 
  // 유효성 검사(아웃포커스)
  function valchk(element){
 	 
 	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
 	 var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 	 var el_id = element.id;// Element id
 	 var el_v = element.value;// Element value
 	 
 	 
 	 if(el_id == 'MEMBER_PWD'){
 		 if(el_v == '' || !pwd_re.test(el_v)){
 			 $('#pwd_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 		 $('#pwd_cl').collapse('hide');
 		 element.style.borderColor="green";
 	 }else if(el_id == 'MEMBER_PWD2'){
 		 if(el_v != document.getElementById('MEMBER_PWD').value){
 			 $('#pwd2_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 		 $('#pwd2_cl').collapse('hide');
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
 		 
 	 }else if(el_id == 'MEMBER_ZIP'){
 		 if(el_v == ''){
 			 $('#zip_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 		 $('#zip_cl').collapse('hide');
 		 element.style.borderColor="green";
 	 }else if(el_id == 'MEMBER_ADDR_1'){
 		 if(el_v == ''){
 			 $('#addr1_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 		 $('#addr1_cl').collapse('hide');
 		 document.getElementById('MEMBER_ADDR_ZIP').style.borderColor="green";
 		 document.getElementById('MEMBER_ADDR_1').style.borderColor="green";
 	 }else if(el_id == 'MEMBER_ADDR_2'){
 		 if(el_v == ''){
 			 $('#addr2_cl').collapse('show');
 			 element.style.borderBottomColor='red';
 			 return;
 		 }
 		 $('#addr2_cl').collapse('hide');
 		 element.style.borderColor="green";
 	 }
  }

function member_modify(){
	var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

	if(document.getElementById('MEMBER_PWD').value==''||document.getElementById('MEMBER_PWD2').value=='' || document.getElementById('MEMBER_PWD').value != document.getElementById('MEMBER_PWD2').value || !pwd_re.test(document.getElementById('MEMBER_PWD').value)){
		alert('비밀번호를 형식에 맞게 입력하여 주세요.');
		document.getElementById('MEMBER_PWD').value='';
		document.getElementById('MEMBER_PWD2').value='';
		document.getElementById('MEMBER_PWD').focus();
		
	}else if(document.getElementById('MEMBER_TEL').value==''|| !tel_re.test(document.getElementById('MEMBER_TEL').value)){
		alert('전화번호를 형식에 맞게 입력하여 주세요.');
		document.getElementById('MEMBER_TEL').value='';
		document.getElementById('MEMBER_TEL').focus();
	}else if($(':input[name=MEMBER_GENDER]:radio:checked').val()!='남자'&&$(':input[name=MEMBER_GENDER]:radio:checked').val()!='여자'){
		alert('성별을 선택하여 주세요.');
	}else if(document.getElementById('MEMBER_ADDR_ZIP').value==''||document.getElementById('MEMBER_ADDR_1').value==''||document.getElementById('MEMBER_ADDR_2').value==''){
		alert('주소를 입력하여 주세요.');
		document.getElementById('MEMBER_ADDR_ZIP').value='';
		document.getElementById('MEMBER_ADDR_1').value='';
		document.getElementById('MEMBER_ADDR_2').value='';
		document.getElementById('MEMBER_ADDR_ZIP').focus();
	}else if(document.mypage_form.MEMBER_YEAR.value==''|| document.mypage_form.MEMBER_MONTH.value==''|| document.mypage_form.MEMBER_DAY.value==''){
		alert('생년월일을 선택하여 주세요.');
	}else{
		document.getElementById('mypage_form').submit();
	}
}


//회원탈퇴
function member_leave(){
	
	var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	if(document.getElementById('LEAVE_PWD').value==''||!pwd_re.test(document.getElementById('LEAVE_PWD').value)){
		alert("비밀번호가 형식에 맞지 않습니다.");
		$('#leave_pwd_cl').collapse('show');
		document.getElementById('LEAVE_PWD').value='';
		document.getElementById('LEAVE_PWD').style.borderBottomColor='red';
		document.getElementById('MEMBER_PWD').focus();
		return;
	}else if(pwd_re.test(document.getElementById('LEAVE_PWD').value)){
		document.getElementById('LEAVE_PWD').style.borderBottomColor='green';
		$('#leave_pwd_cl').collapse('hide');
	}
	
	document.leaveform.submit();
	
	
}
//회원탈퇴 비밀번호 포커스 아웃
function member_leave_f(){
	
	var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	if(document.getElementById('LEAVE_PWD').value==''||!pwd_re.test(document.getElementById('LEAVE_PWD').value)){
		$('#leave_pwd_cl').collapse('show');
		document.getElementById('LEAVE_PWD').style.borderBottomColor='red';
	}else if(pwd_re.test(document.getElementById('LEAVE_PWD').value)){
		document.getElementById('LEAVE_PWD').style.borderBottomColor='green';
		$('#leave_pwd_cl').collapse('hide');
		return;
	}
	return;
	
}

