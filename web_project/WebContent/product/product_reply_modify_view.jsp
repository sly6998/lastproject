<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.interior.item.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
  String id = "";
  String MEMBER_NAME = "";
  if (session.getAttribute("MEMBER_ID") != null) {
    id = (String) session.getAttribute("MEMBER_ID");
  }
  if (session.getAttribute("MEMBER_NAME") != null) {
    MEMBER_NAME = (String) session.getAttribute("MEMBER_NAME");
  }
  List replylist = (List) request.getAttribute("replylist");
  ItemBean item = (ItemBean) request.getAttribute("ssibal");
  ItemBean item_reply = (ItemBean) request.getAttribute("item_reply");
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
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jcarousel.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/flexslider.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="<%=request.getContextPath()%>/skins/default.css" rel="stylesheet" />
<!-- Script -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/noti.js"></script>
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
<script>
$(function(){ 
	$('#ITEM_REPLY_CONTENT').focus();
});
</script>
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
              <li class="active"><a href="./noti_list.html">Noti</a></li>
              <li><a href="./catalogue.html">Portfolio</a></li>
              <li><a href="./product_list.html">Product</a></li>
              <li><a href="./review_list.html">Review</a></li>
              <li><a href="./qna_list.html">QnA</a></li>
              <li><a href="./advice_request.html">Contact</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Member<b class=" icon-angle-down"></b></a>
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
              <li class="active">Item</li>
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
            <h3>제품 상세보기</h3>
            <br> <br><br>
            <form name="product_detail" method="post" action="./../addBasket.html">
              <div class="row">
                <div class="col-md-7">
                  <div align="center">
                    <img name="item_img" id="item_img" src="<%=request.getContextPath()%>/upload/main_upload/<%=item.getITEM_IMAGE()%>" width=500 height="400">
                  </div>
                  </div>
                  <div class="col-md-5" style="margin-top: 30px;">
                    <div>
                        <span style="display: inline; margin-right: 30px;"><font size="4"><b>상품명</b></font></span><span id="itemname" style="display: inline;"><%=item.getITEM_NAME()%></span><br><br>
                        <span style="display: inline; margin-right: 45px;"><font size="4"><b>가격</b></font></span><span style="display: inline;" id="item_price" name="item_price"><%=String.format("%,d", item.getITEM_PRICE())%></span> 원<br><br>
                        <span style="display: inline; margin-right: 40px;"><font size="4"><b>옵션</b></font></span>
                        <select name="item_type" id="item_type" class="form-control-u" style="width: 100px;">
                            <option selected="selected" >선택</option>
                            <option value="<%=item.getITEM_TYPE_1()%>"><%=item.getITEM_TYPE_1()%></option>
                            <option value="<%=item.getITEM_TYPE_2()%>"><%=item.getITEM_TYPE_2()%></option>
                            <option value="<%=item.getITEM_TYPE_3()%>"><%=item.getITEM_TYPE_3()%></option>
                            <option value="<%=item.getITEM_TYPE_4()%>"><%=item.getITEM_TYPE_4()%></option>
                            <option value="<%=item.getITEM_TYPE_5()%>"><%=item.getITEM_TYPE_5()%></option>
                        </select><br><br>
                        <span style="display: inline; margin-right: 50px;"><font size="4"><b>수량</b></font></span><span name="num" id="item_num" class="num" size="2" style="display: inline; text-align: center; margin-right: 20px;">1</span>
                        <img src="<%=request.getContextPath()%>/images/up_btn.png" alt="" width="10" valign="bottom" class="bt_up" />&nbsp;<img src="<%=request.getContextPath()%>/images/down_btn.png" alt="" width="10" valign="top" class="bt_down" /><br><br>
                        <span style="margin-right: 30px; display: inline;"><font size="4"><b>총 금액</b></font></span><span style="display: inline;"name="price_sum" id="price_sum"><%=String.format("%,d", item.getITEM_PRICE())%></span> 원<br>
                        <div style="margin-top: 40px;">
                        <button type="button" class="btn-lg" style="background-color: #eeeeee;" onclick="nowbuy()">바로구매</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn-lg" style="background-color: #eeeeee;" onclick="addbasket()">장바구니</button>
                        </div>
                  </div>
                </div>
              </div>
            </form>
            <hr style="border: solid 2px #eeeeee; margin-top: 50px;"width="100%"><br><br>
            <!-- 제품상세설명 -->
            <div>
              <sapn name="item_content"><%=item.getITEM_CONTENT()%></sapn>
            </div>
            
            
            <!-- 댓글 보기-->
            <p>
              <br> <br> <br> <br>
            <form>
              <%
                for (int i = 0; i < replylist.size(); i++) {
                  ItemBean rl = (ItemBean) replylist.get(i);
              %>
              <table width="100%">
                <tr style="border-bottom: 1px;">
                  <td width="10%"><b><%=rl.getITEM_REPLY_MEMBER_ID()%></b></td>
                  <td><%=rl.getITEM_REPLY_DATE()%></td>
                  <td align="right">
                    <%
                      if (id.equals(rl.getITEM_REPLY_MEMBER_ID()) || id.equals("admin")) {
                    %> <a style="text-decoration: none;"
                    href='./ItemReplyModifyViewAction.html?ITEM_NUM=<%=item.getITEM_SEQ()%>&ITEM_REPLY_SEQ=<%=rl.getITEM_REPLY_SEQ()%>'>수정&nbsp;&nbsp;&nbsp;</a> <a style="text-decoration: none;"
                    href='./ItemReplyDeleteAction.html?ITEM_NUM=<%=item.getITEM_SEQ()%>&ITEM_REPLY_SEQ=<%=rl.getITEM_REPLY_SEQ()%>'>삭제&nbsp;&nbsp;&nbsp;</a> <%
   }
     if (id != "" || id != null || !id.equals("")) {
 %>
                    <a style="text-decoration: none;" href="#">답글&nbsp;&nbsp;&nbsp;</a>
                  </td>
                  <%
                    }
                  %>
                </tr>

                <tr>
                  <td colspan="3"><br><%=rl.getITEM_REPLY_CONTENT()%></td>
                </tr>
              </table>
              <hr style="border: solid 1px #eeeeee;"width="100%">
              <%
                }
              %>
            </form>
            <!-- 댓글보기 end -->

            
            <!-- 댓글 작성 -->
            <table width="100%">
              <%
                if (id == "" || id == null || id.equals("")) {
              %>
              <tr>
                <td><br> <br></td>
              </tr>
              <tr>
                <td><a href="./login.html" data-toggle="modal" data-target="#loginModal">댓글을 작성하시려면 <font color="red">로그인</font> 하시기 바랍니다.
                </a></td>
              </tr>
              <%
                } else {
              %>
              <form name="item_reply_modify_form" method="post" action="./ItemReplyModify.html">
                <tr>
                  <td><br> <br></td>
                </tr>
                <tr>
                  <td width="10%"><input type="hidden" name="ITEM_REPLY_MEMBER_ID" value="<%=id%>" /> 
                  <input type="hidden" name="num" value="<%=item_reply.getITEM_SEQ()%>" /> 
                  <b><%=id%></b></td>
                  <td width="80%"><textarea name="ITEM_REPLY_CONTENT" id="ITEM_REPLY_CONTENT" type="text" style="width: 100%; height: 150px; resize: none;"><%=item_reply.getITEM_REPLY_CONTENT() %></textarea></td>
                  <input type="hidden" name="ITEM_REPLY_SEQ" value="<%=item_reply.getITEM_REPLY_SEQ()%>">
                  <td width="10%" align="center"><input type="submit" class="btn" value="수정"></td>
                </tr>
              </form>
              <%
                }
              %>
            </table>
            <!-- 댓글작성 end -->


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