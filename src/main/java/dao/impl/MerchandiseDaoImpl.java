package dao.impl;

import beans.Merchandise;
import dao.MerchandiseDao;
import dbutils.DruidUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import java.sql.SQLException;
import java.util.List;

public class MerchandiseDaoImpl implements MerchandiseDao {
    private QueryRunner queryRunner = new QueryRunner(DruidUtils.getDataSource());
    // 热卖商品id
    public List<Merchandise> findHot() {
        String sql = "select t2.* from hotmerchandise t1, merchandise t2 where t1.mid = t2.mid;";
        try {
            List<Merchandise> merchandiseList = queryRunner.query(sql, new BeanListHandler<Merchandise>(Merchandise.class));
            return merchandiseList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 根据id查询商品详情
    public Merchandise findById(int mid) {
        String sql = "select * from merchandise where mid = ?";
        Object[] params = {mid};
        try {
            Merchandise merchandise = queryRunner.query(sql, new BeanHandler<Merchandise>(Merchandise.class), params);
            return merchandise;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //根据关键字搜索
    public List<Merchandise> findByStr(String keyword) {
        String sql = "SELECT * FROM merchandise WHERE mname LIKE ?;";
        Object[] params = {"%" + keyword + "%"};
        try {
            List<Merchandise> merchandises = queryRunner.query(sql, new BeanListHandler<Merchandise>(Merchandise.class), params);
            return merchandises;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //查询所有
    public List<Merchandise> findAll() {
        String sql = "select * from merchandise;";
        List<Merchandise> merchandiseList = null;
        try {
            merchandiseList = queryRunner.query(sql, new BeanListHandler<Merchandise>(Merchandise.class));
            return merchandiseList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //查询商品的类型
    public List<Merchandise> findType(String type) {
        String sql = "SELECT * FROM merchandise WHERE type = ?";
        List<Merchandise> merchandiseList = null;
        try {
            merchandiseList = queryRunner.query(sql, new BeanListHandler<Merchandise>(Merchandise.class), type);
            return merchandiseList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //添加商品
    public int add(Merchandise Merchandise) {
        String sql = "INSERT INTO merchandise(mid, mname, mprice, intro, tips, inum, stock) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Object[] params = {Merchandise.getMid(),Merchandise.getMname(),Merchandise.getMprice(),Merchandise.getIntro(), Merchandise.getTips(),Merchandise.getInum(), Merchandise.getStock()};
        try {
            int add = queryRunner.update(sql,params);
            return add;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //修改商品
    public int update(Merchandise Merchandise) {

        String sql = "UPDATE merchandise SET  mname=?, mprice=?, intro=?, tips=?, inum=?, stock=? WHERE mid = ?;";
        Object[] params = {Merchandise.getMname(),Merchandise.getMprice(),Merchandise.getIntro(), Merchandise.getTips(),Merchandise.getInum(),Merchandise.getMid(), Merchandise.getStock()};
        try {
            int update = queryRunner.update(sql,params);
            return update;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //删除商品
    public int del(int mid) {
        String sql = "delete from merchandise WHERE mid = ?;";
        Object[] params = {mid};
        try {
            int del = queryRunner.update(sql,params);
            return del;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
