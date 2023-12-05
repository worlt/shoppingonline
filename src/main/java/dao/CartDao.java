package dao;

import beans.Cart;

import java.util.List;

public interface CartDao {


    //添加购物车
    public int add(int uid, Cart cart);

    //
    public int update(int uid,Cart cart);

    //
    public int del(int uid,int mid);

    //查询是否已存在
    public Cart find(int uid,int mid);

    //根据uid查询购物车列表或者关注列表
    public List<Cart> findByUid(int uid);

    //根据uid查询购物车列表
    public List<Cart> findCartByUid(int uid);

}
