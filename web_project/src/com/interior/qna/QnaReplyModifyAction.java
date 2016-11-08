package com.interior.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class QnaReplyModifyAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    ActionForward forward = new ActionForward();
    request.setCharacterEncoding("utf-8");

    boolean result = false;

    QnaDAO qnadao = new QnaDAO();
    QnaBean qnamodifyreply = new QnaBean();
    int num = Integer.parseInt(request.getParameter("num"));
    qnamodifyreply.setQNA_NUM(num);
    qnamodifyreply.setQNA_REPLY_SEQ(Integer.parseInt(request.getParameter("QNA_REPLY_SEQ")));
    qnamodifyreply.setQNA_REPLY_MEMBER_ID(request.getParameter("QNA_REPLY_MEMBER_ID"));
    qnamodifyreply.setQNA_REPLY_CONTENT(request.getParameter("QNA_REPLY_CONTENT"));

    result = qnadao.QnaModifyReply(qnamodifyreply);

    if (result == false) {
      System.out.println("질문게시판 댓글 수정 에러");
      return null;
    }

    System.out.println("질문게시판 댓글 수정 완료");

    forward.setRedirect(true);
    forward.setPath("./qna_detail.html?QNA_NUM="+num);

    return forward;
  }
}