public class AccountReqResHandller {
    public String ACCNAME;
    public String ACCNUMBER;
    public String WEBSITE;
    public String OWNERSHIP;//Public
    public String RATING; //Warm
    public String ANNAUALREVENUE;
    public String EMAIL;
    Public List<cls_ContactInfo> CONTACTINFOS;
    Public List<cls_OpportunityInfo> OPPORTUNITYINFO;
   // public List<cls_Account> GETACCOUNTINFO;

    public class cls_ContactInfo {
        public String CONLASTNAME;
        public String CONFIRSTNAME;
        public String LEADSOURCE; //WEB
        public String BIRTHDATE;
        public String EMAIL;
    }
    public class cls_OpportunityInfo{
        public String OPPNAME;
        public String LEADSOURCE; //WEB
        public String TYPE; //New Customer
        public String AMOUNT;
    }
      
    public static AccountReqResHandller parse(String json){
        return (AccountReqResHandller)System.json.deserialize(json, AccountReqResHandller.class);
    }
}