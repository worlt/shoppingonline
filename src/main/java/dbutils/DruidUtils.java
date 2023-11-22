package dbutils;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.util.DruidWebUtils;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DruidUtils {
    //声明一个数据库连接池对象
    private static DruidDataSource dataSource;

    static {
        Properties properties = new Properties();
        InputStream is = DruidWebUtils.class.getResourceAsStream("/druid.properties");
        try {
            properties.load(is);
            //初始化数据源
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    //获取数据源
    public static DataSource getDataSource(){
        return dataSource;
    }



    //获取数据库连接
    public static Connection getConn() {
        try {
            Connection connection = (Connection) dataSource.getConnection();
            return connection;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //关闭资源
    public static void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs){
        if (rs != null){
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (pstmt != null){
            try {
                pstmt.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        if (conn != null){
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
