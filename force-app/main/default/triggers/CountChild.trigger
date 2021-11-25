trigger CountChild on Contact (after insert,after update) {
    
    set<id> setid = new set<id>();
    list<Account> listOfAccount = new list<Account>();
    
    for(Contact con : trigger.new){
      setid.add(con.accountid);  
    }
    
    for(Account acc : [select id,Name,Count_Contact__c, (select id from Contacts)from Account where id=:setid]){
        Account acc1 = new Account();
        acc1.id=acc.Id;
        acc1.Count_Contact__c = acc.Contacts.size();
        listOfAccount.add(acc1);
    }
    update listOfAccount;
}