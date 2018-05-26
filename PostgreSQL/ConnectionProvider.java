/****************************************************************************
CSE532 -- Project 2
File name: ConnectionProvider.java
Author(s): Siddharth Jain (111425239)
           Shubham Kumar Jain (111482623)

Brief description: File establishing the connection with the database.

We, pledge our honor that all parts of this project were done by us alone and without 
collaboration with anybody else.
****************************************************************************/

package com.woco;
import java.sql.*;
public class ConnectionProvider implements Provider {
	
	static Connection con=null;
	
	public static Connection getCon() {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			con=DriverManager.getConnection(connURL,username,pwd);
			if(con != null) {System.out.println("Connected");}
			
		}
		catch(Exception ex){
			ex.printStackTrace();
			System.out.println("yo");
		}
		return con;
	}
}
