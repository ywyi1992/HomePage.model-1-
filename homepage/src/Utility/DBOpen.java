package Utility;
import java.sql.*;
public class DBOpen {


public static Connection open(){
	Connection con=null;

	try {
		Class.forName(Constant.driver);
		try {
			con=DriverManager.getConnection(Constant.url,Constant.user,Constant.password);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
 catch (Exception e) {
	
	e.printStackTrace();
}

	return con;
}

}
