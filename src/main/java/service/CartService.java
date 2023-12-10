package service;

import beans.Cart;
import beans.Merchandise;

import java.util.List;

public interface CartService {
    //添加购物车
    public boolean add(int uid, Cart cart);

    //
    public boolean update(int uid,Cart cart);

    //
    public boolean del(int uid,int mid);

    //查询是否已存在
    public Cart find(int uid,int mid);

    //根据uid查询购物车列表或者关注列表
    public List<Cart> findByUid(int uid);

    //根据uid查询购物车列表
    public List<Cart> findCartByUid(int uid);

    //显示列表根据boolean值来确定显示购物车列表还是关注列表
    public List<Merchandise> show(int uid, boolean flag);

    //结算
    public boolean checkout(int uid,double money);

    public int delAll(int uid);

}
