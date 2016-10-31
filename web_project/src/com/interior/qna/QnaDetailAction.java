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
		  QnaBean qnadata = new QnaBean();
		  QnaBean qnadata2 = new QnaBean();	//댓글
		
		  
		  int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		  int num2 = Integer.parseInt(request.getParameter("QNA_NUM"));	//댓글
		  
		  /////////////////////////////////////////////////////////////////////////
		  List replylist2 = new ArrayList();
		  /*
		  int page2 = 1;
		  int limit2 = 10;
		  if (request.getParameter("page2") != null) {
				page2 = Integer.parseInt(request.getParameter("page2"));
			}
		   */
     		int listcount2 = qnadao.getReplyListCount();// 총 리스트 수를 받아 옴(댓글)
			replylist2 = qnadao.getQnaReplyList(num2);// 리스트를 받아옴(댓글)
			
			/*
			// 총 페이지 수
			int maxpage2 = (int) ((double) listcount2 / limit2 + 0.95);// 0.95를 더해서 올림
																	// 처리
			// 현재 페이지에 보여줄 시작 페이지 수(1,11,21....)
			int startpage2 = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1;
			// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 ...)
			int endpage2 = maxpage2;

			if (endpage2 > startpage2 + 10 - 1)
				endpage2 = startpage2 + 10 - 1;
 			*/
		 /////////////////////////////////////////////////////////////////////////
			

		  
		  
		  
		  
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
		  
		  /*
		  
		  request.setAttribute("page2", page2);// 현재 페이지 수
		  request.setAttribute("maxpage2", maxpage2);// 최대 페이지 수
		  request.setAttribute("startpage2", startpage2);// 현재 페이지에 표시할 첫 페이지 수
		  request.setAttribute("endpage2", endpage2);// 현재 페이지에 표시할 끝 페이지 수
		  request.setAttribute("listcount2", listcount2);// 글 수
		   */
		  request.setAttribute("replylist2", replylist2);

		  forward.setRedirect(false);
		  forward.setPath("./qna/qna_detail.jsp");
		  
		  return forward;
	}

}
