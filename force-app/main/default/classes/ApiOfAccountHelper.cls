public class ApiOfAccountHelper {
    public static AccountReqResHandller insertAccConOpp(AccountReqResHandller requestBody){
        AccountReqResHandller accReqRes = new AccountReqResHandller();
        Account acc = new Account();
        Opportunity opp = new Opportunity();
        List<Account> accList = new List<Account>();
        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        if(requestBody!=null){
            if(requestBody.ACCNAME!=null){
                acc.Name = requestBody.ACCNAME;
            }
            if(requestBody.ACCNUMBER!=null){
                acc.AccountNumber =  requestBody.ACCNUMBER;
            }
            if(requestBody.OWNERSHIP!=null){
                acc.Ownership =  requestBody.OWNERSHIP;//Public 
            }
            if(requestBody.RATING!=null){
                acc.Rating =  requestBody.RATING; //Warm    
            }
            if(requestBody.ANNAUALREVENUE!=null){
                acc.AnnualRevenue =  Decimal.valueOf(requestBody.ANNAUALREVENUE);  
            }
            if(requestBody.EMAIL!=null){
                acc.Email__c =  requestBody.EMAIL; 
            }
            Insert acc;
            //List<AccountReqResHandller.cls_ContactInfo> contactList = requestBody.CONTACTINFOS;
            if(requestBody.CONTACTINFOS!=null){
                for(AccountReqResHandller.cls_ContactInfo cont : requestBody.CONTACTINFOS){
                    Contact con = new Contact();
                    if(cont.CONLASTNAME!=null){
                        con.LastName = cont.CONLASTNAME;
                    }
                    if(cont.CONLASTNAME!=null){
                        con.FirstName = cont.CONFIRSTNAME;
                    }
                    if(cont.CONLASTNAME!=null){
                        con.LeadSource = cont.LEADSOURCE;
                    }
                    con.AccountId = acc.Id;
                    conList.add(con);
                }
            }
            if(!conList.isEmpty()){
                Insert conList;
            }            
        }
        return requestBody;
    }
}