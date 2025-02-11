package beans;

public class Merchandise {
    private int mid;
    private String mname;
    private double mprice;
    private String intro;
    private String tips;
    private int inum;
    private int stock;
    private String type;

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public double getMprice() {
        return mprice;
    }

    public void setMprice(double mprice) {
        this.mprice = mprice;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips;
    }

    public int getInum() {
        return inum;
    }

    public void setInum(int inum) {
        this.inum = inum;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Merchandise() {
    }

    public Merchandise(int mid, String mname, double mprice, String intro, String tips, int inum, int stock) {
        this.mid = mid;
        this.mname = mname;
        this.mprice = mprice;
        this.intro = intro;
        this.tips = tips;
        this.inum = inum;
        this.stock = stock;
    }
    public Merchandise(String mname, double mprice, String intro, String tips, int inum, int stock) {
        this.mname = mname;
        this.mprice = mprice;
        this.intro = intro;
        this.tips = tips;
        this.inum = inum;
        this.stock = stock;
    }

    public Merchandise(int mid, String mname, double mprice, String intro, String tips, int inum, int stock, String type) {
        this.mid = mid;
        this.mname = mname;
        this.mprice = mprice;
        this.intro = intro;
        this.tips = tips;
        this.inum = inum;
        this.stock = stock;
        this.type = type;
    }

    public Merchandise(String mname, double mprice, String intro, String tips, int inum, int stock, String type) {
        this.mname = mname;
        this.mprice = mprice;
        this.intro = intro;
        this.tips = tips;
        this.inum = inum;
        this.stock = stock;
        this.type = type;
    }
}
