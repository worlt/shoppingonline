package service;

import beans.User;

import java.util.List;

public interface UserService {
    //注册用户
    public  User add(User user);

    /*
    根据用户名和密码登录
     */
    public User login(String str, String pwd);

    //
    public List<User> findAll();

    public User findById(int uid);


    public boolean update(User user);


    public boolean del(int id);

    boolean recharge(int uid, double amount);


}
