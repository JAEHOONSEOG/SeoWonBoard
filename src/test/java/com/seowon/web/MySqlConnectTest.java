package com.seowon.web;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class MySqlConnectTest {
	
	private static final String Driver =
			"com.mysql.cj.jdbc.Driver";
	private static final String URL =
			"jdbc:mysql://127.0.0.1:3306/seowonhm?serverTimezone=JST";
	private static final String USER =
			"seowon";
	private static final String PW =
			"jaehoon89?";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(Driver);
		
		try (Connection con = DriverManager.getConnection(URL, USER, PW)){
			System.out.println(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
