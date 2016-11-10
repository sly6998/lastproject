/**
  qna 
 */


function qna_write_check(){
   
   var subject = document.qna_write_form.QNA_SUBJECT.value;
   var content = document.qna_write_form.QNA_CONTENT.value;
   
   if(subject == null || subject == ''){
      alert('제목을 입력하여 주세요.zzz');
      return;
      
   }
   document.qna_write_form.submit();
}

function btnClick() {
	alert("Button Click");
}



function qna_modify_check(){
	
	
	
	document.qna_modify_form.submit();

}

function qnareplywrite(){
	
	var content = document.qna_reply_write_form.QNA_REPLY_CONTENT.value;
	
	if(content == null || content == ''){
		alert('댓글 내용을 입력해주세요.')
		return;
	}
	else{
		alert("댓글이 등록되었습니다.zzzzz");
		
	}
	
	document.qna_reply_write_form.submit();
}

function submitSrchForm() {
	document.srchForm.srchKey.value = document.srchForm.srchKey.value.trim();
	document.srchForm.submit();
}
