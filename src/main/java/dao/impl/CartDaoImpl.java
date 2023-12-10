package dao.impl;

import beans.Cart;
import dao.CartDao;
import dbutils.DruidUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CartDaoImpl implements CartDao {
    private QueryRunner queryRunner = new QueryRunner(DruidUtils.getDataSource());
    public int add(int uid, Cart cart) {
        String sql = "INSERT INTO shop(uid,mid,isStar,isCart) VALUES (?,?,?,?);";
        Object[] params = {uid,cart.getMid(),cart.isStar(),cart.isCart()};
        try {
            int add = queryRunner.update(sql, params);
            return add;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //更新
    public int update(int uid, Cart cart) {
        String sql = "UPDATE shop SET isStar=?,isCart=? WHERE mid=? AND uid=?;";
        Object[] params = {cart.isStar(),cart.isCart(),cart.getMid(),uid};
        try {
            int update = queryRunner.update(sql, params);
            return update;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //删除
    public int del(int uid, int mid) {
        String sql = "delete from shop where mid=? and uid=?";
        Object[] params = {mid,uid};
        try {
            int del = queryRunner.update(sql, params);
            return del;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Cart find(int uid, int mid) {
        String sql  ="SELECT * FROM shop WHERE uid = ? AND mid = ?;";
        Object[] params = {uid,mid};
        try {
            Cart cart = queryRunner.query(sql, new BeanHandler<Cart>(Cart.class), params);
            return cart;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //根据uid查询购物车列表或者关注列表
    public List<Cart> findByUid(int uid) {
        String sql = "SELECT * FROM shop WHERE uid=?;";
        Object[] params = {uid};
        try {
            List<Cart> cartList = queryRunner.query(sql, new BeanListHandler<Cart>(Cart.class), params);
            return cartList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //根据uid查询购物车列表
    public List<Cart> findCartByUid(int uid) {
        String sql = "SELECT * FROM shop WHERE uid=? and isCart=1;";
        Object[] params = {uid};
        try {
            List<Cart> cartList = queryRunner.query(sql, new BeanListHandler<Cart>(Cart.class), params);
            return cartList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public int delAll(int uid) {
        String sql = "UPDATE shop SET isCart = 0 WHERE uid = ?";
        Object[] params = {uid};
        try {
            int del = queryRunner.update(sql, params);
            return del;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
