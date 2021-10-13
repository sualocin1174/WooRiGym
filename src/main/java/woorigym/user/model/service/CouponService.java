package woorigym.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static woorigym.common.jdbcTemplate.*;

import woorigym.user.model.dao.CouponDao;
import woorigym.user.model.vo.CouponTable;

public class CouponService {

	public CouponService() {
	}
	
	public ArrayList<CouponTable> couponListAll(String uid, String c_name, String c_discount, String c_issue_date, String c_expire_date){
		Connection conn = getConnection();
		ArrayList<CouponTable> volist = new CouponDao().couponListAll(conn, uid);
		close(conn);
		return volist;
	}

}
