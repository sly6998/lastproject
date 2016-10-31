package com.interior.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.advice.AdviceDeleteAction;
import com.interior.advice.AdviceDetailAction;
import com.interior.advice.AdviceListAction;
import com.interior.advice.AdviceWriteAction;
import com.interior.basket.AddBasketAction;
import com.interior.basket.BasketDetailAction;
import com.interior.basket.BasketListAction;
import com.interior.basket.BasketModifyAction;
import com.interior.member.ManagementModifyAction;
import com.interior.member.MemberFindIDAction;
import com.interior.member.MemberFindPWDAction;
import com.interior.member.MemberJoinAction;
import com.interior.member.MemberLeaveAction;
import com.interior.member.MemberLoginAction;
import com.interior.member.MemberManagementAction;
import com.interior.member.MemberManagementLeaveAction;
import com.interior.member.MemberManagementModifyAction;
import com.interior.member.MemberManagementModifyViewAction;
import com.interior.member.MemberModifyAction;
import com.interior.member.MemberModifyViewAction;
import com.interior.member.MemberViewAction;
import com.interior.member.OverlapIdAction;
import com.interior.noti.NotiDeleteAction;
import com.interior.noti.NotiDetailAction;
import com.interior.noti.NotiListAction;
import com.interior.noti.NotiModifyAction;
import com.interior.noti.NotiModifyViewAction;
import com.interior.noti.NotiReplyDeleteAction;
import com.interior.noti.NotiReplyModifyAction;
import com.interior.noti.NotiReplyModifyViewAction;
import com.interior.noti.NotiReplyWriteAction;
import com.interior.noti.NotiWriteAction;
import com.interior.qna.QnaDeleteAction;
import com.interior.qna.QnaDetailAction;
import com.interior.qna.QnaListAction;
import com.interior.qna.QnaModifyAction;
import com.interior.qna.QnaModifyView;
import com.interior.qna.QnaReplyWriteAction;
import com.interior.qna.QnaWriteAction;
import com.interior.review.ReviewDeleteAction;
import com.interior.review.ReviewDetailAction;
import com.interior.review.ReviewListAction;
import com.interior.review.ReviewModifyAction;
import com.interior.review.ReviewModifyView;
import com.interior.review.ReviewWriteAction;


