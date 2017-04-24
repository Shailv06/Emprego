package com.shail.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author SHAIL-PC
 */
public class DbUtil {

    private static Connection connection=null;
    
    public static Connection getConnection(){
        if(connection!=null)
            return connection;
        else{
            try{
                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/Emprego";
                String user = "root";
                Class.forName(driver);
                connection = DriverManager.getConnection(url,user,"");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();}
//            } catch (FileNotFoundException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
            return connection;
        }
    }
    
}
