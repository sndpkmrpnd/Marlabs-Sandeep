trigger RollUpSummery on Contact (After insert, After update, After delete) {
    Set<Id> setOfId = new Set<Id>();
    If(Trigger.isInsert){
        for(Contact con : trigger.new){
            setOfId.add(con.AccountId);
        }
    }
    
    If(Trigger.isUpdate){
        for(Contact con : trigger.new){
            setOfId.add(con.AccountId);
        }
        for(Contact con : trigger.old){
            setOfId.add(con.AccountId);
        }
    }
    
    If(Trigger.isDelete){
        for(Contact con : trigger.old){
            setOfId.add(con.AccountId);
        }
    }
    List<Account> accList = new List<Account>();
    List<AggregateResult> aggRes = [Select count(id)conID, AccountId from contact where AccountId IN : setOfId Group By AccountId];
    for(AggregateResult agg : aggRes){
        ID accID = (ID)agg.get('AccountId');
        Integer count = (Integer)agg.get('conID');
        Account acc = new Account(ID = accID);
        acc.Count_Contact__c = count;
        accList.add(acc);
    }
    Update accList;
}