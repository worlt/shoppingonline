package dao;

import beans.Orders;

import java.sql.Date;
import java.util.List;

public interface OrdersDao {
    public int add(/*int oid,*/ int uid, int mid, String mname, int quantity/*, Date odate */);

    public List<Orders> findByUid(int uid);
}
