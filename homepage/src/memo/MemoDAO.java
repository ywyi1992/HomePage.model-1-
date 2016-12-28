package memo;
import Utility.DBOpen;
import Utility.DBClose;
import java.util.*;

import com.sun.org.apache.regexp.internal.recompile;

import java.sql.*;

public class MemoDAO {
	public int total(String col, String word){
		int total=0;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) from memo ");
	   if(word.trim().length()>0){
		sql.append(" where "+col+" like '%'||?||'%' ");
		
	   }
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
				pstmt.setString(1,word );
			}
				rs=pstmt.executeQuery();
              if( rs.next()){
             total=  rs.getInt(1);
             			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt,rs);
		}
		

		
		
		return total;
		
	}
	
	public void upviewcnt(int memono){
	  Connection con=DBOpen.open();
	  StringBuffer sql=new StringBuffer();
	  PreparedStatement pstmt=null;
	  sql.append(" update memo set viewcnt = viewcnt+1 ");
	  sql.append(" where memono=? ");
	  try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, memono);
		pstmt.executeQuery();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}finally {
		DBClose.close(con, pstmt);
	}
	}

	public List<MemoDTO> list(Map p) {
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		Connection con =DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col=(String) p.get("col");
		String word=(String) p.get("word");
		int ano=(Integer)p.get("ano");
		int bno=(Integer)p.get("bno");
		StringBuffer sql = new StringBuffer();	   
		sql.append(" select memono,title,to_char(wdate,'yyyy-mm-dd') wdate,viewcnt,r from ( ");
		sql.append(" select memono,title,wdate,viewcnt,rownum r ");
		sql.append(" from( ");
		sql.append(" select memono,title,wdate,viewcnt from memo ");
		if(word.trim().length()>0){
		sql.append(" where "+col+" like '%'||?||'%' ");
		}
		sql.append(" order by memono desc ");
		sql.append(" ))where r>=? and r<=? ");
        try {
			pstmt=con.prepareStatement(sql.toString());
			int i=0;
			if(word.trim().length()>0){
			pstmt.setString(++i,word);
			}
			pstmt.setInt(++i,ano);
			pstmt.setInt(++i,bno);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				MemoDTO dto=new MemoDTO();
		        dto.setMemono(rs.getInt("memono"));
		        dto.setTitle(rs.getString("title"));
		        dto.setWdate(rs.getString("wdate"));
		        dto.setViewcnt(rs.getInt("viewcnt"));
		       list.add(dto);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
return list;
	}
	public boolean delete(int memono){
		boolean flag=false;
	   Connection con=DBOpen.open();
	   PreparedStatement pstmt=null;
	   StringBuffer sql=new StringBuffer();
	   sql.append(" delete from memo ");
	   sql.append(" where memono=? ");
	   
	   try {
		pstmt=con.prepareStatement(sql.toString());
        pstmt.setInt(1, memono);
        int cnt=pstmt.executeUpdate();
        if(cnt>0){
        	flag=true;
        }
	   } catch (SQLException e) {
		
		e.printStackTrace();
	}
		
		
		return flag;
		
	}
	public boolean update(MemoDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" update memo set title=?,content=? ");
		
		sql.append(" where memono=? ");
	
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2,dto.getContent());
			pstmt.setInt(3,dto.getMemono());
			int cnt=pstmt.executeUpdate();
			if(cnt>0){
				flag=true;
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
	
	public MemoDTO read(int memono){
		MemoDTO dto=null;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" select memono,title,content,to_char(wdate,'yyyy-mm-dd') wdate,viewcnt from memo ");
		sql.append(" where memono=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,memono);
			rs=pstmt.executeQuery();
			if(rs.next()){
			dto=new MemoDTO();
			dto.setMemono(rs.getInt("memono"));
			dto.setContent(rs.getString("content"));
			dto.setTitle(rs.getString("title"));
			dto.setWdate(rs.getString("wdate"));
			dto.setViewcnt(rs.getInt("viewcnt"));
				
			}
			
			
			
		} catch (SQLException e) {
					e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	
	
public boolean create(MemoDTO dto){
	boolean flag=false;
	Connection con=DBOpen.open();
	PreparedStatement  pstmt=null;
	StringBuffer sql=new StringBuffer();
	sql.append(" insert into memo(memono,title,content,wdate) ");
	sql.append(" values ((select nvl(max(memono),0)+1 from memo),?,?,sysdate)  ");
	try {
		pstmt= con.prepareStatement(sql.toString());
		pstmt.setString(1,dto.getTitle());
		pstmt.setString(2,dto.getContent());
		int cnt=pstmt.executeUpdate();
		if(cnt>0){
		flag=true;	
		}
	} catch (SQLException e) {

		e.printStackTrace();
	}finally {
	      DBClose.close(con, pstmt);
	}
return flag;
}


}
