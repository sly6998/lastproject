package com.interior.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.qna.QnaDAO;

public class ReviewReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("REVIEW_REPLY_SEQ"));
		int num2 = Integer.parseInt(request.getParameter("REVIEW_NUM"));//댓글

		ReviewDAO notidao = new ReviewDAO();
		result = notidao.ReviewReplyDelete(num);

		
		if (result == false) {
			System.out.println("후기 게시판 댓글 삭제 시스템 에러");
			return null;
		}

		System.out.println("후기 게시판 댓글 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./review_detail.html?REVIEW_NUM="+num2);
		return forward;
	}
}
