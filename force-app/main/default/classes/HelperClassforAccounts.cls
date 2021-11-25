public class HelperClassforAccounts {
    public list <Account> acc {get;set;}
   
    public List<Contact> con{get;set;}
    
    
    
    @RemoteAction
    public static List<Account> getAccList(){
        return [Select Id, Name from Account];
    }
    @RemoteAction
    public static List<Contact> getConList(String accId) {
        return [Select id,Name from Contact where AccountId =: accId];
    }
}