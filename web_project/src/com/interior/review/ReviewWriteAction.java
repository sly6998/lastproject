package com.interior.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewdata = new ReviewBean();

		boolean result = false;

		try {

			reviewdata.setREVIEW_MEMBER_ID((String)request.getParameter("REVIEW_MEMBER_ID"));
			reviewdata.setREVIEW_SUBJECT((String)request.getParameter("REVIEW_SUBJECT"));
			reviewdata.setREVIEW_CONTENT((String)request.getParameter("REVIEW_CONTENT"));

			result = reviewdao.reviewInsert(reviewdata);

			if (result == false) {
				System.out.println("Review 게시판 등록 시스템 에러");
				return null;
			}

			System.out.println("Review 게시판 등록 완료");

			forward.setRedirect(true);
			forward.setPath("./review_list.html");
			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}