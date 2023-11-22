package beans;


public class Cart {
    //用户id
    private int uid;
    //商品id
    private int mid;
    //是否收藏
    private boolean isStar;
    //是否加入购物车
    private boolean isCart;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public boolean isStar() {
        return isStar;
    }

    public void setIsStar(boolean star) {
        isStar = star;
    }

    public boolean isCart() {
        return isCart;
    }

    public void setIsCart(boolean cart) {
        isCart = cart;
    }

    @Override
    public String toString() {
        return "cart{" +
                "uid=" + uid +
                ", mid=" + mid +
                ", isStar=" + isStar +
                ", isCart=" + isCart +
                '}';
    }
}
