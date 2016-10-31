package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  
	    ActionForward forward = new ActionForward();
	    request.setCharacterEncoding("utf-8");
	    
	    ReviewDAO reviewdao = new ReviewDAO();
	    ReviewBean reviewdata = new ReviewBean(); 
	    
	    int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));
	    reviewdata = reviewdao.reviewmodifyView(num);
	    
	    if(reviewdata == null){
	      System.out.println("Review 게시판 수정페이지 이동 시스템 에러");
	      return null;
	    }
	    
	    System.out.println("Review 게시판 수정페이지 보기 성공");
	    
	    request.setAttribute("reviewdata", reviewdata);
	    forward.setRedirect(false);
	    forward.setPath("./review/review_modify_view.jsp");
	    
	    return forward;
	  }

	}
