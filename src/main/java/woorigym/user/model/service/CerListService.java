package woorigym.user.model.service;

import static woorigym.common.jdbcTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import woorigym.user.model.dao.CerListDao;
import woorigym.user.model.vo.CerList;

public class CerListService {

	public CerListService() {
	}
	public ArrayList<CerList> readCerListPeriod(String uid, String startDate, String endDate) {
		Connection conn = getConnection();
		ArrayList<CerList> volist = (ArrayList<CerList>) new CerListDao().readCerListPeriod(conn, uid, startDate, endDate);
		close(conn);
		
		return volist;
	}
	public int getCerCount(String uid){
		int result = 0; //0이든 -1이든 어차피 못 읽어오는거 똑같다. 0,1 둘 다 사용가능!!
		Connection conn = getConnection();
		result = new CerListDao().getCerCount(conn,uid); //result = 빼먹어서 result가 0이 되는 바람에 오류났었음.
		close(conn);
		return result;
	}
	
	public ArrayList<CerList> selectCerList(String uid, int start, int end){
		ArrayList<CerList> result = new ArrayList() ; //0이든 -1이든 어차피 못 읽어오는거 똑같다. 0,1 둘 다 사용가능!!
		Connection conn = getConnection();
		result = new CerListDao().selectCerList(conn,uid, start, end);
		close(conn);
		return result;
		
	}
	
	
	
	
}
