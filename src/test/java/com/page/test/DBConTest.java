package com.page.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class DBConTest {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void connTest() {
		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", 
				"exam", 
				"1340")){
			System.out.println(conn);
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}

}
