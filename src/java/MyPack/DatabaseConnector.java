package MyPack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import java.util.Date;

public class DatabaseConnector {

    Connection conn;

    /**
     * sets up the connection with the super store database
     */
    
    public void updateProfile(int id,String password,String phoneno,String city,String area,String houseno){
        try {
                PreparedStatement ps = conn.prepareStatement("update userinfo set password=?,phoneno=?,city=?,area=?,houseno=? where id=?");
                ps.setString(1, password);
                ps.setString(2, phoneno);
                ps.setString(3, city);
                ps.setString(4, area);
                ps.setString(5, houseno);
                ps.setInt(6, id);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
    }
    
    public void sendMessageToAll(String msg){
         
         Password pw = new Password();
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id,houseno from userinfo");
            while (rs.next()){
                int id = rs.getInt("id");
                String emailid = rs.getString("houseno");
                pw.mailsend(emailid,Integer.toString(id),msg);
            }
            
        }
        catch(Exception e){}
    }
    
    public String getEmail(String id){
        String email = null;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select houseno from userinfo where id="+Integer.parseInt(id));
            if (rs.next())
                email = rs.getString("houseno");
        }
        catch(Exception e){}
        return (email);
    }
    
    public int getCoin(String id){
        int coins=0;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select coins from usercoins where id="+Integer.parseInt(id));
            if (rs.next())
                coins = rs.getInt("coins");
        }
        catch(Exception e){}
        return coins;
    }
    
    public void insertYearData(String year){
        double total_sold=0;
        try{
         Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select sum(total_sold) from yeardata");
            
                if (rs.next()) {
                    total_sold = rs.getDouble("sum(total_sold)");
                }
            }
            catch(Exception e){}
        double new_total_sold = 0;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select sum(total_sold) from vegetablelist union select sum(total_sold) from grocerylist union select sum(total_sold) from eggslist union select sum(total_sold) from liquidslist union select sum(total_sold) from meatslist union select sum(total_sold) from fisheslist union select sum(total_sold) from chockolateslist union select sum(total_sold) from cosmeticslist union select sum(total_sold) from colddrinkslist union select sum(total_sold) from otherslist");
            
                while (rs.next()) {
                    new_total_sold += rs.getDouble("sum(total_sold)");
                }
            PreparedStatement ps = conn.prepareStatement("insert into yeardata values(?,?)");
            ps.setString(1, year);
            ps.setDouble(2, new_total_sold-total_sold);
            ps.executeUpdate();
        }
        catch(Exception e){}
        
        System.out.println("new_total_sold "+new_total_sold);
        
        
    }
    
    public void insertMonthData(String year){
        double total_sold=0;
        try{
         Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select sum(total_sold) from monthdata");
            
                if (rs.next()) {
                    total_sold = rs.getDouble("sum(total_sold)");
                }
            }
            catch(Exception e){}
        double new_total_sold = 0;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select sum(total_sold) from vegetablelist union select sum(total_sold) from grocerylist union select sum(total_sold) from eggslist union select sum(total_sold) from liquidslist union select sum(total_sold) from meatslist union select sum(total_sold) from fisheslist union select sum(total_sold) from chockolateslist union select sum(total_sold) from cosmeticslist union select sum(total_sold) from colddrinkslist union select sum(total_sold) from otherslist");
            
                while (rs.next()) {
                    new_total_sold += rs.getDouble("sum(total_sold)");
                }
            PreparedStatement ps = conn.prepareStatement("insert into monthdata values(?,?)");
            ps.setString(1, year);
            ps.setDouble(2, new_total_sold-total_sold);
            ps.executeUpdate();
        }
        catch(Exception e){}
        
        System.out.println("new_total_sold "+new_total_sold);
        
        
    }
    
    
    public boolean verifySupplier(long id,String pass){
         int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id,password from supplier");
            while (rs.next()) {

                long ID = rs.getLong("id");
                System.out.println(ID);
                String password = rs.getString("password").toString();
                if (ID==id && password.equals(pass)) {
                    System.out.println("BROKE");
                    flag = 1;
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (flag == 0) {
            return (false);
        } else {
            return (true);
        }
    }
    
     public String getSupplierName(String userID) {
        String userName = null;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select name from supplier where id=" + Long.parseLong(userID));
            while (rs.next()) {
                userName = rs.getString("name");
            }
        } catch (Exception e) {
        }

        return (userName);
    }
    
    
    public void setConnectionWithOracle() {
        conn = null;
        try {
            String driverName = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driverName);
            String serverName = "localhost";
            String serverPort = "1521";
            String sid = "orcl";
            String url = "jdbc:oracle:thin:@" + serverName + ":" + serverPort + ":" + sid;
            String username = "SuperStoreDatabase";
            String password = "1234";
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("ALHAMDULILLAH");
        } catch (Exception e) {
            System.out.println("error rror ttor");
        }
    }

    /**
     *
     * @param str : SQL query to insert new data to userinfo table
     */
    public int enterUserInfoToDatabase(String[] str) {
        int count = 0;
        try {
            // PreparedStatement ps = conn.prepareStatement("select * from userinfo");
           
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from userinfo");

            while (rs.next()) {
                ++count;
            }
            double d = 0.0;
            st.executeQuery("insert into userinfo(id,username,password,phoneno,city,area,houseno,total_purchased) values(" + count + "," + "'" + str[0] + "'" + "," + "'" + str[1] + "'" + ","
                    + "'" + str[2] + "'" + "," + "'" + str[3] + "'" + "," + "'" + str[4] + "'" + "," + "'" + str[5] + "'" + "," + d + ")");

            System.out.println("upwards");
            st.executeQuery("commit");

            System.out.println("Alhamdulillah677" + count);
        } catch (Exception e) {
            System.out.println("gotcha677");
        }
        return (count);
    }

    public boolean verifyUser(String theUser, String thePassword) {
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id,password from userinfo");
            while (rs.next()) {

                String ID = rs.getString("id").toString();
                System.out.println(ID);
                String password = rs.getString("password").toString();
                if (ID.equals(theUser) && password.equals(thePassword)) {
                    System.out.println("BROKE");
                    flag = 1;
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (flag == 0) {
            return (false);
        } else {
            return (true);
        }
    }

    public boolean verifySeller(String theUser, String thePassword) {
        int flag = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id,password from sellerinfo");
            while (rs.next()) {

                String ID = rs.getString("id").toString();
                System.out.println(ID);
                String password = rs.getString("password").toString();
                if (ID.equals(theUser) && password.equals(thePassword)) {
                    System.out.println("BROKE");
                    flag = 1;
                    break;
                }

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        if (flag == 0) {
            return (false);
        } else {
            return (true);
        }
    }

    public String getUserName(String userID) {
        String userName = null;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select username from userinfo where id=" + userID);
            while (rs.next()) {
                userName = rs.getString("username");
            }
        } catch (Exception e) {
        }

        return (userName);
    }

    public String getUserID(String username) {
        String userID = null;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select id from userinfo where username=" + username);
            while (rs.next()) {
                userID = rs.getString("id");
            }
        } catch (Exception e) {
        }

        return (userID);
    }

    public String getUserRP(String id) {
        String userRP = null;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select rp from userinfo where id=" + id);
            while (rs.next()) {
                userRP = rs.getString("rp");
            }
        } catch (Exception e) {
        }

        return (userRP);
    }

    public String getPrices(String databaseName, String item) {
        String price = null;
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select price from " + databaseName + " where name='" + item + "'");
            while (rs.next()) {
                price = rs.getString("price").toString();
            }
        } catch (Exception e) {
            System.out.println("inside exception");
        }
        return (price);
    }

    public String[] getItems(String databaseName) {
        String[] names = new String[100];
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select name from " + databaseName);
            while (rs.next()) {
                names[i++] = rs.getString("name").toString();
            }
        } catch (Exception e) {
            System.out.println("inside exception");
        }
        return (names);
    }

    public String getTotalSold(String databaseName, String item) {
        String totalSold = null;
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select total_sold from " + databaseName + " where name='" + item + "'");
            while (rs.next()) {
                totalSold = rs.getString("total_sold").toString();
            }
        } catch (Exception e) {
            System.out.println("inside exception");
        }
        return (totalSold);
    }

    public String getRecentSold(String databaseName, String item) {
        String recentSold = null;
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select recent_sold from " + databaseName + " where name='" + item + "'");
            while (rs.next()) {
                recentSold = rs.getString("recent_sold").toString();
            }
        } catch (Exception e) {
            System.out.println("inside exception");
        }
        return (recentSold);
    }

    public String getColumn(String databaseName, String columnName, String item) {
        String result = null;
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select " + columnName + " from " + databaseName + " where name='" + item + "'");
            while (rs.next()) {
                result = rs.getString(columnName).toString();
            }
        } catch (Exception e) {
            System.out.println("inside exceptioncolumn");
        }
        return (result);
    }

    public String getColumn(String databaseName, String columnName, int id) {
        String result = null;
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select " + columnName + " from " + databaseName + " where id=" + id);
            while (rs.next()) {
                result = rs.getString(columnName).toString();
            }
        } catch (Exception e) {
            System.out.println("inside exceptioncolumn");
        }
        return (result);
    }

    public void updateColumn(String databaseName, String columnName, String item, double data) {

        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("update " + databaseName + " set " + columnName + "=" + data + " where name='" + item + "'");

        } catch (Exception e) {
            System.out.println("inside exception2");
        }
        return;
    }

    public void updateColumn(String databaseName, String columnName, int id, double data) {

        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("update " + databaseName + " set " + columnName + "=" + data + " where id=" + id);

        } catch (Exception e) {
            System.out.println("inside exception2");
        }
        return;
    }

    public void createTable(String tableName) {

        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("create table " + tableName + "(itemname varchar(30),itemamount varchar(20),itemcost numeric(12,4))");
            System.out.println("SUCEs1");

        } catch (Exception e) {
            System.out.println("createTable");
        }
        return;
    }

    public void insertIntoTable(String supplierViewTableName, String itemName, String itemAmount, double itemCost) {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("insert into " + supplierViewTableName + " values(" + "'" + itemName + "'" + "," + "'" + itemAmount + "'" + "," + itemCost + ")");
            rs = st.executeQuery("commit");
            System.out.println("SUCESSSSSSS");

        } catch (Exception e) {
            System.out.println("insertTable");
        }
        return;
    }

    public String[] getTableNames() {
        String[] names = new String[100];
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select table_name from user_tables where table_name like " + "'" + "ID%" + "'");
            while (rs.next()) {
                names[i++] = rs.getString("table_name").toString();
            }
        } catch (Exception e) {
            System.out.println("inside exceptiontablename");
        }
        return (names);
    }

    public int getTableCount() {
        int i = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select table_name from user_tables where table_name like " + "'" + "ID%" + "'");
            while (rs.next()) {
                ++i;
            }
        } catch (Exception e) {
            System.out.println("inside exceptiontablecount");
        }
        return (i);
    }

    public boolean authenticateManager(String name, String pass) {
        boolean authenticated = false;
        try {

            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("select username,password from manager");
            System.out.println("Aslaaam");

            while (rs.next()) {

                String adminName = rs.getString("username").toString();
                String adminPassword = rs.getString("password").toString();
                System.out.println(adminName + " " + adminPassword);
                if (adminName.equals(name) && adminPassword.equals(pass)) {
                    authenticated = true;
                }

            }

        } catch (Exception e) {

        }

        return authenticated;
    }

    public boolean managerChangePassword(String prev, String present) {
        boolean result = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select password from manager");
            while (rs.next()) {
                String password = rs.getString("password").toString();
                if (password.equals(prev) && !present.equals("") && present != null) {
                    st.executeQuery("update manager set password=" + "'" + present + "'" + "where password=" + "'" + prev + "'");
                    st.executeQuery("commit");
                    result = true;

                }

            }
        } catch (Exception e) {
        }
        return result;
    }

    public boolean managerChangeUsername(String prev, String present) {
        boolean result = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select username from manager");
            while (rs.next()) {

                String username = rs.getString("username").toString();

                if (username.equals(prev) && present != "" && present != null) {

                    st.executeUpdate("update manager set username=" + "'" + present + "'" + "where username=" + "'" + prev + "'");
                    System.out.println("asasa");
                    st.executeQuery("commit");
                    result = true;
                }

            }
        } catch (Exception e) {
        }
        return result;

    }

    public void coinsaveText(String coin, String id) {

        try {
            System.out.println("!!!" + coin);
            Statement st = conn.createStatement();

            st.executeUpdate("update usercoins set coins=" + Integer.parseInt(coin) + "where id=" + Integer.parseInt(id));
            st.executeQuery("commit");

        } catch (Exception e) {
            System.out.println("Errrrotic");
            System.out.println(e);

        }
    }

    public void insertTotalPurchased(int id, int coins) {
        try {

            Statement st = conn.createStatement();

            st.executeQuery("insert into usercoins values(" + id + "," + coins + ")");
            st.executeQuery("commit");

        } catch (Exception e) {
            System.out.println("Errrrotic");
            System.out.println(e);

        }

    }

    public void deleteTable(String tableName) {
        try {

            Statement st = conn.createStatement();

            st.executeQuery("drop table " + tableName);
            st.executeQuery("commit");

        } catch (Exception e) {
            System.out.println("Errrrotic");
            System.out.println(e);

        }

    }

    public void insertIntoPaymentInfo(int id, String stat) {
        try {
            PreparedStatement ps = conn.prepareStatement("insert into paymentinfo values(?,?)");
            ps.setInt(1, id);
            ps.setString(2, stat);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void checkAndInsertCoin(int id, int coin) {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select status from paymentinfo where id=" + id);
            while (rs.next()) {
                Statement st2 = conn.createStatement();
                st2.executeUpdate("update usercoins set coins=" + coin + "where id=" + id);
                st2.executeQuery("commit");
                st2.executeQuery("delete from paymentinfo where id=" + id);
                st2.executeQuery("commit");
            }
        } catch (Exception e) {
        }
    }

    public boolean checkAlreadyUsedCoin(int id) {
        boolean flag = false;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select status from paymentinfo where id=" + id);
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return (flag);
    }

    public void setCoinRate(int num) {
        try {
            PreparedStatement ps = conn.prepareStatement("update coingenerationinfo set rate=?");
            ps.setInt(1, num);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public int getCoinRate() {
        int num = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from coingenerationinfo");
            while (rs.next()) {
                num = rs.getInt("rate");
            }
        } catch (Exception e) {
        }
        return num;
    }

    public void setCoinLimitValue(int num) {
        try {
            PreparedStatement ps = conn.prepareStatement("update coingenerationinfo set limit_value=?");
            ps.setInt(1, num);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public int getCoinLimitValue() {
        int num = 0;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from coingenerationinfo");
            while (rs.next()) {
                num = rs.getInt("limit_value");
            }
        } catch (Exception e) {
        }
        return num;
    }

    public int addSupplier(String name, String phone, String email, String address, String password) {
        int id = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("insert into supplier values(supp.nextval,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, password);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Gotcha!!!");
        }
        try {
            PreparedStatement ps = conn.prepareStatement("select id from supplier where name=? and phone=? and email=? and address=? and password=?");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (Exception e) {
        }
        return (id);
    }

    public void editcoin(String taka, String coin) {

        try {
            System.out.println("!!!" + taka);
            Statement st = conn.createStatement();

            st.executeQuery("update coingenerationinfo set rate=" + Integer.parseInt(coin) + ",limit_value=" + Integer.parseInt(taka));
            st.executeQuery("commit");

        } catch (Exception e) {
            System.out.println("Errrrotic");
            System.out.println(e);

        }

        return;
    }

    public void editSeller(String curID, String curPas) {

        try {
            Statement st = conn.createStatement();
            st.executeQuery("update sellerinfo set id=" + Integer.parseInt(curID) + ",password= '" + curPas + "'");
            st.executeQuery("commit");
        } catch (Exception e) {
            System.out.println("Errrrotic");
            System.out.println(e);

        }

        return;
    }

    public String insertProduct(String name, int price, double allocation, String type, int id, String expDate) {
        String newID = null;
        if (type.equals("veg")) {
            String pID = "veg";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into vegetablelist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from vegetablelist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "veg" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update vegetablelist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (type.equals("gro")) {
            String pID = "gro";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into grocerylist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from grocerylist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "gro" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update grocerylist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("liq")) {
            String pID = "liq";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into liquidslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from liquidslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "liq" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update liquidslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("egg")) {
            String pID = "egg";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into eggslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from eggslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "egg" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update eggslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("mea")) {
            String pID = "mea";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into meatslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from meatslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "mea" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update meatslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("fis")) {
            String pID = "fis";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into fisheslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from fisheslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "fis" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update fisheslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("col")) {
            String pID = "col";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into colddrinkslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from colddrinkslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "col" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update colddrinkslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("cos")) {
            String pID = "cos";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into cosmeticslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from cosmeticslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "cos" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update cosmeticslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("oth")) {
            String pID = "oth";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into otherslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from otherslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "oth" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update otherslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("cho")) {
            String pID = "cho";
            try {

                PreparedStatement ps = conn.prepareStatement("insert into chockolateslist(name,price,id,allowed_amount,total_sold,recent_sold,ammount_supplied,remaining_item,expdate,ppath) values (?,?,seq2.nextval,?,0,0,0,0,TO_DATE(?,?),?)");
                ps.setString(1, name);
                ps.setInt(2, price);
                ps.setDouble(3, allocation);
                ps.setString(4, expDate);
                ps.setString(5, "YYYYMMDD");
                ps.setString(6, "a");
                ps.executeUpdate();
            } catch (Exception e) {

            }
            try {
                PreparedStatement ps = conn.prepareStatement("select id from chockolateslist where name=?");
                ps.setString(1, name);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    newID = "cho" + rs.getString("id").toString();
                    PreparedStatement ps2 = conn.prepareStatement("update chockolateslist set id=? where name=?");
                    ps2.setString(1, newID);
                    ps2.setString(2, name);
                    ps2.executeUpdate();
                    ps2 = conn.prepareStatement("insert into supplierproductinfo(sid,pid) values(?,?)");
                    ps2.setInt(1, id);
                    ps2.setString(2, newID);
                    ps2.executeUpdate();
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return (newID);
    }

    public void insertPic(String path, String type, String pid) {

        if (type.equals("veg")) {
            System.out.println(type);
            try {
                PreparedStatement ps = conn.prepareStatement("update vegetablelist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        } else if (type.equals("gro")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update grocerylist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("liq")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update liquidslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("egg")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update eggslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("mea")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update meatslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("fis")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update fisheslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("col")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update colddrinkslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("cos")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update cosmeticslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("oth")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update otherslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        } else if (type.equals("cho")) {
            try {
                PreparedStatement ps = conn.prepareStatement("update chockolateslist set ppath=? where id=?");
                ps.setString(1, path);
                ps.setString(2, pid);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }

        }

    }

    public void editProduct(String tablename, String b, String id, String name, int price, double total_sold, double recent_sold, double ammount_supplied, double allowed_amount) {
        try {
            PreparedStatement ps = null;
            if (tablename.equals("grocerylist")) {
                ps = conn.prepareStatement("update grocerylist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("vegetablelist")) {
                ps = conn.prepareStatement("update vegetablelist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("liquidslist")) {
                ps = conn.prepareStatement("update liquidslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("chockolateslist")) {
                ps = conn.prepareStatement("update chockolateslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("eggslist")) {
                ps = conn.prepareStatement("update eggslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("meatslist")) {
                ps = conn.prepareStatement("update meatslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("fisheslist")) {
                ps = conn.prepareStatement("update fisheslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("colddrinkslist")) {
                ps = conn.prepareStatement("update colddrinkslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("cosmeticslist")) {
                ps = conn.prepareStatement("update cosmeticslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            } else if (tablename.equals("otherslist")) {
                ps = conn.prepareStatement("update otherslist set name=?,price=?,expdate=TO_DATE(?,?),total_sold=?,recent_sold=?,ammount_supplied=?,allowed_amount=? where id=?");
            }
            ps.setString(1, name);
            ps.setInt(2, price);
            ps.setString(3, b);
            ps.setString(4, "yyyymmdd");
            ps.setDouble(5, total_sold);
            ps.setDouble(6, recent_sold);
            ps.setDouble(7, ammount_supplied);

            ps.setDouble(8, allowed_amount);
            ps.setString(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void deleteRowFromTable(String id, String tableName) {
        try {
            Statement st = conn.createStatement();
            st.executeQuery("delete from " + tableName + " where id='" + id + "'");
            st.executeQuery("commit");
            st.executeQuery("delete from supplierproductinfo" + " where pid='" + id + "'");
            st.executeQuery("commit");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String getGraphData(String attr, String tableName) {
        String totalsold = "";

        double d = 0;
        if (attr.equals("expdate")){
             try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select 10000-sum(round(months_between(expdate,sysdate))-1) from "+tableName);
                if (rs.next()) {
                    d = rs.getDouble("10000-sum(round(months_between(expdate,sysdate))-1)"); 
                    totalsold = Double.toString(d);
                }
            } catch (Exception e) {

            }
        }
        else if (attr.equals("remaining_item")) {
            try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select sum(ammount_supplied-recent_sold) from "+tableName);
                if (rs.next()) {
                    d = rs.getDouble("sum(ammount_supplied-recent_sold)"); 
                    totalsold = Double.toString(d);
                }
            } catch (Exception e) {

            }

        } 
        else {
            try {
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select sum(" + attr + ")" + " from " + tableName);
                if (rs.next()) {
                    if (attr.equals("total_sold")) {
                        d = rs.getDouble("sum(total_sold)");
                    } else if (attr.equals("recent_sold")) {
                        d = rs.getDouble("sum(recent_sold)");
                    }
                    totalsold = Double.toString(d);
                }

            } catch (Exception e) {
            }
        }

        return (totalsold);
    }
    
    SavingData sortData(String Iteam, String SortType) {
        SavingData d = new SavingData();

        if (Iteam.equals("groc")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from grocerylist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from grocerylist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from grocerylist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from grocerylist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("veg")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from vegetablelist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from vegetablelist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from vegetablelist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from vegetablelist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("meat")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from meatslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from meatslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from meatslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from meatslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("fish")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from fisheslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from fisheslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from fisheslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from fisheslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("cosm")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from cosmeticslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from cosmeticslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from cosmeticslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from cosmeticslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("liq")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from liquidslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from liquidslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from liquidslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from liquidslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("cold")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from colddrinkslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from colddrinkslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from colddrinkslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from colddrinkslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("egg")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from eggslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from eggslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from eggslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from eggslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("chock")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from chockolateslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from chockolateslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from chockolateslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from chockolateslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        else if (Iteam.equals("other")) {

            try {

                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();

                ResultSet rs = null;
                ResultSet rs2 = null;
                if (SortType.equals("TotalSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from otherslist order by total_sold desc");
                } else if (SortType.equals("RecentSold")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from otherslist order by recent_sold desc");
                } else if (SortType.equals("RemainingItem")) {
                    rs = st.executeQuery("select name,price,total_sold,recent_sold,ammount_supplied-recent_sold,expdate,id from otherslist order by ammount_supplied-recent_sold desc");
                }

                d.counter = 0;
                while (rs.next()) {

                    d.Item[d.counter] = rs.getString("name").toString();
                    d.price[d.counter] = rs.getString("price").toString();
                    d.totalSold[d.counter] = rs.getString("total_sold").toString();
                    d.recentSold[d.counter] = rs.getString("recent_sold").toString();
                    d.remainingUnit[d.counter] = rs.getString("ammount_supplied-recent_sold").toString();
                    d.expireDate[d.counter] = rs.getDate("expdate").toString();
                    String id = rs.getString("id").toString();

                    rs2 = st2.executeQuery("select round(months_between(expdate,sysdate))-1  as time from otherslist where id='" + id+"'");
                    while (rs2.next()) {
                        Date dat = new Date();
                        if (dat.compareTo(rs.getDate("expdate")) > 0) {
                            d.remainingMonth[d.counter] = "" + 0;
                        } else {
                            if(Integer.parseInt(rs2.getString("time").toString())==-1)
                            d.remainingMonth[d.counter] = "" + 0;
                            else    
                            d.remainingMonth[d.counter] = rs2.getString("time").toString();
                        }
                    }
       
                    
                    d.counter++;

                }

            } catch (Exception e) {

                System.out.println(e);

            }

        }
        return d;
    }

}
