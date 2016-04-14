package org.dao;

/**
 * Created by wcy on 2016/4/9.
 */
import java.sql.*;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.model.*;
import org.db.*;
public class SigninDao {
    Connection conn;
    public user checkUser(String username,String password){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("select * from [userInfo] where username=?"+" and password=?");
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                user signin=new user();
                signin.setId(rs.getString(1));
                signin.setUsername(rs.getString(2));
                signin.setPassword(rs.getString(3));
                return signin;
            }
            return null;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            DBconn.CloseConn();
        }
    }
    public boolean insertUser(String id,String username,String password){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("select * from [userInfo] where id=?"+" or username=?");
            ps.setString(1,id);
            ps.setString(2,username);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return false;
            }
            PreparedStatement ps1=conn.prepareStatement("insert into [userInfo] values (?,?,?)");
            ps1.setString(1,id);
            ps1.setString(2,username);
            ps1.setString(3,password);
            ps1.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBconn.CloseConn();
        }
    }
    public boolean deleteUser(String id){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("select * from [userInfo] where id=?");
            ps.setString(1,id);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                PreparedStatement ps1=conn.prepareStatement("delete  from [userInfo] where id=?");
                ps1.setString(1,id);
                ps1.executeUpdate();
                return true;
            }
            return false;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBconn.CloseConn();
        }
    }
    public boolean insertProduct(String id,String productCode,String productName,int productSource){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("insert into [productTable] values (?,?,?,?)");
            ps.setString(1,id);
            ps.setString(2,productCode);
            ps.setString(3,productName);
            ps.setInt(4,productSource);
            ps.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBconn.CloseConn();
        }
    }
    public boolean deleteProduct(String id){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("delete from [productTable] where id=?");
            ps.setString(1,id);
            ps.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            DBconn.CloseConn();
        }
    }
    public void updateShop(String userId,String productId){
        try{
            conn=DBconn.getConn();
            PreparedStatement ps=conn.prepareStatement("select * from [shopRecords] where userId=?"+" and productId=?");
            ps.setString(1,userId);
            ps.setString(2,productId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                ps=conn.prepareStatement("update [shopRecords] set productNumber=productNumber+1 " +
                        "where userId=?"+" and productId=?");
                ps.setString(1,userId);
                ps.setString(2,productId);
                ps.executeUpdate();
            }
            else{
                ps=conn.prepareStatement("insert into [shopRecords] values (?,?,?,?,getDate())");
                ps.setString(1,productId);
                ps.setString(2,userId);
                ps.setString(3,productId);
                ps.setInt(4,1);
                ps.executeUpdate();
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            DBconn.CloseConn();
        }
    }
}
