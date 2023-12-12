package service;

import beans.Merchandise;

import java.util.List;

public interface MerchandiseService {
    //热卖商品id
    public List<Merchandise> findHot();

    //根据id查询商品详情
    public Merchandise findById(int mid);

    //根据关键字搜索
    public List<Merchandise> findByStr(String keyword);

    //查询所有商品
    public List<Merchandise> findAll();

    //查询商品的类型
    public List<Merchandise> findType(String type);

    //新增商品
    public boolean add(Merchandise merchandise);

    //修改
    public boolean update(Merchandise merchandise);

    //删除
    public boolean del(int mid);
}
