<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%
  String MEMBER_ID = null;
  if (session.getAttribute("MEMBER_ID") != null) {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");

  
  }
    %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/qna.js"></script>
<meta charset="utf-8">
</head>
<body>
   <div width="100%" align="center">
      <h3>QnA 글쓰기</h3>
      <form name="qna_write_form" method="post" action="./QnaWriteAction.html">
         <input type="hidden" name="QNA_MEMBER_ID" value="<%=MEMBER_ID %>"/>
         <table>
            <tr>
               <td><input name="QNA_SUBJECT" type="text"
                  placeholder="제목을 입력하세요." size="100%" />
               <p></td>
            </tr>

            <TR>
               <td><textarea name="QNA_CONTENT" id="contents">
              </textarea></td>
            </TR>
            <tr>
               <td><input type="button" value="글등록" onclick="qna_write_check()"> <input
                  type="reset" value="취소"> <a href="./qna_list.html">목록보기</a></td>
            </tr>
         </table>
      </form>
   </div>
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