@WebServlet("/ForntController")
public class FrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		System.out.println(command);

		
		
		/* Main */

		if (command.equals("/mainpage.html")) {// 메인페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/mainpage.jsp");

		} else if (command.equals("/login.html")) {// 로그인페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/login.jsp");
		} else if (command.equals("/logout.html")) {// 로그아웃페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/logout.jsp");
			
		/* MEMBER */

		}else if (command.equals("/join.html")) {// 회원가입 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_join.jsp");

		}else if (command.equals("/member_leave.html")) {// 회원탈퇴 action
			action = new MemberLeaveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/overlapId.html")) {// 아이디 중복체크 페이지 이동 & action
			action = new OverlapIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/login.html")) {// 로그인 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./page/login.jsp");

		}else if (command.equals("/idfind.html")) {// 아이디 찾기 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_find_id.jsp");

		} else if (command.equals("/pwdfind.html")) {// 비밀번호 찾기 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./member/member_find_pw.jsp");

		} else if (command.equals("/member_modify.html")) {// 마이페이지 이동 & action
			action = new MemberModifyViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/member_view.html")) {// 회원정보 보기 페이지 이동 & action
			action = new MemberViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/member_management.html")) {// 회원관리 페이지 이동 & action(관리자)
			action = new MemberManagementAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberJoinAction.html")) {// 회원가입 action
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberLoginAction.html")) {// 로그인 action
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberFindIDAction.html")) {// 아이디 찾기 action
			action = new MemberFindIDAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberFindPWDAction.html")) {// 비밀번호 찾기 action
			action = new MemberFindPWDAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberModifyAction.html")) {// 마이페이지 수정 action
			action = new MemberModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberManagementModify.html")) {// 회원정보 수정(관리자)
			action = new MemberManagementModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberManagementModifyView.html")) {// 회원정보 수정페이지 &action(관리자 페이지)
			action = new MemberManagementModifyViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ManagementModify.html")) {// 회원정보 수정 action(관리자 페이지)
			action = new ManagementModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/management_member_leave.html")) {// 회원탈퇴 action(관리자 페이지)
			action = new MemberManagementLeaveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			/* 공지사항 */

		} else if (command.equals("/noti_list.html")){// 공지사항페이지 이동 & action
			action = new NotiListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noti_detail.html")) { // 공지사항 상세보기 페이지 이동 & action
			action = new NotiDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		/*} else if (command.equals("/noti_detail.html")) { // 공지사항 댓글 같이 보기 & action
			action = new NotiReplyDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}*/
		} else if (command.equals("/noti_write.html")) { // 공지사항 글 쓰기 페이지 이동(관리자)
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./noti/noti_write.jsp");
		} else if (command.equals("/noti_modify_view.html")) { // 공지사항 글 수정 페이지 이동 & action(관리자)
			action = new NotiModifyViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiWriteAction.html")) {// 공지사항 글쓰기 페이지 이동 & action(관리자)
			action = new NotiWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiModifyAction.html")) {// 공지사항 글 수정(관리자)
			action = new NotiModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiDeleteAction.html")) {// 공지사항 글 삭제(관리자)
			action = new NotiDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiReplyWriteAction.html")) {// 공지사항 댓글 쓰기
			action = new NotiReplyWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/noti_detail.html")) { // 공지사항 댓글 수정 페이지 이동
			action = new NotiReplyModifyViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiReplyModifyAction.html")) {// 공지사항 댓글 수정
			action = new NotiReplyModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NotiReplyDeleteAction.html")) {// 공지사항 댓글 삭제
			action = new NotiReplyDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			
			
			
			/* 카탈로그 */

		} else if (command.equals("/catalogue.html")) {// 카탈로그페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./catalogue/catalogue.jsp");

			
			
			
			
			/* 제품 */

		} else if (command.equals("/product_list.html")) {// 제품페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./product/product_list.jsp");

			
			
			
			/* 장바구니 */
			
		} else if (command.equals("/basketlist.html")) {// 장바구니 리스트 페이지 이동 & action
			action = new BasketListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/addBasket.html")) {// 장바구니 추가 action
			action = new AddBasketAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/BasketModify.html")) {// 장바구니 수정 action
			
			action = new BasketModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			/* 후기 */

		} else if (command.equals("/review_list.html")) {// review 게시판 이동 & action
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/review_detail.html")) {// review 게시판 상세보기 페이지 이동 & action
			action = new ReviewDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/review_write.html")) {// review 게시판 글쓰기 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./review/review_write.jsp");
			
		} else if (command.equals("/ReviewWriteAction.html")) {// review 게시판 글쓰기 action
			action = new ReviewWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/review_modify_view.html")) {// review 게시판 글 수정 페이지 이동 & action
			action = new ReviewModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewModifyAction.html")) {// review 게시판 글 수정 action
			action = new ReviewModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewDeleteAction.html")) {// review 게시판 글 삭제 action
			action = new ReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

			
			
			
			
			/* 질문게시판 */

		} else if (command.equals("/qna_list.html")) {// 질문게시판 이동 & action
			action = new QnaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qna_detail.html")) {// 질문게시판 상세보기 페이지 이동 & action
			action = new QnaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qna_write.html")) {// 질문게시판 글쓰기 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./qna/qna_write.jsp");
			
		} else if (command.equals("/QnaWriteAction.html")) {// 질문게시판 글쓰기 action
			action = new QnaWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/qna_modify_view.html")) {// 질문게시판 글 수정 페이지 이동 & action
			action = new QnaModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaModifyAction.html")) {// 질문게시판 글 수정 action
			action = new QnaModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaDeleteAction.html")) {// 질문게시판 글 삭제 action
			action = new QnaDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaReplyWriteAction.html")) {// 질문게시판 댓글 등록 action
			action = new QnaReplyWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

			
		/* 상담신청 */

		} else if (command.equals("/advice_request.html")) { // 상담신청 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./advice/advice_request.jsp");
		} else if (command.equals("/advice_list.html")) { //상담신청 리스트 페이지 이동(관리자)
			action = new AdviceListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/advice_detail.html")) { //상담신청 글 상세보기 (관리자)
			action = new AdviceDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdviceDeleteAction.html")) { // 상담신청 글 삭제(관리자)
			action = new AdviceDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdviceWriteAction.html")) {// advice 게시판 글쓰기 action
			action = new AdviceWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			
			
		/* 주문 내역 조회 */
			
		} else if (command.equals("/basket_list.html")) {// 주문내역 페이지 이동
			action = new BasketListAction(); 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) { 
				e.printStackTrace();
			}
			
		} else if (command.equals("/basket_detail.html")) {// 주문내역 상세피이지 이동 & action
			action = new BasketDetailAction(); 
			try {
				forward = action.execute(request, response);
			} catch (Exception e) { 
				e.printStackTrace();
			} 

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		} else if (command.equals("")) {

		}

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("get방식");
		doProcess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post방식");
		doProcess(request, response);
	}

}
