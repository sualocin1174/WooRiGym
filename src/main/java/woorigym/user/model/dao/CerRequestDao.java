package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.ClaimTable;
import woorigym.user.model.vo.ReturnInfoVo;

public class CerRequestDao {

	public CerRequestDao() {
	}

	public ArrayList<AddressTable> selectAddressDao(Connection conn, String user_id){
		ArrayList<AddressTable> volist = new ArrayList<AddressTable>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select address_no, postcode, basic_address, detail_address from address where user_id= ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				do {
					AddressTable vo =  new AddressTable();
					vo.setAddress_no(rset.getString("address_no"));
					vo.setPostcode(rset.getString("postcode"));
					vo.setBasic_address(rset.getString("basic_address"));
					vo.setDetail_address(rset.getString("detail_address"));
					volist.add(vo);
				}while(rset.next());
				// �ּ� ���� �Է��ϴ� â ��������!!(������ư�� �ű������̶�...) 
				// address_no ��������� data[i].address_no
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rset);
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return volist;
	}
	
	public void insertClaimDao(Connection conn, ClaimTable input, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "insert into claim(order_no, claim_date, claim_kind, address_no, request_memo, return_date, claim_process, done_date, why ) "
				+ "values (?, sysdate, ?, ?, ?, sysdate+3, ?, '접수완료', ?, ? )";
//		String sql_address = "insert into address(address_no, user_id, postcode, basic_address, detail_address,fixed_address )"
//				+ "values (address_seq.nextval, ?, ?,' ', ' ', 0)";
//		String sql_select = "select address_seq.currval as address_no from dual"; //address_no가져오는 코드
		try {
			conn.setAutoCommit(true);
			//���� address���̺� �־�� �ϴϱ� ���� ����
//			PreparedStatement p = null;
//			p = conn.prepareStatement(sql_address);
//			p.setString(1, user_id);
//			p.setInt(2, Integer.parseInt(delivery));
//			p.execute();
////			p.setString(3, user_id);
////			p.setString(4, user_id);
////			p.setString(5, user_id);
////			p.setString(6, user_id);
//			PreparedStatement ps = null;
//			ps = conn.prepareStatement(sql_select);
//			rset = ps.executeQuery();
//			int address_no = 0;
//			if(rset.next()) {
//				address_no = rset.getInt("address_no");
//			}
//			System.out.println("here111");
//			close(rset);
			pstmt = conn.prepareStatement(sql);
			System.out.println("her222");
			//ȭ�鿡�� �Է��� �� ClaimTable input���� ������
			//exchange는 무조건 있는 값(null이 아님)이지만  claim_kind는 null이 될수 있으므로 뒤에 써준다.
			String kind = ""; 
			if("exchange".equals(input.getClaim_kind())) {
				kind = "교환";
			}else if("refund".equals(input.getClaim_kind())) {
				kind = "환불";
			}
			
			pstmt.setString(1, input.getOrder_no());
			//pstmt.setString(2, input.getClaim_date());
			pstmt.setString(2, kind);
			pstmt.setInt(3, input.getAddress_no());
			pstmt.setString(4, input.getRequest_memo());
//			pstmt.setString(5, input.getReturn_date()); claim_date(sysdate) + 3일
//			pstmt.setString(7, input.getClaim_process());
			pstmt.setString(5, input.getDone_date());
			pstmt.setInt(6, input.getWhy());
			boolean result = pstmt.execute();//�� �ƴ��� �ȵƴ��� boolean���� ����ޱ�
			System.out.println("result: "+ result);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				
				close(pstmt);
			}catch(Exception e){
				e.printStackTrace();
			}
	}}
	
	
	public ReturnInfoVo selectReturnInfoDao(Connection conn, String order_no, String user_id) {
		 PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = "select claim.address_no, postcode, basic_address, detail_address, request_memo, return_date\r\n" + 
					"    from claim join address on claim.address_no = address.address_no where user_id=? and order_no = ? ";
			ReturnInfoVo vo = new ReturnInfoVo();
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_id);
				pstmt.setString(2, order_no);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					vo.setAddress_no(rset.getString("address_no"));
					vo.setPostcode(rset.getString("postcode"));
					vo.setBasic_address(rset.getString("basic_address"));
					vo.setDetail_address(rset.getString("detail_address"));
					vo.setRequest_memo(rset.getString("request_memo")); //회수 시 요청사항
					vo.setReturn_date(rset.getString("return_date")); //회수예정일
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	finally {
				try {
					close(rset);
					close(pstmt);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			return vo;
	 }
			
			
	}
	

