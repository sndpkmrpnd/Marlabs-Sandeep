@RestResource(urlMapping='/AccountDetails/*')
global class ApiOfAccount {
    global class Response{
        public string STATUSCODE;
        public string STATUS;
        Public string SUCCESSMSG;
        public string ERRORMSG;
        Public AccountReqResHandller AccReqRes;
        public List<cls_Account> GETACCOUNTINFO;
        Public Response(){
            AccReqRes = new AccountReqResHandller();
        }             
    }
    
    global class DetailResponse extends WS_Response{
        public List<cls_Account> GETACCOUNTINFO;  
        public DetailResponse (){
            GETACCOUNTINFO = New List<cls_Account>();
            //perfs=new list<PerfiosData>();
        }   
    }
    
    //For get request
    public class cls_Account{
        public String GETACCNAME;
        public String GETACCNUMBER;
        public String GETWEBSITE;
        public String GETOWNERSHIP;//Public
        public String GETRATING; //Warm
        public String GETANNAUALREVENUE;
        public String GETEMAIL;
        Public List<cls_ContactInfo> GETCONTACTINFOS;
        Public List<cls_OpportunityInfo> GETOPPORTUNITYINFO;
    }
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
    
    /* @httpPost
global static Account doPost(string Name,string PhoneNo,String AccountNumber){
Account acc = new Account();
acc.Name=Name;
acc.Phone=PhoneNo;
system.debug('phone--'+PhoneNo);
acc.AccountNumber=AccountNumber;
insert acc;
System.debug('acc @@@@'+acc);
return acc;
}*/
    
    @httpget
    global static Account fetchAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response; 
        
        String AccId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        System.debug('AccId--'+AccId);
        System.debug('req.requestURI.lastIndexOf @@@@'+req.requestURI.lastIndexOf('/')+1);
        Account result = [select Name,phone from Account where id=:AccId];
        return result;
    }
    
    @httpDelete
    global static void deleteAccount(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNum = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        DELETE [select id,Name,Phone from Account where AccountNumber=:AccNum];
        
    }
    
    //@httpPost
    /*global static Response createAccContOpportunity(){
        RestRequest req = RestContext.request;
        Response res = new Response();
        String reqBody = req.requestBody.toString();
        AccountReqResHandller reqResHandle = AccountReqResHandller.parse(reqBody);
        if(req == null || reqBody == null){
            return getResponse(res,'ERROR','404','','Request Body is null');         
        }
        else {
            try{
                If(reqResHandle!=null){
                    res.AccReqRes = ApiOfAccountHelper.insertAccConOpp(reqResHandle);
                    return getResponse(res,'SUCCESS','200','SUCCESSFULLY INSERTED',''); 
                }               
            }   
            catch(Exception ex){
                return getResponse(res,'ERROR','404','',ex.getMessage()); 
            }
        }
        return res;
    } */
    @httpPost
    global static DetailResponse getAccConOpp(){
        RestRequest req = RestContext.request;
        DetailResponse res = new DetailResponse();
        String reqBody = req.requestBody.toString();
        string AccountName = req.params.get('ACCNAME');
        System.debug('AccountName::'+AccountName);
        AccountReqResHandller reqResHandle = AccountReqResHandller.parse(reqBody);
        List<Account> listAccConOpp;
        if(reqResHandle!=null){
            string accName = reqResHandle.ACCNAME; 
            listAccConOpp = [Select Id,Name,AccountNumber,Ownership,Rating,AnnualRevenue,Email__c,(Select Id,FirstName,LastName,LeadSource,Birthdate,Email from Contacts),(Select Id,Name,LeadSource,Type,Amount from Opportunities) from Account where Name =: accName];
            System.debug('listAccConOpp::'+listAccConOpp);
        }
        if(req == null || reqBody == null){
            return getResponse(res,'ERROR','404','','Request Body is null');         
        }
        else {
            try{
                If(reqResHandle!=null){
                    //res.GETACCOUNTINFO.GETCONTACTINFOS = new List<cls_ContactInfo>();
                    for(Account acc : listAccConOpp){
                        cls_Account clsAcc = new cls_Account();
                        if(acc.Name!=null){
                            clsAcc.GETACCNAME = acc.Name;
                        }
                        if(acc.AccountNumber!=null){
                            clsAcc.GETACCNUMBER = acc.AccountNumber;
                        }
                        if(acc.Ownership!=null){
                            clsAcc.GETOWNERSHIP = acc.Ownership;
                        }
                        if(acc.Rating!=null){
                            clsAcc.GETRATING = acc.Rating;
                        }
                        if(acc.Email__c!=null){
                            clsAcc.GETEMAIL = acc.Email__c;
                        }
                        if(acc.AnnualRevenue!=null){
                            clsAcc.GETANNAUALREVENUE = String.valueOf(acc.AnnualRevenue);
                        }
                        res.GETACCOUNTINFO.add(clsAcc);
                        System.debug('res:'+res);
                        /*for(Contact con : acc.Contacts){
                            cls_ContactInfo clsCon = new cls_ContactInfo();
                            if(con.LastName!=null){
                                clsCon.CONLASTNAME = con.LastName;
                            }
                            if(con.FirstName!=null){
                                clsCon.CONFIRSTNAME = con.FirstName;
                            }
                            if(con.LeadSource!=null){
                                clsCon.LEADSOURCE = con.LeadSource;
                            }
                            if(con.Birthdate!=null){
                                clsCon.BIRTHDATE = String.valueOf(con.Birthdate);
                            }
                            if(con.Email!=null){
                                clsCon.EMAIL = con.Email;
                            }
                            res.GETACCOUNTINFO.GETCONTACTINFOS.add(clsCon);
                        }
                        for(Opportunity opp : acc.Opportunities){
                            
                        }*/
                    }
                    return getResponse(res,'SUCCESS','200','SUCCESSFULLY INSERTED',''); 
                }               
            }   
            catch(Exception ex){
                return getResponse(res,'ERROR','404','',ex.getMessage()); 
            }
        }
        return res;
    }
    public static DetailResponse getResponse(DetailResponse res, String status, String Statuscode, String successmsg, String errorMsg){
        res.STATUS = status;
        res.STATUSCODE = Statuscode;
        res.successMessage = successmsg;
        res.errorMessage = errorMsg; 
        return res;
    }
}