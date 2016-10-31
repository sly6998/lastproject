/**
  공지사항 js 
 */


function noti_write_chek(){
   
   var subject = document.noti_write_form.NOTI_SUBJECT.value;
   var content = document.noti_write_form.NOTI_CONTENT.value;
   
   if(subject == null || subject == ''){
      alert('제목을 입력하여 주세요.');
      return;
      
   }else if(content == null || content ==''){
      alert('내용을 입력하여 주세요.');
      return;
   }
   document.noti_write_form.submit();
}




function noti_modify_check(){
	
	document.noti_modify_form.submit();

}



function submitSrchForm() {
	document.srchForm.srchKey.value = document.srchForm.srchKey.value
			.trim();
	document.srchForm.submit();
}
function resetSrchForm() {
	document.srchForm.srchFlds[0].selected = true;
	document.srchForm.srchKey.value = "";
}