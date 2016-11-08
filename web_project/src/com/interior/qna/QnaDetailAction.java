package com.interior.qna;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class QnaDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();

		  QnaDAO qnadao = new QnaDAO();
		  QnaBean qnadata = new QnaBean();
		  List qnareplylist = new ArrayList();
		  int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		  
		  qnadao.setReadCountUpdate(num);//조회수 업데이트
		  int listcount2 = qnadao.getQnaReplyListCount();// 총 리스트 수를 받아 옴(댓글)
		  qnadata = qnadao.getDetail(num);//게시글 보기
		  qnareplylist = qnadao.getQnaReplyList(num);// 리스트를 받아옴(댓글)
		  
		 
		  if (qnadata == null) {
			  System.out.println("질문게시판 상세보기 시스템 에러");
			  return null;
		  }
		  System.out.println("질문게시판 상세보기 성공");
		  
		  if (qnareplylist == null) {
			  System.out.println("질문게시판 댓글 보기 시스템 에러");
			  return null;
		  }
		  System.out.println("질문게시판 댓글 보기 성공");
		  
		  
		  request.setAttribute("qnadata", qnadata);
		  request.setAttribute("qnareplylist", qnareplylist);
		  
		  forward.setRedirect(false);
		  forward.setPath("./qna/qna_detail.jsp");
		  
		  return forward;
	}
}