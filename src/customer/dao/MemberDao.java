package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import customer.db.DBCon;
import customer.vo.Member;

public class MemberDao {
	public Member getMember(String uid) throws Exception {//void를 Member로 수정
		
		String sql="select * from member where id=?";
		
		Connection con=DBCon.getConnection();
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		ResultSet rs=pstmt.executeQuery();
		
		Member m=null; //이걸 이렇게 밖으로 빼야 리턴 m 오류안남
		if(rs.next()) {
			m=new Member();
			m.setId(rs.getString("id"));
			m.setPwd(rs.getString("pwd"));
			System.out.println("m.id : " +m.getId());
		}
		
		return m; 
		
	}
}
