package com.interior.review;

import java.util.ArrayList;
import java.util.List;

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
		  List reviewreplylist = new ArrayList();
		  int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));

		  reviewdao.setReadCountUpdate(num);//조회수 업데이트
		  int listcount2 = reviewdao.getReivewReplyListCount();// 총 리스트 수를 받아 옴(댓글)
		  reviewdata = reviewdao.getDetail(num);//게시글 보기
		  reviewreplylist = reviewdao.getReviewReplyList(num);// 리스트를 받아옴(댓글)

		  if (reviewdata == null) {
		    System.out.println("Review 게시판 상세보기 시스템 에러");
		    return null;
		  }

		  System.out.println("Review 게시판 상세보기 성공");
		  
		  request.setAttribute("reviewdata", reviewdata);
		  request.setAttribute("reviewreplylist", reviewreplylist);

		  forward.setRedirect(false);
		  forward.setPath("./review/review_detail.jsp");
		  
		  return forward;
	}

}
