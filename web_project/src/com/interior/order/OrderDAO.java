package com.interior.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.interior.basket.BasketBean;
import com.interior.member.MemberBean;

public class OrderDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public OrderDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}

	public List getBasket_info_List(String id) {//장바구니 내역 가져오기
		// TODO Auto-generated method stub
				String sql = "select basket_num, BASKET_MEMBER_ID, BASKET_ITEM_IMAGE, BASKET_ITEM_NAME, "
						+ "BASKET_ITEM_TYPE, BASKET_AMOUNT, BASKET_ITEM_PRICE, basket_result "
						+ "from basket where BASKET_MEMBER_ID=?";
				List basketlist = new ArrayList();
				
				try{
					con=ds.getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						OrderBean order = new OrderBean();
						order.setORDER_BASKET_NUM(rs.getInt("basket_num"));
						order.setORDER_MEMBER_ID(rs.getString("BASKET_MEMBER_ID"));
						order.setORDER_ITEM_IMG(rs.getString("BASKET_ITEM_IMAGE"));
						order.setORDER_ITEM_NAME(rs.getString("BASKET_ITEM_NAME"));
						order.setORDER_ITEM_TYPE(rs.getString("BASKET_ITEM_TYPE"));
						order.setORDER_ITEM_AMOUNT(rs.getInt("BASKET_AMOUNT"));
						order.setORDER_ITEM_PRICE(rs.getInt("BASKET_ITEM_PRICE"));
						order.setORDER_ITEM_PRICE_SUM(rs.getInt("BASKET_RESULT"));
						
						basketlist.add(order);
					}
					
					return basketlist;
				}catch(Exception e){
					System.out.println("getOrder_BasketList error : "+e);
					e.printStackTrace();
				}finally{
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				return null;
	}

	public OrderBean getmember_info_List(String id) {//회원정보 가져오기
	String sql = "select * from member_info where member_ID=?";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			OrderBean order = new OrderBean();
			order.setORDER_MEMBER_NAME(rs.getString("MEMBER_NAME"));
			order.setORDER_MEMBER_ADDR_1(rs.getString("MEMBER_ADDR_1"));
			order.setORDER_MEMBER_ADDR_2(rs.getString("MEMBER_ADDR_2"));
			order.setORDER_MEMBER_ZIP(rs.getString("MEMBER_ADDR_ZIP"));
			order.setORDER_MEMBER_TEL(rs.getString("MEMBER_TEL"));
			order.setORDER_MEMEBER_EMAIL(rs.getString("MEMBER_EMAIL"));
			return order;
		}catch(Exception e){
			System.out.println("getOrder_OrderList error : "+e);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

}
