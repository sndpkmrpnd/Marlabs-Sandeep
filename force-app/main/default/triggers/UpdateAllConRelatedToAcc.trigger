trigger UpdateAllConRelatedToAcc on Account (After insert, After Update) {
   List<Account> listOfAcc = new List<Account>();
   Set<Id> setOfAccId = new Set<Id>();
   List<Contact> addConList= new List<Contact>();
   Map<Id,List<Contact>> mapOfAccAndCon = new Map<Id,List<Contact>>();
   for(Account acc : Trigger.new){
       setOfAccId.add(acc.Id);
   }
   List<Contact> fetchConList = [Select Id, Name,AccountId,account.Name from Contact where AccountId IN : setOfAccId];

   for(Contact con : fetchConList){
      Contact c = new Contact(id = con.Id);
      c.LastName = con.account.Name;
      addConList.add(c);
   }
   Update addConList;
}