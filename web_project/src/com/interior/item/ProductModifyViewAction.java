package com.interior.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ProductModifyViewAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    ActionForward forward = new ActionForward();
    request.setCharacterEncoding("utf-8");
    int num = Integer.parseInt(request.getParameter("num"));

    ItemDAO itemdao = new ItemDAO();
    ItemBean itembean = new ItemBean();

    itembean = itemdao.ItemModifyView(num);

    if (itembean == null) {
      System.out.println("제품 Modify View 에러");
      return null;
    }

    request.setAttribute("itembean", itembean);
    System.out.println("제품 Modify View  완료");
    
    forward.setRedirect(false);
    forward.setPath("./product/product_modify_view.jsp");

    return forward;
  }

}
