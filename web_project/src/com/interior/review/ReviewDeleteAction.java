package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("REVIEW_NUM"));

		ReviewDAO reviewdao = new ReviewDAO();
		result = reviewdao.reviewdelete(num);

		if (result == false) {
			System.out.println("Review 게시판 글 삭제 시스템 에러");
			return null;
		}

		System.out.println("Review 게시판 글 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./review_list.html");
		return forward;
	}
}
