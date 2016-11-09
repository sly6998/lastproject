package com.interior.item;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ItemReplyModifyAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

    ActionForward forward = new ActionForward();
    request.setCharacterEncoding("utf-8");

    boolean result = false;

    ItemDAO itemdao = new ItemDAO();
    ItemBean itemmodifyreply = new ItemBean();
    int num = Integer.parseInt(request.getParameter("num"));
    itemmodifyreply.setITEM_SEQ(num);
    itemmodifyreply.setITEM_REPLY_SEQ(Integer.parseInt(request.getParameter("ITEM_REPLY_SEQ")));
    itemmodifyreply.setITEM_REPLY_MEMBER_ID(request.getParameter("ITEM_REPLY_MEMBER_ID"));
    itemmodifyreply.setITEM_REPLY_CONTENT(request.getParameter("ITEM_REPLY_CONTENT"));

    result = itemdao.ItemModifyReply(itemmodifyreply);

    if (result == false) {
      System.out.println("제품 관련 댓글 수정 에러");
      return null;
    }

    System.out.println("제품 관련 댓글 수정 완료");

    forward.setRedirect(true);
    forward.setPath("./item_detail.html?ITEM_SEQ="+num);

    return forward;
  }
}