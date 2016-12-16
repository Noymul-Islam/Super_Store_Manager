package MyPack;

public class SellerPageObject {
    
    public int id[] = new int[200];
    public String tableNames[] = new String[200];
    public int numberOfOrders = 0;
    public String pid;
    public String tableName;
    
    public String getPid(){
        return (pid);
    }

    public void setPid(String pid){
        this.pid = pid;
    }    
    
    public String getTableName(){
        return (tableName);
    }

    public void setTableName(String tableName){
        this.tableName = tableName;
    }    
    
    public int[] getId() {
        return id;
    }

    public void setId(int[] id) {
        this.id = id;
    }
    
    public void setNumberOfOrders(int a){
        numberOfOrders = a;
    }
    
    public int getNumberOfOrders(){
        return (numberOfOrders);
    }

    public String[] getTableNames() {
        return tableNames;
    }

    public void setTableNames(String[] tableNames) {
        this.tableNames = tableNames;
    }
    
    
}
