package com.interior.noti;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();

		  NotiDAO notidao = new NotiDAO();
		  NotiBean notidata = new NotiBean();
		  NotiBean notidata2 = new NotiBean(); //공지사항 댓글용
		  

		  int num = Integer.parseInt(request.getParameter("NOTI_NUM"));
		  int num2 = Integer.parseInt(request.getParameter("NOTI_NUM")); //공지사항 댓글용
		  
		  List notireplylist = new ArrayList();
		  
		  int listcount2 = notidao.getNotiReplyListCount();// 총 리스트 수를 받아 옴(댓글)
		  notireplylist = notidao.getNotiReplyList(num2);// 리스트를 받아옴(댓글)
		  
		  notidao.setReadCountUpdate(num);//조회수 업데이트
		  notidata = notidao.getDetail(num);//게시글 보기
		  notidata2 = notidao.getDetail(num2);//공지사항 게시글의 댓글 보기
		 
		  if (notidata == null) {
			  System.out.println("공지사항 상세보기 시스템 에러");
			  return null;
		  }
		  System.out.println("공지사항 상세보기 성공");
		  
		  if (notidata2 == null) {
			  System.out.println("공지사항 댓글 보기 시스템 에러");
			  return null;
		  }
		  System.out.println("공지사항 댓글 보기 성공");
		  
		  
		  request.setAttribute("notidata", notidata);
		  request.setAttribute("notidata2", notidata2);
		  		  
		  request.setAttribute("notireplylist", notireplylist);
		  
		  forward.setRedirect(false);
		  forward.setPath("./noti/noti_detail.jsp");
		  
		  return forward;
	}
}