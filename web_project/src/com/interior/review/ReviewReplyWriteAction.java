package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewreplydata = new ReviewBean();
		
		int num2 = Integer.parseInt(request.getParameter("REVIEW_NUM"));
		
		
		boolean result = false;
		
		try{
			
			reviewreplydata.setREVIEW_REPLY_MEMBER_ID((String)request.getParameter("REVIEW_REPLY_MEMBER_ID"));
			reviewreplydata.setREVIEW_REPLY_CONTENT((String)request.getParameter("REVIEW_REPLY_CONTENT"));
			reviewreplydata.setREVIEW_REPLY_NUM(num2);
			
			result = reviewdao.ReviewReplyInsert(reviewreplydata);
			
			
			if (result == false) {
				System.out.println("REVIEW 댓글 등록 시스템 에러");
				return null;
			}
			
			System.out.println("REVIEW 댓글 등록 성공");
			
			forward.setRedirect(true);
			forward.setPath("./review_detail.html?REVIEW_NUM="+num2);
			return forward;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}