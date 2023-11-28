package dao.impl;

import beans.User;
import dao.UserDao;
import dbutils.DruidUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {

    private QueryRunner queryRunner = new QueryRunner(DruidUtils.getDataSource());

    public int add(User user) {
        // 获取数据库连接
        String sql = "SELECT COUNT(*) FROM user WHERE uname = ? OR phone = ?";
        Object[] params = {user.getUname(), user.getPhone()};
        try {
            Number count = queryRunner.query(sql, new ScalarHandler<Number>(), params);
            if (count.intValue() > 0) {
                // 用户名或手机号已存在，返回0表示重复插入失败
                return 0;
            } else {
                // 不存在重复记录，执行插入操作
                sql = "INSERT INTO user (uname, phone, pwd) VALUES (?, ?, ?)";
                params = new Object[]{user.getUname(), user.getPhone(), user.getPwd()};
                int update = queryRunner.update(sql, params);
                return update; // 返回插入结果
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //用关键字查找
    public User findByStr(String str) {
        //获取数据库连接
        String sql = "SELECT * FROM user WHERE uname = ? OR phone = ?";
        Object[] params = {str, str}; // 假设str是name或phone的实际值
        try {
            User user = queryRunner.query(sql, new BeanHandler<User>(User.class), params);
            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //查找所有
    public List<User> findAll() {
        String sql = "select * from user";
        try {
            List<User> userList = queryRunner.query(sql, new BeanListHandler<User>(User.class));
            return userList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //id查找
    public User findById(int id) {
        String sql = "select * from user where id = ?";
        Object[] params = {id};
        try {
            User user = queryRunner.query(sql, new BeanHandler<User>(User.class), params);
            return user;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 更新
    public int update(User user) {
        String sql = "update user set uname=?, phone=?, pwd=?, balance=?, address=? where id=?";
        Object[] params = {user.getUname(), user.getPhone(), user.getPwd(), user.getBalance(), user.getAddress(), user.getId()};
        try {
            int update = queryRunner.update(sql, params);
            return update;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //删除
    public int del(int id) {
        String sql = "delete from user where id = ?";
        Object[] params = {id};
        try {
            int update = queryRunner.update(sql, params);
            return update;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
