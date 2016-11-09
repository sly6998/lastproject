package com.interior.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.interior.noti.NotiBean;

public class ItemDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public ItemDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			System.out.println("DB connection failed : " + e);
			return;
		}
	}

	public int getListCount(String cond) {

		int count = 0;
		String sql = "select count(*) from item";
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount error : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return count;
	}

	public List getItemList(int page, int limit, String cond) {// 아이템 리스트 받아오기
		// TODO Auto-generated method stub
		String sql = "select * from "
				+ "(select rownum rnum, ITEM_SEQ, ITEM_IMAGE, ITEM_NAME, ITEM_PRICE, ITEM_DATE from "
				+ "(select * from item order by " + "ITEM_DATE)) " + "where rnum>=? and rnum<=?";

		String sql_2 = "select * from "
				+ "(select rownum rnum, ITEM_SEQ, ITEM_IMAGE, ITEM_NAME, ITEM_PRICE, ITEM_DATE form "
				+ "(select * from item where %s order by " + "ITEM_DATE)) " + "where rnum>=? and rnum<=?";

		if (cond != null && !cond.equals("")) {
			sql = String.format(sql_2, cond);
		}

		List list = new ArrayList();

		int startrow = (page - 1) * 9 + 1;
		int endrow = startrow + limit - 1;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ItemBean item = new ItemBean();
				item.setITEM_NUM(rs.getInt("rnum"));
				item.setITEM_SEQ(rs.getInt("ITEM_SEQ"));
				item.setITEM_IMAGE(rs.getString("ITEM_IMAGE"));
				item.setITEM_NAME(rs.getString("ITEM_NAME"));
				item.setITEM_PRICE(rs.getInt("ITEM_PRICE"));
				item.setITEM_DATE(rs.getDate("ITEM_DATE"));
				list.add(item);
			}
			return list;
		} catch (Exception e) {
			System.out.println("getItemList error : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	public boolean ItemInsert(ItemBean itemdata, HttpServletRequest request) {
		String sql = "insert into item "
				+ "(ITEM_SEQ, ITEM_NAME, ITEM_PRICE, ITEM_IMAGE, ITEM_TYPE_1, ITEM_TYPE_2, ITEM_TYPE_3, "
				+ "ITEM_TYPE_4, ITEM_TYPE_5, ITEM_CONTENT, ITEM_DATE) "
				+ "values (ITEM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,SYSDATE)";
		
		String sql_seq = "select * from (select * from item order by item_seq desc) where rownum= 1 ";
		int result = 0;
		int item_seq = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemdata.getITEM_NAME());
			pstmt.setInt(2, itemdata.getITEM_PRICE());
			pstmt.setString(3, itemdata.getITEM_IMAGE());
			pstmt.setString(4, itemdata.getITEM_TYPE_1());
			pstmt.setString(5, itemdata.getITEM_TYPE_2());
			pstmt.setString(6, itemdata.getITEM_TYPE_3());
			pstmt.setString(7, itemdata.getITEM_TYPE_4());
			pstmt.setString(8, itemdata.getITEM_TYPE_5());
			pstmt.setString(9, itemdata.getITEM_CONTENT());

			result = pstmt.executeUpdate();

			// seq 조회
			pstmt = con.prepareStatement(sql_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				item_seq = rs.getInt("ITEM_SEQ");
			}

			if (result != 1) {
				System.out.println("제품등록 실패");
				return false;
			}
			System.out.println("제품등록 성공");

			request.setAttribute("item_seq", item_seq);

			return true;

		} catch (Exception e) {
			System.out.println("Insert Item error : " + e);
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}

	public ItemBean getItemDetail(int item_seq) {
		String sql = "select * from item where item_seq = ? ";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, item_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBean item = new ItemBean();
				item.setITEM_CONTENT(rs.getString("item_content"));
				item.setITEM_IMAGE(rs.getString("ITEM_IMAGE"));
				item.setITEM_NAME(rs.getString("item_name"));
				item.setITEM_PRICE(rs.getInt("item_price"));
				item.setITEM_SEQ(rs.getInt("item_seq"));
				item.setITEM_TYPE_1(rs.getString("item_type_1"));
				item.setITEM_TYPE_2(rs.getString("item_type_2"));
				item.setITEM_TYPE_3(rs.getString("item_type_3"));
				item.setITEM_TYPE_4(rs.getString("item_type_4"));
				item.setITEM_TYPE_5(rs.getString("item_type_5"));

				return item;
			}

			return null;

		} catch (Exception e) {
			System.out.println("제품 상세보기 실패 : " + e);
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	
	
	
	//여기서 부터 ITEM_REPLY 관련 DAO 입니다..................
	//ITEM 댓글 삭제
	public boolean ItemReplyDelete(int num){
		String sql = "delete from item_reply where item_reply_seq=?";
		
		int result=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("ItemReplyDelete error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//ITEM 댓글 작성하기 
	public boolean ItemReplyInsert(ItemBean itemdata) {
		// TODO Auto-generated method stub
		int num = 0;
		String sql = "";
		int result = 0;
		
		try{
			sql = "insert into item_reply "
					+ "(item_REPLY_MEMBER_ID, item_REPLY_CONTENT, item_REPLY_DATE, item_REPLY_NUM, item_REPLY_SEQ) "
					+ "values (?,?,sysdate,?,item_reply_seq.NEXTVAL)";
			
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemdata.getITEM_REPLY_MEMBER_ID());
			pstmt.setString(2, itemdata.getITEM_REPLY_CONTENT());
			pstmt.setInt(3, itemdata.getITEM_REPLY_NUM());
			
			
			
			result = pstmt.executeUpdate();
			if(result==0){
				return false; //0이 실패
			}
			return true;
		}catch(Exception e){
			System.out.println("ItemReplyInsert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	
	//ITEM 댓글 수정하기
	public boolean ItemModifyReply(ItemBean modifyreply) {
	      String sql ="update item_REPLY set item_reply_member_id=?, item_reply_content=?, item_reply_date=sysdate where item_reply_seq=? and item_reply_num=? ";
	      ItemBean item = null;
	      int result = 0;
	          
	      try{
	        con=ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, modifyreply.getITEM_REPLY_MEMBER_ID());
	        pstmt.setString(2, modifyreply.getITEM_REPLY_CONTENT());
	        pstmt.setInt(3, modifyreply.getITEM_REPLY_SEQ());
	        pstmt.setInt(4, modifyreply.getITEM_SEQ());
	        
	        result = pstmt.executeUpdate();
	        
	        if(result != 1){
	          System.out.println("댓글수정 실패");
	          return false;
	        }
	        
	        return true;
	      }catch(Exception e){
	        System.out.println("item reply modify error : "+e);
	      }finally{
	        if(rs!=null) try{rs.close();}catch(SQLException ex){}
	        if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
	        if(con!=null) try{con.close();}catch(SQLException ex){}
	      }
	      return false;
	    }
	
	
	
	//ITEM 댓글 같이 보기(수정)
	public ItemBean ItemReplyModifyView(int num1, int num2, HttpServletRequest request) {
		String sql = "select * from item where item_seq=?";
		String sql_reply = "select * from item_reply where item_reply_num=? order by item_reply_seq";
		String modify_reply = "select * from item_reply where item_reply_seq=?";
		int result = 0;
		int result_reply = 0;
		int item_reply_seq = 0;
		ItemBean item = null;
		ItemBean modify_re = null;
		List reply = new ArrayList<>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result =1;
				item = new ItemBean();
				item.setITEM_CONTENT(rs.getString("item_content"));
				item.setITEM_IMAGE(rs.getString("ITEM_IMAGE"));
				item.setITEM_NAME(rs.getString("item_name"));
				item.setITEM_PRICE(rs.getInt("item_price"));
				item.setITEM_SEQ(rs.getInt("item_seq"));
				item.setITEM_TYPE_1(rs.getString("item_type_1"));
				item.setITEM_TYPE_2(rs.getString("item_type_2"));
				item.setITEM_TYPE_3(rs.getString("item_type_3"));
				item.setITEM_TYPE_4(rs.getString("item_type_4"));
				item.setITEM_TYPE_5(rs.getString("item_type_5"));

			}
			
			//댓글 불러오기
			pstmt = con.prepareStatement(sql_reply);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result_reply =1;
				ItemBean item2 = new ItemBean();
				item2.setITEM_REPLY_NUM(rs.getInt("ITEM_REPLY_NUM"));
				item2.setITEM_REPLY_MEMBER_ID(rs.getString("ITEM_REPLY_MEMBER_ID"));
				item2.setITEM_REPLY_MEMBER_NAME(rs.getString("ITEM_REPLY_MEMBER_NAME"));
				item2.setITEM_REPLY_CONTENT(rs.getString("ITEM_REPLY_CONTENT"));
				item2.setITEM_REPLY_DATE(rs.getDate("ITEM_REPLY_DATE"));
				item2.setITEM_REPLY_SEQ(rs.getInt("ITEM_REPLY_SEQ"));
				item2.setITEM_REPLY_REF(rs.getInt("ITEM_REPLY_REF"));
				item2.setITEM_REPLY_LEV(rs.getInt("ITEM_REPLY_LEV"));
				reply.add(item2);
			}
			
			
			
			//수정할 댓글 불러오기
			pstmt = con.prepareStatement(modify_reply);
			pstmt.setInt(1, num2);
			rs = pstmt.executeQuery();
			while(rs.next()){
				modify_re = new ItemBean();
				modify_re.setITEM_REPLY_NUM(rs.getInt("ITEM_REPLY_NUM"));
				modify_re.setITEM_REPLY_MEMBER_ID(rs.getString("ITEM_REPLY_MEMBER_ID"));
				modify_re.setITEM_REPLY_MEMBER_NAME(rs.getString("ITEM_REPLY_MEMBER_NAME"));
				modify_re.setITEM_REPLY_CONTENT(rs.getString("ITEM_REPLY_CONTENT"));
				modify_re.setITEM_REPLY_DATE(rs.getDate("ITEM_REPLY_DATE"));
				modify_re.setITEM_REPLY_SEQ(rs.getInt("ITEM_REPLY_SEQ"));
				modify_re.setITEM_REPLY_REF(rs.getInt("ITEM_REPLY_REF"));
				modify_re.setITEM_REPLY_LEV(rs.getInt("ITEM_REPLY_LEV"));
			}
			if(result != 1 || result_reply !=1){
				System.out.println("보여주기 실패");
				return null;
			}
			System.out.println("보여주기 성공");
			
			request.setAttribute("replylist", reply);
			request.setAttribute("modify_re", modify_re);
			
			return item;
			
		} catch (Exception e) {
			System.out.println("Show replies error : " + e);
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}
}
