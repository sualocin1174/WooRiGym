package woorigym.user.model.dao;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import woorigym.user.model.vo.AddressTable;

public class CerRequestDao {

	public CerRequestDao() {
	}

	public ArrayList<AddressTable> selectAddressDao(Connection conn, String user_id){
		ArrayList<AddressTable> volist = new ArrayList<AddressTable>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select postcode, basic_address, detail_address from address where user_id= ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				do {
					AddressTable vo =  new AddressTable();
					vo.setPostcode(rset.getString("postcode"));
					vo.setBasic_address(rset.getString("basic_address"));
					vo.setDetail_address(rset.getString("detail_address"));
					volist.add(vo);
				}while(rset.next());
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
}
