package com.dn.statics;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Mysql1 {
    static final String configFile = "c3p0.properties";
    private static ComboPooledDataSource ds;
    //private static int i =1;
	/** * 初始化连接池代码块 */
	private static class SingletonHolder {
		static Mysql1 instance = new Mysql1();
	}

    /**
	 * 得到一个连接池实例
	 * 
	 * @return 
	 */
	public static Mysql1 getInstance() {
		return SingletonHolder.instance;
	}

	/**
     * 初始化连接池配置
     */
    public Mysql1() {
    	 ds = new ComboPooledDataSource();
		try {
		    ds.setDriverClass(property.readRcErpURL("driverClass"));
		} catch (PropertyVetoException e) {
		    e.printStackTrace();
		}
		ds.setJdbcUrl(property.readRcErpURL("jdbcUrl"));
		ds.setUser(property.readRcErpURL("user"));
		ds.setPassword(property.readRcErpURL("password"));
		ds.setInitialPoolSize(Integer.parseInt(property.readRcErpURL("initialPoolSize")));
		ds.setMaxPoolSize(Integer.parseInt(property.readRcErpURL("maxPoolSize")));
		ds.setMinPoolSize(Integer.parseInt(property.readRcErpURL("minPoolSize")));
		ds.setAcquireIncrement(Integer.parseInt(property.readRcErpURL("acquireIncrement")));
		ds.setAutoCommitOnClose(Boolean.parseBoolean((property.readRcErpURL("autoCommitOnClose").toString())));
		ds.setMaxIdleTime(Integer.parseInt(property.readRcErpURL("maxIdleTime")));
		ds.setAcquireRetryDelay(Integer.parseInt(property.readRcErpURL("acquireRetryDelay")));
		ds.setBreakAfterAcquireFailure(Boolean.parseBoolean((property.readRcErpURL("breakAfterAcquireFailure").toString())));
		ds.setCheckoutTimeout(Integer.parseInt(property.readRcErpURL("checkoutTimeout")));
		ds.setIdleConnectionTestPeriod(Integer.parseInt(property.readRcErpURL("idleConnectionTestPeriod")));
		ds.setNumHelperThreads(Integer.parseInt(property.readRcErpURL("numHelperThreads")));
		ds.setPropertyCycle(Integer.parseInt(property.readRcErpURL("propertyCycle")));
		ds.setMaxStatements(Integer.parseInt(property.readRcErpURL("maxStatements")));
		ds.setDebugUnreturnedConnectionStackTraces(true);
    }

	/**
	 * 获得一个连接
	 * 
	 * @return 
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
			//System.out.println(i++);
			return ds.getConnection();
	}
	
}