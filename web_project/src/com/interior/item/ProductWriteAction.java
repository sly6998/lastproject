package com.interior.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();
		  ItemDAO itemdao = new ItemDAO();
		  ItemBean itemdata = new ItemBean();
		  int item_seq = 0;

		  String realFolder = "";
		  String savaFolder = "/upload/main_upload";
		  int fileSize = 5 * 1024 * 1024;

		  realFolder = request.getSession().getServletContext().getRealPath(savaFolder);

		  boolean result = false;

		  try {
		    MultipartRequest multi = null;

		    multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		    itemdata.setITEM_NAME(multi.getParameter("ITEM_NAME"));
		    itemdata.setITEM_PRICE(Integer.parseInt(multi.getParameter("ITEM_PRICE")));
		    itemdata.setITEM_TYPE_1(multi.getParameter("ITEM_TYPE_1"));
		    itemdata.setITEM_TYPE_2(multi.getParameter("ITEM_TYPE_2"));
		    itemdata.setITEM_TYPE_3(multi.getParameter("ITEM_TYPE_3"));
		    itemdata.setITEM_TYPE_4(multi.getParameter("ITEM_TYPE_4"));
		    itemdata.setITEM_TYPE_5(multi.getParameter("ITEM_TYPE_5"));
		    itemdata.setITEM_IMAGE(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		    itemdata.setITEM_CONTENT(multi.getParameter("ITEM_CONTENT"));

		    result = itemdao.ItemInsert(itemdata, request);
		    item_seq = (int) request.getAttribute("item_seq");

		    if (result == false) {
		      System.out.println("제품 등록 실패");
		      return null;
		    }

		    System.out.println("제품 등록 완료");

		    forward.setRedirect(false);
		    forward.setPath("./product_detail.html?item_seq="+item_seq);
		    return forward;
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return null;
	}
}
