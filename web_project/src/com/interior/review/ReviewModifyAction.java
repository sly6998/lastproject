package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  ActionForward forward = new ActionForward();
		  request.setCharacterEncoding("utf-8");
		  
		  boolean result = false;
		  int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		  
		  ReviewDAO reviewdao = new ReviewDAO();
		  ReviewBean reviewdata = new ReviewBean(); 
		  
		  try{
		    reviewdata.setREVIEW_NUM(num);
		    reviewdata.setREVIEW_SUBJECT(request.getParameter("REVIEW_SUBJECT"));
		    reviewdata.setREVIEW_CONTENT(request.getParameter("REIVEW_CONTENT"));
		    
		    result = reviewdao.reviewModify(reviewdata);
		    
		      if(result == false){
		        System.out.println("Review 게시판 수정 시스템 에러");
		        return null;
		      }
		    
		  
		  System.out.println(" Review 게시판 수정 완료");
		  
		  forward.setRedirect(true);
		  forward.setPath("./review_detail.html?num="+reviewdata.getREVIEW_NUM());
		  
		  }catch(Exception e){
		    e.printStackTrace();
		  }
		  return forward;
	}

}
