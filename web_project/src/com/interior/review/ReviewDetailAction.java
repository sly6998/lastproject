package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();

		  ReviewDAO reviewdao = new ReviewDAO();
		  ReviewBean reviewdata = new ReviewBean();

		  int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		  reviewdao.setReadCountUpdate(num);//조회수 업데이트
		  reviewdata = reviewdao.getDetail(num);//게시글 보기

		  if (reviewdata == null) {
		    System.out.println("Review 게시판 상세보기 시스템 에러");
		    return null;
		  }

		  System.out.println("Review 게시판 상세보기 성공");
		  
		  request.setAttribute("reviewdata", reviewdata);

		  forward.setRedirect(false);
		  forward.setPath("./review/review_detail.jsp");
		  
		  return forward;
	}

}
