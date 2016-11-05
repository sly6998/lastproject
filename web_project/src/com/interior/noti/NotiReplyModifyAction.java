package com.interior.noti;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiReplyModifyAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    ActionForward forward = new ActionForward();
    request.setCharacterEncoding("utf-8");

    boolean result = false;

    NotiDAO notidao = new NotiDAO();
    NotiBean modifyreply = new NotiBean();
    int num = Integer.parseInt(request.getParameter("num"));
    modifyreply.setNOTI_NUM(num);
    modifyreply.setNOTI_REPLY_SEQ(Integer.parseInt(request.getParameter("NOTI_REPLY_SEQ")));
    modifyreply.setNOTI_REPLY_MEMBER_ID(request.getParameter("NOTI_REPLY_MEMBER_ID"));
    modifyreply.setNOTI_REPLY_CONTENT(request.getParameter("NOTI_REPLY_CONTENT"));

    result = notidao.notiModifyReply(modifyreply);

    if (result == false) {
      System.out.println("공지사항 댓글 수정 에러");
      return null;
    }

    System.out.println("공지사항 댓글 수정 완료");

    forward.setRedirect(true);
    forward.setPath("./noti_detail.html?NOTI_NUM="+num);

    return forward;
  }
}