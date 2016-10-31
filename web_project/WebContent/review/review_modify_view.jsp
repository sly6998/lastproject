<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.interior.review.*" %>    
<%
	ReviewBean review = (ReviewBean)request.getAttribute("reviewdata");
%>    
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>  
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/review.js"></script>
    <title></title>
    <meta charset="utf-8">
    
</head> 
<body id="page5">
	
<h3 >공지사항(MODIFY)</h3>
         
        
        
    <form name="review_modify_form" method="post" action="./ReviewModifyAction.html?REVIEW_NUM=<%=review.getREVIEW_NUM()%>">                    
    <table>
     	<tr>
     		<td>제 목  :</td>
     		<td>
     		<input name="REVIEW_SUBJECT" type="text" value="<%=review.getREVIEW_SUBJECT()%>"/>
     		</td>
     	</tr>
     	  
     	<TR	>
     		<td>내 용 :</td>
     		<td>
     		<textarea id="contents" name="REVIEW_CONTENT">
     		<%=review.getREVIEW_CONTENT() %>
     		</textarea>
     		</td>
     	</TR>
     	
     	
     	
		<tr>
			<td><input type="button" value="수정" onclick="review_modify_check()">
			<input type="reset" value="다시쓰기"></td>
			<td><a href="./review_list.html">목록보기</a></td>
		</tr>     					
    </table>
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
