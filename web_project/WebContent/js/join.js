/**
 * 회원가입 JS
 */

//우편번호 검색
function execDaumPost(){
 new daum.Postcode({
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
	
	var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    /*
		 * 한글이름 2~4글자, 영문이름은 Fistname Lastname 을 사용하므로 2~10글자 입력 후 한칸 띄고 2~10글자를
		 * 입력 받는다 (영문 2~10글자 (공백) 영문 2~10글자 형식)
		 */
	 
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var id_re =  /^[A-za-z0-9]{5,15}/g;
	 var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
	 if(el_id == 'MEMBER_NAME'){
		 if(el_v == '' || !name_re.test(el_v)){
			 $('#name_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
	 }else if(el_id == 'MEMBER_ID'){
		 if(el_v == '' || !id_re.test(el_v)){
			 $('#id_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
	 }else if(el_id == 'MEMBER_PWD'){
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
	 
	 var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
     /*
		 * 한글이름 2~4글자, 영문이름은 Fistname Lastname 을 사용하므로 2~10글자 입력 후 한칸 띄고 2~10글자를
		 * 입력 받는다 (영문 2~10글자 (공백) 영문 2~10글자 형식)
		 */
	 
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var id_re =  /^[A-za-z0-9]{5,15}/g;
	 var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	/* 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식 */
	 
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
	 }else if(el_id == 'MEMBER_ID'){
		 if(el_v == '' || !id_re.test(el_v)){
			 $('#id_cl').collapse('show');
			 element.style.borderBottomColor='red';
			 return;
		 }
		 $('#id_cl').collapse('hide');
		 element.style.borderColor="green";
	 }else if(el_id == 'MEMBER_PWD'){
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
 
 // 회원가입 버튼
 function join(){
	 var name_re = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	 var tel_re = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	 var id_re =  /^[A-za-z0-9]{5,15}/g;
	 var pwd_re = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 
	 if(document.getElementById('MEMBER_ID').value=='' || !id_re.test(document.getElementById('MEMBER_ID').value)){
			alert('아이디를 형식에 맞게 입력하여 주세요.');
			document.getElementById('MEMBER_ID').value='';
			document.getElementById('MEMBER_ID').focus();
	}else if(document.getElementById('id_isChk').value == 1){
		alert('아이디를 중복 체크하여 주세요.');
	}else if(document.getElementById('MEMBER_NAME').value=='' || !name_re.test(document.getElementById('MEMBER_NAME').value)){
		alert('이름을 형식에 맞게 입력하여 주세요.');
		document.getElementById('MEMBER_NAME').value='';
		document.getElementById('MEMBER_NAME').focus();
	}else if(document.getElementById('MEMBER_PWD').value==''||document.getElementById('MEMBER_PWD2').value=='' || document.getElementById('MEMBER_PWD').value != document.getElementById('MEMBER_PWD2').value || !pwd_re.test(document.getElementById('MEMBER_PWD').value)){
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
	}else if(document.joinform.MEMBER_YEAR.value==''|| document.joinform.MEMBER_MONTH.value==''|| document.joinform.MEMBER_DAY.value==''){
		alert('생년월일을 선택하여 주세요.');
	}else{
		document.getElementById('joinform').submit();
	}
 }
 
 // 아이디 중복체크
 function isChk_id(){
	 var MEMBER_ID = document.getElementById('MEMBER_ID').value;                
     if(MEMBER_ID == ""){
      alert("중복체크 할 아이디를 입력하여 주세요.");   
      document.getElementById('MEMBER_ID').focus();
     }else{
    	 window.open("./overlapId.html?MEMBER_ID="+MEMBER_ID,"",'left='+(screen.availWidth-300)/2+',top='+(screen.availHeight-20)/4+', width=300px,height=20px');
     }
 }
 
 // 중복체크창 닫기
 function overlapClose(value){
	 var result = value;
	 if(result==1){
		 
	 }else{
		 opener.joinform.id_isChk.value = result;
	 }
	 window.close();
 }
