package util;

import java.sql.*;

public class DBConn {
    static String url = "jdbc:postgresql://localhost:5432/dpidms01";
    static String user = "idms";
    static String pwd = "idms";
    static{
        try{
            Class.forName("org.postgresql.Driver");
        }catch(Exception ex){
            ex.printStackTrace();
        }

    }

    public static Connection getConn(){
        try{
            Connection conn =
                    DriverManager.getConnection(url, user, pwd);
            return conn;
        }catch(Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
    public static void close(Connection conn,Statement st,ResultSet rs){
        if (rs != null) {
            try{
                rs.close();
            }catch(SQLException ex){
            }
       }
       if(st!=null){
           try {
               st.close();
           }catch(Exception ex){
           }
       }
       if(conn!=null){
           try{
               conn.close();
           }catch(Exception ex){
           }
       }
    }

}
