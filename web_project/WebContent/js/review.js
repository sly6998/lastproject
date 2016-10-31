/**
  review
 */


function review_write_check(){
   
   var subject = document.review_write_form.REVIEW_SUBJECT.value;
   var content = document.review_write_form.REVIEW_CONTENT.value;
   
   if(subject == null || subject == ''){
      alert('제목을 입력하여 주세요.');
      return;
      
   }else if(content == null || content ==''){
      alert('내용을 입력하여 주세요.');
      return;
   }
   document.review_write_form.submit();
}




function review_modify_check(){
	
	document.review_modify_form.submit();

}