<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<form class="form-horizontal" role="form" id="editorForm" method="post"
	action="/">
	<div class="form-group">
		<div class="form-group">
			<div class="col-lg-12">
				<textarea name="contents" id="contents"></textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-12" align="right">
				<button type="submit" class="btn btn-default">저장</button>
			</div>
		</div>
	</div>
</form>

<script>
    $(function(){
         
        CKEDITOR.replace( 'contents', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            'filebrowserUploadUrl':'<%=request.getContextPath()%>/ckeditor/upload.jsp?'
            						+ 'realUrl=upload/img_upload/' + '&realDir=upload/img_upload',
       	   	skin: 'kama'
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