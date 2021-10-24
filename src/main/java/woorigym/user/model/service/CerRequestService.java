package woorigym.user.model.service;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.user.model.dao.CerRequestDao;
import woorigym.user.model.vo.AddressTable;
import woorigym.user.model.vo.ClaimTable;
import woorigym.user.model.vo.ReturnInfoVo;

public class CerRequestService {

	public CerRequestService() {
	}

	public ArrayList<AddressTable> selectAddressService(String user_id){
		Connection conn = getConnection();
		 ArrayList<AddressTable> volist = ( ArrayList<AddressTable>) new CerRequestDao().selectAddressDao(conn, user_id);
		close(conn);
		return volist;
	}
	
	public void insertClaimService(ClaimTable input, String user_id) {
		Connection conn = getConnection();
		new CerRequestDao().insertClaimDao(conn,input,user_id);
		close(conn);
	}
	
	public ReturnInfoVo selectReturnInfoService(String order_no, String user_id) {
		Connection conn = getConnection();
		ReturnInfoVo vo = (ReturnInfoVo) new CerRequestDao().selectReturnInfoDao(conn, order_no, user_id);
		close(conn);
		return vo;
	}
}
