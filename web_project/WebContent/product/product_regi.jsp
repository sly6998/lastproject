<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>  
<title></title>
 <meta charset="utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

   
</head> 
<body >

	<%@ include file="../page/header.jsp"%>
<h3 >제품등록(관리자)</h3>
        
     <form id="contact-form" method="post" action="./product_write.html" enctype="multipart/form-data">                    
  
     	<label>
     		<input name="ITEM_NAME" type="text" placeholder="제품명"/>
     	</label><br/>
     
     	<label>
     		<input name="ITEM_PRICE" type="text"  placeholder="가격"/>
     	</label><br/>
     	
     	<label>
     		<input type="text" name="ITEM_TYPE" placeholder="제품옵션"/>
     	</label><br/>
     	
     	<label>
     		<span class="text-form">상품 이미지</span>
     		<input name="ITEM_IMAGE" type="file" value="상품이미지"/>
     	</label><br/>
     
     
     	<div class="wrapper">
     		<textarea name="ITEM_CONTENT" id="contents"style="width:500px; height:100px ">
     		</textarea>
     	</div>
     	
		<label>
     	<input type="submit" value="등록">
     	<input type="reset" value="다시쓰기">
     	</label>
   						
     </form>
     
     <script>
    $(function(){
         
        CKEDITOR.replace( 'contents', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            'filebrowserUploadUrl':'<%=request.getContextPath()%>/ckeditor/upload.jsp?'
                              + 'realUrl=upload/img_upload/'
                              + '&realDir=upload/img_upload',
                        skin : 'kama'
                     });

         CKEDITOR.on('dialogDefinition', function(ev) {
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;

            switch (dialogName) {
            case 'image': //Image Properties dialog
               //dialogDefinition.removeContents('info');
               dialogDefinition.removeContents('Link');
               dialogDefinition.removeContents('advanced');
               break;
            }
         });
      });
</script>
</body>
</html>
