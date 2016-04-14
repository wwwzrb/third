package org.db;
import java.sql.*;
/**
 * Created by wcy on 2016/4/9.
 */
public class DBconn {
    public static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;" + "databaseName=SHOPDB;user=third;password=13121070";
            conn = DriverManager.getConnection(url);
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static void CloseConn(){
        try{
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

