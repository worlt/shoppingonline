package service;

import beans.User;
import dao.UserDao;
import dao.impl.UserDaoImpl;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    public User add (User user) {
        int add = userDao.add(user);
        if (add == 1) {
            User loginUser = login(user.getUname(), user.getPwd());
            return loginUser;
        } else {
            return null;
        }
    }

    public User login(String str, String pwd) {
        User user = userDao.findByStr(str);
        if (user.getPwd().equals(pwd)) {
            user.setPwd("******");
            return user;
        } else {
            return null;
        }
    }

    public List<User> findAll() {
        return userDao.findAll();
    }

    public User findById(int uid) {
        return userDao.findById(uid);
    }

    public boolean update(User user) {
        int update = userDao.update(user);
        if (update==1){
            return true;
        }
        return false;
    }

    public boolean del(int id) {
        int del = userDao.del(id);
        if (del==1){
            return true;
        }
        return false;
    }

    public boolean recharge(int uid, double amount) {
        User user = userDao.findById(uid);
        if (user != null) {
            user.setBalance(user.getBalance() + amount);
            int update = userDao.update(user);
            return update > 0;
        }
        return false;
    }

}
