package com.interior.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiBean;
import com.interior.noti.NotiDAO;

public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new  ActionForward();

		  QnaDAO qnadao = new QnaDAO();
		  QnaBean qnadata = new QnaBean();  //게시글
		  QnaBean qnadata2 = new QnaBean();	//댓글
		  
		  
		  int num = Integer.parseInt(request.getParameter("QNA_NUM"));	//게시글
		  int num2 = Integer.parseInt(request.getParameter("QNA_NUM"));	//댓글
		  
		  
		  List replylist2 = new ArrayList();
		  replylist2 = qnadao.getQnaReplyList(num2);// 리스트를 받아옴(댓글)
		  
		  

		  qnadao.setReadCountUpdate(num);//조회수 업데이트
		  qnadata = qnadao.getDetail(num);//게시글 보기
		  qnadata2 = qnadao.getDetail(num2);//게시글 보기
		 
		  
		  if (qnadata == null) {
		    System.out.println("질문게시판 상세보기 시스템 에러");
		    return null;
		  }
		  if (qnadata2 == null) {
			  System.out.println("질문게시판 댓글보기 시스템 에러");
			  return null;
		  }
		  

		  System.out.println("질문게시판 상세보기 성공");
		  System.out.println("질문게시판 댓글보기 성공");
		  
		  
		  request.setAttribute("qnadata", qnadata);
		  request.setAttribute("qnadata2", qnadata2);
		  request.setAttribute("replylist2", replylist2);

		  forward.setRedirect(false);
		  forward.setPath("./qna/qna_detail.jsp");
		  
		  return forward;
	}

}
