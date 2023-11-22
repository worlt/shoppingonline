package dao;

import beans.User;

import java.util.List;

public interface UserDao {
    //添加用户
    public int add(User user);

    //根据条件查询
    public User findByStr(String str);

    //获取用户列表
    public List<User> findAll();

    //根据用户id查询
    public User findById(int id);

    //更新
    public int update(User user);

    //删除
    public int del(int id);


}
