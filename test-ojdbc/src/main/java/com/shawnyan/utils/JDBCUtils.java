package com.shawnyan.utils;

import java.sql.*;


/**
 * Created by SHAWN on 9/9/2017.
 */
public class JDBCUtils {

    // The connect string
    private static final String driver = "oracle.jdbc.driver.OracleDriver";
    //    private static final String driver = "oracle.jdbc.replay.OracleDataSourceImpl";
    private static final String url = "jdbc:oracle:thin:@vm151:1521:XE";
    private static final String username = "SHAWN";
    private static final String password = "SHAWN";

    // The query we will execute
    static final String sql = "SELECT 'Hello JDBC: ' || sysdate FROM dual";

    /**
     * 获取数据库连接
     *
     * @return
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(driver); // 注册
            conn = DriverManager.getConnection(url, username, password);
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 测试Oracle连接是否成功
    public static void main(String[] args) {
        Connection conn = JDBCUtils.getConnection();
        System.out.println("连接成功：" + conn);
    }


}
