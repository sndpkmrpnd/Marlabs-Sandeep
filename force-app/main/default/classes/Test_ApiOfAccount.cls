@isTest
public class Test_ApiOfAccount {
    
    @testSetup
    public static void setup(){
        Account acc = new Account();
        acc.Name='Roshan';
        acc.Phone='123457890';
        acc.AccountNumber='1234567';
        insert acc;
    }
    @istest
    public static void testDoDelete(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/AccountDetails/1234567';
        req.httpMethod = 'DELETE';
        RestContext.request = req;
        
        ApiOfAccount.deleteAccount();
     
        
    }
    
        @istest
       public static void testDoFetchAcc(){
        string AccID;
        list<Account> listOfAccount = [select id from Account];
        AccID = listOfAccount[0].id;
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/AccountDetails/'+AccID;
        req.httpMethod = 'GET';
        RestContext.request = req;        
        ApiOfAccount.fetchAccount();     
        
     }
    @istest
        public static void testDoPost(){
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/AccountDetails/';
        req.httpMethod = 'POST';
        RestContext.request = req;
        
        ApiOfAccount.doPost('SANDEEP','123450987','5546566');
     
        
    }
    
    
}