package member;

import java.util.*;

import Utility.DBClose;
import Utility.DBOpen;

import java.sql.*;

public class MemberDAO {
	public boolean login(String id, String passwd) {
		boolean flag = false;	
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		sql.append(" where id=? ");
		sql.append(" and passwd=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,passwd);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int cnt=rs.getInt(1);
				if(cnt>0){
					flag=true;
				}
			}		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		return flag;
	}

	public String getGrade(String id) {
         String grade=null;     
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade from member ");
	sql.append(" where id=? ");	
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				grade=rs.getString("grade");
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
        		  return grade;
	}

	public boolean pwupdate(String id, String passwd) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member set passwd=? ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean updateFile(String id, String fname) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member set fname=? ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,mname,tel,email,zipcode,address1,address2,job,mdate,fname ");
		sql.append(" from member ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from member ");
		if (word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%' ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return total;
	}

	public boolean update(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member set tel=?,email=?,job=? ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getJob());

			pstmt.setString(4, dto.getId());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public boolean duplicateId(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) from member ");
		sql.append(" where id=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}

	public boolean duplicateEmail(String email) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(email) from member ");
		sql.append(" where email=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}

	public boolean create(MemberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(
				" insert into member(id, passwd,mname, tel ,email,zipcode,address1, address2,job, mdate,fname,grade ) ");
		sql.append(" values (?,?,?,?,?,?,?,?,?,sysdate,?,'H') ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public List<MemberDTO> list(Map p) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		String col = (String) p.get("col");
		String word = (String) p.get("word");
		int ano = (Integer) p.get("ano");
		int bno = (Integer) p.get("bno");
		sql.append(" select id,mname,tel,to_char(mdate,'yyyy-mm-dd') mdate,fname,job,email,passwd,r ");
		sql.append("  from(  ");
		sql.append(" select id,mname,tel,mdate,fname,job,email,passwd,rownum r ");
		sql.append(" from( ");
		sql.append(" select id,mname,tel,mdate,fname,job,email,passwd from member ");
		if (word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%' ");
		}
		sql.append(" order by id asc ");
		sql.append(" ) ");
		sql.append(" )where r>=? and r<=? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if (word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, ano);
			pstmt.setInt(++i, bno);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("Mname"));
				dto.setTel(rs.getString("tel"));
				dto.setMdate(rs.getString("Mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setJob(rs.getString("job"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				list.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from member ");
		sql.append(" where id = ?  ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
}
