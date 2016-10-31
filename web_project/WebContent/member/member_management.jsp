<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.member.*"%>

<%
	String MEMBER_ID = "";
	String MEMBER_NAME = "";
	if (session.getAttribute("MEMBER_ID") != null) {
		MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
	}

	if (session.getAttribute("MEMBER_NAME") != null) {
		MEMBER_NAME = (String) session.getAttribute("MEMBER_NAME");
	}
	List boardlist = (List) request.getAttribute("boardlist");
	int listcount = ((Integer) request.getAttribute("listcount")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer) request.getAttribute("startpage")).intValue();
	int endpage = ((Integer) request.getAttribute("endpage")).intValue();

	//검색 기능용
	String srchKey = (String) request.getAttribute("srchKey");
	if (srchKey == null) {
		srchKey = "";
	}

	String srchFlds = (String) request.getAttribute("srchFlds");
	if (srchFlds == null) {
		srchFlds = "";
	}
%>
<%@ include file="../page/header.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/management.js"></script>
<link href='http://fonts.googleapis.com/css?family=Varela+Round'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member_form.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>



<h3>관리자 페이지</h3>
<table width="870">
	<tr>
		<td colspan="6" align="right"><br />
			<form name="srchForm" action="./member_management.html" method="post">
				<select name="srchFlds">
					<option value="all"
						<%=srchFlds.equals("all") ? "selected='selected'" : ""%>>모두</option>
					<option value="num"
						<%=srchFlds.equals("num") ? "selected='selected'" : ""%>>회원번호</option>
					<option value="id"
						<%=srchFlds.equals("id") ? "selected='selected'" : ""%>>아이디</option>
					<option value="name"
						<%=srchFlds.equals("name") ? "selected='selected'" : ""%>>이름</option>
				</select> <input type="text" name="srchKey" size="20" maxlength="50"
					value="<%=srchKey%>" /> <input type="button" value="검색"
					onClick="submitSrchForm()" />
			</form> <br /></td>
		<td />
	</tr>

	<tr align="center"
		style="border: 1px solid #ddd; background-color: #EFEFEF">
		<td
			style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 80px;"
			height="26">
			<div align="center">회원번호</div>
		</td>

		<td
			style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
			width="400" height="26">
			<div align="center">아이디</div>
		</td>

		<td
			style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
			width="190" height="26">
			<div align="center">이름</div>
		</td>

		<td
			style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
			width="100" height="26">
			<div align="center">가입일</div>
		</td>
		<td
			style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
			width="100" height="26">
			<div align="center">수정</div>
		</td>
		<td
			style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
			width="100" height="26">
			<div align="center">탈퇴</div>
		</td>
	</tr>
	<%
		for (int i = 0; i < boardlist.size(); i++) {
			MemberBean bl = (MemberBean) boardlist.get(i);
	%>
	<!-- 내용 -->
	<tr align="center" valign="middle" style="border: 1px solid #ddd;"
		onmouseover="this.style.backgroundColor='#F8F8F8'">
		<td height="23"
			style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<%=bl.getMEMBER_NUM()%>
		</td>

		<td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<%=bl.getMEMBER_ID()%>
		</td>

		<td
			style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<div align="center"><%=bl.getMEMBER_NAME()%>
			</div>
		</td>

		<td
			style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<div align="center">
				<%=bl.getMEMBER_DATE()%></div>
		</td>

		<td
			style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<div align="center">
				<a href="./MemberManagementModifyView.html?id=<%=bl.getMEMBER_ID()%>" data-toggle="modal" data-target="#m_modifyModal">수정</a>
			</div>
		</td>
		<td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<div align="center">
				<a href="./management_member_leave.html?id=<%=bl.getMEMBER_ID()%>">탈퇴</a>
			</div>
		</td>

	</tr>
	<%
		}
	%>

	<!-- [이전] / [1] [2] [3] / [다음] -->
	<tr align="center" height="20">
		<td colspan="3"
			style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
			<%
				if (nowpage <= 1) {
			%> [이전]&nbsp; <%
 	} else {
 %> <a href="./noti_list.html?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./member_management.html?page=<%=a%>">[<%=a%>]
		</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./member_management.html?page=<%=nowpage + 1%>">[다음]</a> <%
 	}
 %>
		</td>
	</tr>
</table>





<!-- 회원정보 수정 모달 -->
<div class="container">
	<div class="modal fade" id="m_modifyModal" tabindex="-1" role="dialog" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>
</div>


