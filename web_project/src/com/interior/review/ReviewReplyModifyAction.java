package com.interior.review;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ReviewReplyModifyAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    ActionForward forward = new ActionForward();
    request.setCharacterEncoding("utf-8");

    boolean result = false;

    ReviewDAO reviewdao = new ReviewDAO();
    ReviewBean modifyreply = new ReviewBean();
    
    int num = Integer.parseInt(request.getParameter("num"));
    modifyreply.setREVIEW_NUM(num);
    modifyreply.setREVIEW_REPLY_SEQ(Integer.parseInt(request.getParameter("REVIEW_REPLY_SEQ")));
    modifyreply.setREVIEW_REPLY_MEMBER_ID(request.getParameter("REVIEW_REPLY_MEMBER_ID"));
    modifyreply.setREVIEW_REPLY_CONTENT(request.getParameter("REVIEW_REPLY_CONTENT"));

    result = reviewdao.ReviewReplyModify(modifyreply);

    if (result == false) {
      System.out.println("후기 게시판 댓글 수정 에러");
      return null;
    }

    System.out.println("후기 게시판 댓글 수정 완료");

    forward.setRedirect(true);
    forward.setPath("./review_detail.html?REVIEW_NUM="+num);

    return forward;
  }
}