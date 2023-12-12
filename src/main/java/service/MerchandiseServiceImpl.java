package service;

import beans.Merchandise;
import dao.impl.MerchandiseDaoImpl;
import dao.MerchandiseDao;

import java.util.List;

public class MerchandiseServiceImpl implements MerchandiseService {
    private MerchandiseDao merchandiseDao = new MerchandiseDaoImpl();
    public List<Merchandise> findHot() {
        return merchandiseDao.findHot();
    }

    public Merchandise findById(int mid) {
        return merchandiseDao.findById(mid);
    }

    public List<Merchandise> findByStr(String keyword) {
        return merchandiseDao.findByStr(keyword);
    }

    public List<Merchandise> findAll() {
        return merchandiseDao.findAll();
    }

    //查询商品的类型
    public List<Merchandise> findType(String type){ return merchandiseDao.findType(type);}

    public boolean add(Merchandise merchandise) {
        int num = merchandiseDao.add(merchandise);
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }

    public boolean update(Merchandise merchandise) {
        int num = merchandiseDao.update(merchandise);
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }

    public boolean del(int mid) {
        int num = merchandiseDao.del(mid);
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }
}
