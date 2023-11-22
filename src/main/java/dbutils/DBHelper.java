package dbutils;//package dbutils;
//
//import java.sql.*;
//
//public class DBHelper {
//    private static Connection conn = null;
//    public final static String DRIVER = "com.mysql.cj.jdbc.Driver";//数据库驱动类
//    public final static String URL = "jdbc:mysql://localhost:3306/shoe?useSSL=false&serverTimezone=UTC";
//    public final static String DBUser = "root";
//    public final static String DBPassword = "20539";
//
//    public static Connection getConn(){
//        try {
//            Class.forName(DRIVER);
//            conn = DriverManager.getConnection(URL,DBUser,DBPassword);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//        return conn;
//    }
//
//    //关闭资源
//    public static void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs){
//        if (rs != null){
//            try {
//                rs.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
//        if (pstmt != null){
//            try {
//                pstmt.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
//        if (conn != null){
//            try {
//                conn.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
//    }
//}
//
