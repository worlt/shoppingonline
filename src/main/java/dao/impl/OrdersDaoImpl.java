package dao.impl;

import beans.Cart;
import beans.Orders;
import dao.OrdersDao;
import dbutils.DruidUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class OrdersDaoImpl implements OrdersDao {
    private QueryRunner queryRunner = new QueryRunner(DruidUtils.getDataSource());
    @Override
    public int add( int uid, int mid, String mname, int quantity) {
        String sql = "insert into orders(uid,mid,mname,quantity) values(?,?,?,?)";
        Object [] params = {uid,mid,mname,quantity};
        try {
            int update = queryRunner.update(sql,params);
            return update;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //查询用户订单
    public List<Orders> findByUid(int uid) {
        String sql = "SELECT * FROM orders WHERE uid=?;";
        Object[] params = {uid};
        try {
            List<Orders> ordersList = queryRunner.query(sql, new BeanListHandler<Orders>(Orders.class), params);
            return ordersList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
