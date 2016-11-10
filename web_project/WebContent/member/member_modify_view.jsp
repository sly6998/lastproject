<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.member.*"%>
<%
  String id = (String) session.getAttribute("MEMBER_ID");
	MemberBean member = (MemberBean)request.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_form.css">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jcarousel.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/flexslider.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="<%=request.getContextPath()%>/skins/default.css" rel="stylesheet" />

<!-- Script -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.fancybox.pack.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.fancybox-media.js"></script>
<script src="<%=request.getContextPath()%>/js/google-code-prettify/prettify.js"></script>
<script src="<%=request.getContextPath()%>/js/portfolio/jquery.quicksand.js"></script>
<script src="<%=request.getContextPath()%>/js/portfolio/setting.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.flexslider.js"></script>
<script src="<%=request.getContextPath()%>/js/animate.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script src="<%=request.getContextPath()%>/js/member_modify.js"></script>

<title></title>
</head>
<body>
  <div id="wrapper">
    <!-- start header -->
    <header>
      <div class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./mainpage.html"><span>M</span>oderna</a>
          </div>
          <div class="navbar-collapse collapse ">
            <ul class="nav navbar-nav">
              <li><a href="./mainpage.html">Home</a></li>
              <li><a href="./noti_list.html">Noti</a></li>
              <li><a href="./catalogue.html">Portfolio</a></li>
              <li><a href="./product_list.html">Product</a></li>
              <li><a href="./review_list.html">Review</a></li>
              <li><a href="./qna_list.html">QnA</a></li>
              <li><a href="./advice_request.html">Contact</a></li>
              <li class="dropdown active"><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Member<b
                  class=" icon-angle-down"></b></a>
                <ul class="dropdown-menu">
                  <%
                    if (id == null || id == "") {
                  %>
                  <li><a href="./login.html" data-toggle="modal" data-target="#loginModal">로그인</a></li>
                  <li><a href="./join.html" data-toggle="modal" data-target="#joinModal">회원가입</a></li>
                  <li><a href="./idfind.html" data-toggle="modal" data-target="#idModal">ID 찾기</a></li>
                  <li><a href="./pwdfind.html" data-toggle="modal" data-target="#pwdModal">PWD 찾기</a></li>
                  <%
                    } else if (id.equals("admin")) {
                  %>
                  <li><a href="./member_management.html">회원관리</a></li>
                  <li><a href="./OrderManagementList.html">주문조회</a></li>
                  <li><a href="./advice_list.html">상담조회</a></li>
                  <li><a href="./member_modify.html">마이페이지</a></li>
                  <li><a href="./logout.html">로그아웃</a></li>
                  <%
                    } else {
                  %>
                  <li><a href="./basketlist.html">장바구니</a></li>
                  <li><a href="./OrderList.html">주문조회</a></li>
                  <li><a href="./member_modify.html">마이페이지</a></li>
                  <li><a href="./logout.html">로그아웃</a></li>
                  <%
                    }
                  %>
                </ul></li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <!-- end header -->
    <!-- 위치 -->
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
              <li class="active">Member > MyPage</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <!-- 위치 end -->


    <section id="content">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <!-- 본문 시작 -->


