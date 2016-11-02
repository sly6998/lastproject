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
import com.interior.review.ReviewBean;

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

	public boolean paymentInsert(OrderBean order) {
		
		String sql = "insert into ORDER_LIST "
				+ "(ORDER_STATUS, ORDER_TRADE_NUM, ORDER_ITEM_IMG, ORDER_ITEM_NAME, "
				+ "ORDER_ITEM_TYPE, ORDER_ITEM_AMOUNT, ORDER_ITEM_PRICE, ORDER_ITEM_PRICE_SUM, "
				+ "ORDER_MEMO, ORDER_TRADE_TYPE, ORDER_MEMBER_ID, ORDER_MEMBER_NAME, ORDER_MEMBER_TEL, "
				+ "ORDER_EMAIL, ORDER_NAME, ORDER_TEL, ORDER_ZIP, ORDER_ADDR_1, ORDER_ADDR_2, ORDER_DATE) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		int result = 0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, order.getORDER_TRADE_STATUS());
			pstmt.setString(2, order.getORDER_TRADE_NUM());
			pstmt.setString(3, order.getORDER_ITEM_IMG());
			pstmt.setString(4, order.getORDER_ITEM_NAME());
			pstmt.setString(5, order.getORDER_ITEM_TYPE());
			pstmt.setInt(6, order.getORDER_ITEM_AMOUNT());
			pstmt.setInt(7, order.getORDER_ITEM_PRICE());
			pstmt.setInt(8, order.getORDER_ITEM_PRICE_SUM());
			pstmt.setString(9, order.getORDER_MEMO());
			pstmt.setString(10, order.getORDER_TRADE_TYPE());
			pstmt.setString(11, order.getORDER_MEMBER_ID());
			pstmt.setString(12, order.getORDER_MEMBER_NAME());
			pstmt.setString(13, order.getORDER_MEMBER_TEL());
			pstmt.setString(14, order.getORDER_MEMEBER_EMAIL());
			pstmt.setString(15, order.getORDER_NAME());
			pstmt.setString(16, order.getORDER_TEL());
			pstmt.setString(17, order.getORDER_ZIP());
			pstmt.setString(18, order.getORDER_ADDR_1());
			pstmt.setString(19, order.getORDER_ADDR_2());
			result = pstmt.executeUpdate();
			
			if(result != 0){
				return true;
			}
			
		}catch(Exception e){
			System.out.println("payment_insert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public List getOrderList(String id) {
		// TODO Auto-generated method stub
				String sql = "select ORDER_TRADE_NUM, ORDER_ITEM_NAME, ORDER_DATE, ORDER_ITEM_PRICE_SUM "
				+ "from ORDER_LIST where ORDER_MEMBER_ID = ? order by ORDER_DATE desc";
				
				List list = new ArrayList();
				
				try{
					con=ds.getConnection();
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						OrderBean order = new OrderBean();
						//order.setORDER_TRADE_STATUS(rs.getString("ORDER_STATUS"));
					    order.setORDER_TRADE_NUM(rs.getString("ORDER_TRADE_NUM"));//주문번호	
					    //order.setORDER_ITEM_IMG(rs.getString("ORDER_ITEM_IMG"));//제품이미지	
					    order.setORDER_ITEM_NAME(rs.getString("ORDER_ITEM_NAME"));//제품명	
					    //order.setORDER_ITEM_TYPE(rs.getString("ORDER_ITEM_TYPE"));//제품옵션	
					    //order.setORDER_ITEM_AMOUNT(rs.getInt("ORDER_ITEM_AMOUNT"));//제품 주문 수량		
					    //order.setORDER_ITEM_PRICE(rs.getInt("ORDER_ITEM_PRICE"));//제품 가격		
					    order.setORDER_ITEM_PRICE_SUM(rs.getInt("ORDER_ITEM_PRICE_SUM"));//결제 총 금액	
					    //order.setORDER_MEMO(rs.getString("ORDER_MEMO"));			
					    //order.setORDER_TRADE_TYPE(rs.getString("ORDER_TRADE_TYPE"));			
					    
					    //order.setORDER_MEMBER_ID(rs.getString("ORDER_MEMBER_ID"));						
					    //order.setORDER_MEMBER_NAME(rs.getString("ORDER_MEMBER_NAME"));//회원 이름	
					    //order.setORDER_MEMBER_TEL(rs.getString("ORDER_MEMBER_TEL"));//회원 연락처	
					    //order.setORDER_MEMEBER_EMAIL(rs.getString("ORDER_EMAIL"));//주문 이메일	
					
					   // order.setORDER_NAME(rs.getString("ORDER_NAME"));//수취인 이름	
					   // order.setORDER_TEL(rs.getString("ORDER_TEL"));//수취인 연락처	
					   // order.setORDER_ZIP(rs.getString("ORDER_ZIP"));//수취인 주소	
					  //  order.setORDER_ADDR_1(rs.getString("ORDER_ADDR_1"));//수취인 주소	
					  //  order.setORDER_ADDR_2(rs.getString("ORDER_ADDR_2"));//수취인 주소
					   order.setORDER_DATE(rs.getDate("ORDER_DATE"));//주문 날짜
					    
						list.add(order);
					}
					return list;
				}catch(Exception e){
					System.out.println("getOrderList error : "+e);
					e.printStackTrace();
				}finally{
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(con!=null) try{con.close();}catch(SQLException ex){}
				}
		return null;
	}

	
	
}
