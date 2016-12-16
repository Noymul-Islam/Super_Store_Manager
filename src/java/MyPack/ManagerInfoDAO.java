package MyPack;

public class ManagerInfoDAO {
    public String userName;
    public String password;
    
     public String item;
    
    public void setItem(String a){
        item =  a;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
