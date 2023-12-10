package service;

import beans.Cart;
import beans.Merchandise;
import beans.User;
import dao.CartDao;
import dao.MerchandiseDao;
import dao.UserDao;
import dao.impl.CartDaoImpl;
import dao.impl.MerchandiseDaoImpl;
import dao.impl.UserDaoImpl;

import java.util.ArrayList;
import java.util.List;

public class CartServiceImpl implements CartService {
    private UserDao userDao = new UserDaoImpl();

    private CartDao cartDao = new CartDaoImpl();
    private MerchandiseDao merchandiseDao = new MerchandiseDaoImpl();


    public boolean add(int uid, Cart cart) {
        int add = cartDao.add(uid, cart);
        if (add == 1) {
            return true;
        }
        return false;
    }

    public boolean update(int uid, Cart cart) {
        int update = cartDao.update(uid, cart);
        if (update == 1) {
            return true;
        }
        return false;
    }

    public boolean del(int uid, int mid) {
        int del = cartDao.del(uid, mid);
        if (del == 1) {
            return true;
        }
        return false;
    }

    public Cart find(int uid, int mid) {
        return cartDao.find(uid, mid);
    }

    public List<Cart> findByUid(int uid) {
        return cartDao.findByUid(uid);
    }

    public List<Cart> findCartByUid(int uid) {
        return cartDao.findCartByUid(uid);
    }

    //显示列表根据boolean值来确定显示购物车列表还是关注列表
    public List<Merchandise> show(int uid, boolean flag) {
        List<Cart> carts = findByUid(uid);
        List<Merchandise> merchandises = new ArrayList<Merchandise>();
        if (flag) {//那么返回购物车列表
            for (Cart cart : carts) {
                if (cart.isCart()) {
                    Merchandise merchandise = merchandiseDao.findById(cart.getMid());
                    merchandises.add(merchandise);
                }
            }
        } else {//返回我的关注列表
            for (Cart cart : carts) {
                if (cart.isStar()) {
                    Merchandise merchandise = merchandiseDao.findById(cart.getMid());
                    merchandises.add(merchandise);
                }
            }
        }
        return merchandises;
    }

    @Override
    public boolean checkout(int uid, double money) {
        User user = userDao.findById(uid);
        double balance = user.getBalance() - money;
        if (balance >= 0){
            // 更新用户余额
            user.setBalance(balance);
            int update = userDao.update(user);
            return update > 0;
        }
        return false;
    }

    public int delAll(int uid){
        return cartDao.delAll(uid);
    }

}

