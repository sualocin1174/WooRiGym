package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static woorigym.common.jdbcTemplate.*;

import woorigym.user.model.dao.CouponDao;
import woorigym.user.model.vo.CouponTable;

public class CouponService {

	public CouponService() {
	}
	
	public ArrayList<CouponTable> couponListAll(String uid){
		Connection conn = getConnection();
		ArrayList<CouponTable> volist = new CouponDao().couponListAll(conn, uid);
		close(conn);
		return volist;
	}

}
