package woorigym.user.model.service;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.user.model.dao.CerRequestDao;
import woorigym.user.model.vo.AddressTable;

public class CerRequestService {

	public CerRequestService() {
	}

	public ArrayList<AddressTable> selectAddressService(String user_id){
		Connection conn = getConnection();
		 ArrayList<AddressTable> volist = ( ArrayList<AddressTable>) new CerRequestDao().selectAddressDao(conn, user_id);
		close(conn);
		return volist;
	}
}
