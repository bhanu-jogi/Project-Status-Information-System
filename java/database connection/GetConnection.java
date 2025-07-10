package databaseconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class GetConnection {
	
	 	static Connection con=null;
		public static  Connection getConnection() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectstatus","root","root" );
			   
		} catch ( Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return con;
	}
}
