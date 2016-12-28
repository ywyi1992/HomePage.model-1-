package bbs;

import java.sql.*;
import java.util.*;

import com.sun.org.apache.regexp.internal.recompile;

import Utility.DBClose;
import Utility.DBOpen;
import oracle.net.aso.b;

public class BbsDAO {
	public boolean checkRefno(int no) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refno) from bbs ");
		sql.append(" where refno=? ");
		try {
			p = c.prepareStatement(sql.toString());
			p.setInt(1, no);
			rs = p.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					f = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(c, p, rs);
		}
		return f;
	}

	public int total(String col, String word) {
		int total = 0;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;
		sql.append(" select count(*) from bbs ");
		if (word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'||?||'%' ");
		}

		try {
			p = c.prepareStatement(sql.toString());
			if (word.trim().length() > 0) {
				p.setString(1, word);
			}
			rs = p.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p, rs);
		}
		return total;
	}

	public void upansnum(Map p) {

		Connection c = DBOpen.open();
		PreparedStatement pr = null;
		StringBuffer sql = new StringBuffer();
		int grpno = (Integer) p.get("grpno");
		int ansnum = (Integer) p.get("ansnum");
		sql.append(" update bbs set ansnum=ansnum+1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
		try {
			pr = c.prepareStatement(sql.toString());
			pr.setInt(1, grpno);
			pr.setInt(2, ansnum);
			pr.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, pr);
		}

	}

	public boolean replycreate(BbsDTO dto) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into bbs (no,wname,title,content,passwd,wdate,grpno,indent,ansnum,refno,filename,filesize) ");
		sql.append(" values ((select nvl(max(no),0)+1 from bbs),?,?,?,?,sysdate,?,?,?,?,?,?) ");
		try {
			p = c.prepareStatement(sql.toString());
			p.setString(1, dto.getWname());
			p.setString(2, dto.getTitle());
			p.setString(3, dto.getContent());
			p.setString(4, dto.getPasswd());			
			p.setInt(5, dto.getGrpno());
			p.setInt(6, dto.getIndent() + 1);
			p.setInt(7, dto.getAnsnum() + 1);
			p.setInt(8, dto.getNo());
			p.setInt(10, dto.getFilesize());
			p.setString(9, dto.getFilename());
			int cnt = p.executeUpdate();
			if (cnt > 0)
				f = true;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p);
		}
		return f;

	}

	public BbsDTO replyread(int no) {
		BbsDTO dto = null;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		ResultSet r = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title , grpno , indent, ansnum from bbs");
		sql.append(" where no = ? ");

		try {
			p = c.prepareStatement(sql.toString());
			p.setInt(1, no);
			r = p.executeQuery();
			if (r.next()) {
				dto = new BbsDTO();
				dto.setNo(r.getInt("no"));
				dto.setTitle(r.getString("title"));
				dto.setGrpno(r.getInt("grpno"));
				dto.setIndent(r.getInt("indent"));
				dto.setAnsnum(r.getInt("ansnum"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p, r);
		}
		return dto;
	}

	public boolean delete(int no) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from bbs ");
		sql.append(" where no=? ");
		try {
			p = c.prepareStatement(sql.toString());
			p.setInt(1, no);
			int cnt = p.executeUpdate();
			if (cnt > 0) {
				f = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p);
		}

		return f;

	}

	public boolean passwdcheck(Map p) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement ps = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		int no = (Integer) p.get("no");
		String passwd = (String) p.get("passwd");
		sql.append(" select count(no) cnt from bbs ");
		sql.append(" where no=? and passwd=? ");
		try {
			ps = c.prepareStatement(sql.toString());
			ps.setInt(1, no);
			ps.setString(2, passwd);
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if (cnt > 0) {
				f = true;

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, ps, rs);
		}

		return f;
	}

	public boolean update(BbsDTO dto) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" update bbs set wname=?,title=?,content=? ");
		if(dto.getFilesize()>0){
			sql.append(" ,filename=?, ");
			sql.append(" filesize=? ");
		}
		sql.append(" where no = ? ");
		try {
			p = c.prepareStatement(sql.toString());
			int i=0;
			p.setString(++i, dto.getWname());
			p.setString(++i, dto.getTitle());
			p.setString(++i, dto.getContent());
			
			if(dto.getFilesize()>0){
			p.setString(++i, dto.getFilename());
			p.setInt(++i, dto.getFilesize());
			}
			
			p.setInt(++i, dto.getNo());
			int cnt = p.executeUpdate();
			if (cnt > 0) {
				f = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p);
		}

		return f;
	}

	public void upviewcnt(int no) {

		Connection con = DBOpen.open();

		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" update bbs ");

		sql.append(" set viewcnt = viewcnt + 1 ");

		sql.append(" where no = ? ");

		try {

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, no);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} finally {

			DBClose.close(con, pstmt);

		}

	}

	public BbsDTO read(int no) {
		BbsDTO dto = new BbsDTO();
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		ResultSet r = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select no,wname,title,content,to_char(wdate,'yyyy-mm-dd') wdate,viewcnt,filename,filesize from bbs ");
		sql.append(" where no = ? ");

		try {
			p = c.prepareStatement(sql.toString());
			p.setInt(1, no);
			r = p.executeQuery();
			if (r.next()) {
				dto.setNo(r.getInt("no"));
				dto.setWname(r.getString("wname"));
				dto.setTitle(r.getString("title"));
				dto.setContent(r.getString("content"));
				dto.setViewcnt(r.getInt("viewcnt"));
				dto.setWdate(r.getString("wdate"));
				dto.setFilename(r.getString("filename"));
				dto.setFilesize(r.getInt("filesize"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(c, p, r);
		}
		return dto;

	}

	public List<BbsDTO> list(Map p) {
		BbsDTO dto = null;
		List<BbsDTO> l = new ArrayList<BbsDTO>();
		Connection c = DBOpen.open();
		PreparedStatement pr = null;
		ResultSet r = null;
		StringBuffer sql = new StringBuffer();
		String col = (String) p.get("col");
		String word = (String) p.get("word");
		int ano = (Integer) p.get("ano");
		int bno = (Integer) p.get("bno");
		sql.append(" select no,wname,to_char(wdate,'yyyy-mm-dd') wdate,title,viewcnt,indent,filename,r ");
		sql.append(" from( ");
		sql.append(" 	select no,wname,wdate,title,viewcnt,indent,filename, rownum r ");
		sql.append(" 	from( ");
		sql.append(" 		select no,wname,wdate,title,viewcnt,indent,filename from bbs ");
		if (word.trim().length() > 0) {
			sql.append(" 	where " + col + " like '%'||?||'%' ");
		}
		sql.append(" 		order by grpno desc,ansnum asc ");
		sql.append(" ))where r>=? and r<=? ");
		try {

			pr = c.prepareStatement(sql.toString());
			int i = 0; // 참조값 선언
			if (word.trim().length() > 0) {
				pr.setString(++i, word);
			}

			pr.setInt(++i, ano);
			pr.setInt(++i, bno);
			r = pr.executeQuery();
			while (r.next()) {
				dto = new BbsDTO();
				dto.setNo(r.getInt("no"));
				dto.setWname(r.getString("wname"));
				dto.setWdate(r.getString("wdate"));
				dto.setTitle(r.getString("title"));
				dto.setViewcnt(r.getInt("viewcnt"));
				dto.setIndent(r.getInt("indent"));
				dto.setFilename(r.getString("filename"));
				l.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, pr, r);
		}
		return l;
	}

	public boolean create(BbsDTO dto) {
		boolean f = false;
		Connection c = DBOpen.open();
		PreparedStatement p = null;
		StringBuffer sql = new StringBuffer();
        sql.append(" insert into bbs(no,wname,title,content,passwd,wdate,grpno,filename,filesize) ");
        sql.append("  values((select nvl(max(no),0)+1 from bbs),?,?,?,?,sysdate,(select nvl(max(grpno),0)+1 from bbs),?,?) ");

		try {
			p = c.prepareStatement(sql.toString());
			p.setString(1, dto.getWname());
			p.setString(2, dto.getTitle());
			p.setString(3, dto.getContent());
			p.setString(4, dto.getPasswd());
			p.setString(5,dto.getFilename());
			p.setInt(6,dto.getFilesize());

			int cnt = p.executeUpdate();
			if (cnt > 0) {
				f = true;

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(c, p);
		}

		return f;
	}
}