<div class="text-center"><br><br>
	<div class="member_logo" style="margin-bottom: 100px;">My Page</div>
	<div class="login-form-2">
		<form id="mypage_form" name="mypage_form" class="text-left" method="post" action="./MemberModifyAction.html">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ID" name="MEMBER_ID" value="<%=member.getMEMBER_ID()%>" disabled >
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="User Name" value="<%=member.getMEMBER_NAME()%>" disabled>
					</div>
					<div class="form-group-1">
						<input type="password" class="form-control-1" size="50" id="MEMBER_PWD" name="MEMBER_PWD" placeholder="Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd_cl"><font color="red">특수문자/문자/숫자 포함하여
							8~15자리 이내의 비밀번호</font></span>
					</div>
					<div class="form-group-1">
						<input type="password" class="form-control-1" size="50" id="MEMBER_PWD2" name="MEMBER_PWD2" placeholder="Confirm Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd2_cl"><font color="red">비밀번호가 일치하지 않습니다.</font></span>
					</div>
					
					<div class="form-group-1">
						<input type="text" class="form-control-1" id="MEMBER_TEL" size="50" name="MEMBER_TEL" placeholder="Phone Number" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_TEL()%>">
						<span class="collapse" id="tel_cl"><font color="red">전화번호 형식이 올바르지 않습니다.</font></span>
					</div>
					
					
					<div class="form-group-1 login-group-checkbox">
						<input type="radio" class="" name="MEMBER_GENDER" id="male" value="남자"
						<%if(member.getMEMBER_GENDER().equals("남자")){%>checked<%}%>>
						<label for="male">male</label>
						
						<input type="radio" class="" name="MEMBER_GENDER" id="female" value="여자"
						<%if(member.getMEMBER_GENDER().equals("여자")){%>checked<%}%>>
						<label for="female">female</label>
					</div>
					
					
					<div class="form-group-1">
						<input type="text" class="form-control-1" id="MEMBER_ADDR_ZIP" name="MEMBER_ADDR_ZIP" placeholder="Zip Code" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_ZIP()%>">
						&nbsp;&nbsp;<input type="button" value="Search" onclick="execDaumPost()" class="btn-default-1 btn"></td>
						<span class="collapse" id="zip_cl"><font color="red">우편번호를 입력하여 주세요.</font></span>
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ADDR_1" name="MEMBER_ADDR_1" placeholder="Address" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_1()%>">
						<span class="collapse" id="addr1_cl"><font color="red">주소를 입력하여 주세요.</font></span>
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ADDR_2" name="MEMBER_ADDR_2" placeholder="Detail Address" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_2()%>">
						<span class="collapse" id="addr2_cl"><font color="red">상세주소를 입력하여 주세요.</font></span>
					</div>
              		<label style="margin-top:6px">Birth Day</label>
              		<div class="form-group-1">
                		<select size="1" name="MEMBER_YEAR" class="form-control-u" style="width:80px; text-align: conter;">
							<option value="">Year</option>
							<%for (int i = 2010; i >= 1930; i--) {%>
							<option value="<%=i%>" <%if(member.getMEMBER_YEAR()==i){%>selected<%}%>><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_MONTH" class="form-control-u" style="width:80px; text-align: conter;">
							<option value="">Month</option>
							<%for (int i = 1; i <= 12; i++) {%>
							<option value="<%=i%>" <%if(member.getMEMBER_MONTH()==i){%>selected<%}%>><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_DAY" class="form-control-u" style="width:80px; text-align: conter;">
						<option value="">Date</option>
						<%for (int i = 1; i <= 31; i++) {%>
						<option value="<%=i%>" <%if(member.getMEMBER_DAY()==i){%>selected<%}%>><%=i%></option>
						<%}%>
						</select>
            		</div><br>
            		<div align="center" class="form-group-1">
						<button type="button" data-toggle="modal" data-target="#leaveModal" class="btn-default-1 btn">Member Leave</button>&nbsp;&nbsp;
						<button type="button" onclick="member_modify()" class="btn-default-1 btn">Save</button>&nbsp;&nbsp;
						<button type="button" onclick="javascript:location.href='./mainpage.html'" class="btn-default-1 btn">Cancel</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div>
</div>



	<!-- 회원탈퇴 모달 팝업 -->
	<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	  	  <div class="modal-header">
      		  <h4 class="modal-title" id="myModalLabel">Member Leave</h4>
      	  </div>
	      <div class="modal-body">
	      <div align="left">
			<span>
				<p style="margin-bottom: 30px; margin-top: 30px;"><font color="red" size="5"><b>회원탈퇴 신청 전 안내 사항을 확인 해 주세요.</b></font><p/>
				 회원탈퇴를 신청하시면 신청하신 아이디는 사용하실 수 없습니다.<br>
				 <div style="padding-left:15px;">
				 - 회원 정보<br>
				 - 상품 구입 및 대금 결제에 관한 기록<br>
				 - 상품 배송에 관한 기록<br>
 				 - 소비자 불만 또는 처리 과정에 관한 기록<br>
				 - 게시판 작성 및 사용후기에 관한 기록<br>
				 </div>
			</span><p/>
			<form name="leaveform" method="post" action="./member_leave.html">
				<div class="login-form-2">
					<div class="main-login-form">
						<div class="login-group">
							<div class="form-group-1">
								<div style="padding-left:15px;">
									<input type="hidden" name="LEAVE_ID" value="<%=member.getMEMBER_ID()%>"/>
									<input type="password" size="30" class="form-control-1" name="LEAVE_PWD" id="LEAVE_PWD" placeholder="Password" onblur="member_leave_f()">
									<span class="collapse" id="leave_pwd_cl"><font color="red">특수문자/문자/숫자 포함하여 8~15자리 이내의 비밀번호</font></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<p/>
				<div align="center">
				<button type="button" onclick="member_leave()" class="btn-default-1 btn">Leave</button>
				<button type="button" onclick="javascript:location.href='./member_modify.html'" class="btn-default-1 btn">Cancel</button>
				</div>
			</form>
	      </div>
		  </div>
	    </div>
	  </div>
	</div>


<!-- 본문 end -->
          </div>
        </div>
      </div>
    </section>

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Get in touch with us</h5>
              <address>
                <strong>Moderna company Inc</strong><br> Modernbuilding suite V124, AB 01<br> Someplace 16425 Earth
              </address>
              <p>
                <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br> <i class="icon-envelope-alt"></i> email@domainname.com
              </p>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Pages</h5>
              <ul class="link-list">
                <li><a href="#">Press release</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Privacy policy</a></li>
                <li><a href="#">Career center</a></li>
                <li><a href="#">Contact us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Latest posts</h5>
              <ul class="link-list">
                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
                <li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
                <li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Flickr photostream</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="https://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="copyright">
                <p>&copy; Moderna Theme. All right reserved.</p>
                <div class="credits">
                  <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                            -->
                  <a href="https://bootstrapmade.com/">Free Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="social-network">
                <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- 회원가입 모달 -->
    <div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- 로그인 모달 -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- id찾기 모달 -->
    <div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- pw찾기 모달 -->
    <div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
</body>
</html>
