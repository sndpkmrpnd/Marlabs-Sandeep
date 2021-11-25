public class company {
   public String cname;
   public Product productInfo;
   public Agent AgentInfo;
    
    public company(String cname){
        this.cname = cname;
    }
    
    public void createProduct(String pname,string code,decimal price){
        productInfo = new Product();
        productInfo.pname=pname;
        productInfo.code=code;
        productInfo.price=price;
    }
    
    public void createAgent(String aname,Integer phone){
        AgentInfo = new Agent();
        AgentInfo.aname=aname;
        AgentInfo.phone=phone;
    }
    public class Product{
        public String pname;
        public String code;
        public decimal price;
    }
    
    public class Agent{
        public String aname;
        public Integer phone;
    }
}