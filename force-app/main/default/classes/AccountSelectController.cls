public class AccountSelectController {
    public list<WrappAccount> wrappAccountList{get;set;}
    public list<Account> selectedAccList{get;set;}
    
    public AccountSelectController(){
        if(wrappAccountList==null){
            wrappAccountList = new list<WrappAccount>();
            list<Account> acc = [Select Id,Name,Phone,Website from Account where phone!=null];
            for(Account a : acc){
                wrappAccountList.add(new WrappAccount(a));
            }
            
            system.debug(wrappAccountList);
        }
    }
    
    public void processSelectedAccount(){
        selectedAccList = new list<Account>();
        for(WrappAccount w : wrappAccountList){
            if(w.selected==true){
                selectedAccList.add(w.acc);
            }
        }
    }
   
    public class WrappAccount{
        public Account acc{get;set;}
            public boolean selected{get;set;}
        
        public WrappAccount(Account a){
            acc = a;
            selected = false;
        }
    }
}