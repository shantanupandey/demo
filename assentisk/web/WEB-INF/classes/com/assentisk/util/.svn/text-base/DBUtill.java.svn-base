package com.assentisk.util;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

public class DBUtill {
	MysqlDataSource dataSource = null;


	public MysqlDataSource getDataSource(String dbname, String userName,
			String passWord, String url, String port) {
		dataSource = new MysqlDataSource();
		dataSource.setUser(userName);
		dataSource.setPassword(passWord);
		dataSource.setServerName(url);
		dataSource.setPort(Integer.parseInt(port));
		dataSource.setDatabaseName(dbname);
		return dataSource;
	}
}
