package com.interior.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class QnaReplyWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnadata = new QnaBean();

		boolean result = false;

		try {
			
			qnadata.setQnA_REPLY_MEMBER_ID((String)request.getParameter("QNA_REPLY_MEMBER_ID"));
			qnadata.setQnA_REPLY_CONTENT((String)request.getParameter("QNA_REPLY_CONTENT"));

			result = qnadao.qnaReplyInsert(qnadata);

			if (result == false) {
				System.out.println("QNA 댓글 등록 시스템 에러");
				return null;
			}

			System.out.println("QNA 댓글 등록 완료");

			forward.setRedirect(true);
			forward.setPath("./qna_detail.html");
			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}