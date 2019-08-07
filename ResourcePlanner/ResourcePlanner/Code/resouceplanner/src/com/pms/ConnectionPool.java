
package com.pms;
import java.sql.Connection;
import java.sql.SQLException;
import com.pms.ConnectionPool;

public class ConnectionPool  {

 public ConnectionPool() {
	super();
 }
 private static Connection con=null;
 public static Connection getConnection()
 {
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = java.sql.DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "pms", "pms");
		if (con != null) {
			System.out.println("Connection Pool Database Connection Success");
		}
	}
	catch(final ClassNotFoundException cfe)
	{
		
	}catch(final SQLException se)
	{
		System.out.println(se.getMessage());
	}
	return con;
	}
	public static void main(String[] args) {
		Connection con=ConnectionPool.getConnection();
		System.out.println("Connection Object:"+con);
	}
}

