/**
  qna 
 */


function qna_write_check(){
   
   var subject = document.qna_write_form.QNA_SUBJECT.value;
   var content = document.qna_write_form.QNA_CONTENT.value;
   
   if(subject == null || subject == ''){
      alert('제목을 입력하여 주세요.');
      return;
      
   }else if(content == null || content ==''){
      alert('내용을 입력하여 주세요.');
      return;
   }
   document.qna_write_form.submit();
}




function qna_modify_check(){
	
	document.qna_modify_form.submit();

}