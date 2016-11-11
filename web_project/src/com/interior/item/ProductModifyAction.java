package com.interior.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductModifyAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    request.setCharacterEncoding("utf-8");
    ActionForward forward = new ActionForward();
    ItemDAO itemdao = new ItemDAO();
    ItemBean itemdata = new ItemBean();
    int item_seq = Integer.parseInt(request.getParameter("ITEM_SEQ"));
    
    itemdata.setITEM_SEQ(item_seq);
    itemdata.setITEM_NAME(request.getParameter("ITEM_NAME"));
    itemdata.setITEM_PRICE(Integer.parseInt(request.getParameter("ITEM_PRICE")));
    itemdata.setITEM_TYPE_1(request.getParameter("ITEM_TYPE_1"));
    itemdata.setITEM_TYPE_2(request.getParameter("ITEM_TYPE_2"));
    itemdata.setITEM_TYPE_3(request.getParameter("ITEM_TYPE_3"));
    itemdata.setITEM_TYPE_4(request.getParameter("ITEM_TYPE_4"));
    itemdata.setITEM_TYPE_5(request.getParameter("ITEM_TYPE_5"));
    itemdata.setITEM_CONTENT(request.getParameter("ITEM_CONTENT"));
    
    itemdata = itemdao.itemModify(itemdata);

      if (itemdata == null) {
        System.out.println("제품 수정 실패");
        return null;
      }

      System.out.println("제품 등록 완료");
      request.setAttribute("itemdata", itemdata);

      forward.setRedirect(false);
      forward.setPath("./product_detail.html?item_seq="+item_seq);
      return forward;
  }

}
