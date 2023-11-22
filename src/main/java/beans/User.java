package beans;

public class User {
    private int id;
    private String uname;
    private String phone;
    private String pwd;
    private double balance;
    private String address;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User(int id, String uname, String phone, String pwd, double balance, String address) {
        this.id = id;
        this.uname = uname;
        this.phone = phone;
        this.pwd = pwd;
        this.balance = balance;
        this.address = address;
    }

    public User(String uname, String phone, String pwd, double balance, String address) {
        this.uname = uname;
        this.phone = phone;
        this.pwd = pwd;
        this.balance = balance;
        this.address = address;
    }

    public User(String uname, String phone, String pwd) {
        this.uname = uname;
        this.phone = phone;
        this.pwd = pwd;
    }

    public User(int id) {
        this.id = id;
        this.uname = null;
        this.phone = null;
        this.pwd = null;
        this.balance = 0;
        this.address = null;
    }

    public User() {
        super();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", uname='" + uname + '\'' +
                ", phone='" + phone + '\'' +
                ", pwd='" + pwd + '\'' +
                ", balance=" + balance +
                ", address='" + address + '\'' +
                '}';
    }
}
