package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Utility.DBClose;
import Utility.DBOpen;


public class AddressDAO {
	public boolean delete(int no){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" delete from address ");
		sql.append(" where no = ? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, no);
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
	public boolean update(AddressDTO dto){
		boolean flag= false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql= new StringBuffer();
		sql.append(" update address set phone=?,address=?,address1=?,zipcode=? ");
		sql.append(" where no =?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getPhone());
			pstmt.setString(2,dto.getAddress());
			pstmt.setString(3,dto.getAddress1());
			pstmt.setString(4,dto.getZipcode());
			pstmt.setInt(5,dto.getNo());
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
	
	
	

	public AddressDTO read(int no){
		AddressDTO dto=new AddressDTO();
		Connection con= DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from address ");
		sql.append(" where no=? ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress1(rs.getString("address1"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setWdate(rs.getString("wdate"));
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		return dto;
	}
	public int total(String col, String word){
		int total=0;
		Connection con= DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sql =new StringBuffer();
		sql.append(" select count(*)  from address ");
		if(word.trim().length()>0){
		sql.append(" where "+col+" like '%'||?||'%' ");
		}
		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
				pstmt.setString(1,word);
			}
			rs=pstmt.executeQuery();
			if(rs.next()){
				total=rs.getInt(1);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	
public List<AddressDTO> list(Map p){
	List<AddressDTO> list= new ArrayList<AddressDTO>();
	Connection con=DBOpen.open();
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    int ano=(Integer) p.get("ano");
    int bno=(Integer) p.get("bno");
    String col = (String) p.get("col");
    String word = (String) p.get("word");
    StringBuffer sql=new StringBuffer();
    sql.append(" select no,name,phone,to_char(wdate,'yyyy-mm-dd') wdate,r from( ");
    sql.append(" select no,name,phone,wdate,rownum r from( ");
    sql.append(" select no,name,phone,wdate from address  ");
    if(word.trim().length()>0){
    	sql.append(" where "+col+" like '%'||?||'%' ");	
    }
    
    sql.append(" order by no desc  ");
    sql.append(" ))where r>=? and r<=? ");
    
	try {
		int i=1;
		pstmt=con.prepareStatement(sql.toString());
		if(word.trim().length()>0){
		pstmt.setString(i++,word);
		}
		pstmt.setInt(i++,ano );
		pstmt.setInt(i++,bno );
		rs=pstmt.executeQuery();
		while(rs.next()){
			AddressDTO dto=new AddressDTO();
			dto.setNo(rs.getInt("no"));
			dto.setName(rs.getString("name"));
			dto.setPhone(rs.getString("phone"));
			dto.setWdate(rs.getString("wdate"));
		list.add(dto);
		}
		
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		DBClose.close(con, pstmt, rs);
	}
	
	return list;
	
}

public boolean create(AddressDTO adto){
	boolean flag=false;
    Connection con=DBOpen.open();
    PreparedStatement pstmt=null;
    StringBuffer sql=new StringBuffer();
    sql.append(" insert into address(no,name,phone,address,address1,zipcode,wdate) ");
    sql.append(" values ((select nvl(max(no),0)+1 from address),?,?,?,?,?,sysdate) ");
    
    try {
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1,adto.getName());
		pstmt.setString(2,adto.getPhone());
		pstmt.setString(3,adto.getAddress());
		pstmt.setString(4,adto.getAddress1());
		pstmt.setString(5,adto.getZipcode());
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
