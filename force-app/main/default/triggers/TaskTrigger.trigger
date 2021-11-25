trigger TaskTrigger on Task (after insert ,after update,after delete) {
    Set<Id> setTaskOfId = new Set<Id>();
    Set<Id> setOfDist = new Set<Id>();
    List<Distributor__c> distLIst = new List<Distributor__c>();
    Map<ID,ID> mapOfUniqueAcc = new Map<ID,ID>();
    Map<ID,ID> mapOfUniqueOpp = new Map<ID,ID>();
    Map<ID,ID> mapOfUniqueFinalOpp = new Map<ID,ID>();
    if(trigger.isInsert){
        for(Task tsk : trigger.new){
            setTaskOfId.add(tsk.WhatId);
            setOfDist.add(tsk.Distributor__c);
        }
    }
    if(trigger.isDelete){
        for(Task tsk : trigger.old){
            setTaskOfId.add(tsk.WhatId);
            setOfDist.add(tsk.Distributor__c);
        }
    }
    if(trigger.isUpdate){
        for(Task tsk : trigger.new){
            setTaskOfId.add(tsk.WhatId);
            setOfDist.add(tsk.Distributor__c);
        }
        for(Task tsk : trigger.old){
            setTaskOfId.add(tsk.WhatId);
            setOfDist.add(tsk.Distributor__c);
        }
    }
    List<Distributor_List__c> listOfDistList = [Select Id,Distributor__c,Opportunity__c,Opportunity__r.AccountId from Distributor_List__c where Distributor__c=: setOfDist];
    for(Distributor_List__c dist : listOfDistList){
        mapOfUniqueAcc.put(dist.Opportunity__r.AccountId,dist.Distributor__c);
    }
    List<Task> listOfTask = [Select Id,Distributor__c,WhatId from Task Where Distributor__c=: setOfDist];
    for(Task tsk : listOfTask){
        If(String.valueOf(tsk.whatId).startsWith('001')){
           mapOfUniqueAcc.put(tsk.WhatId,tsk.Distributor__c);            
        }
        else if(String.valueOf(tsk.whatId).startsWith('006')){
            mapOfUniqueOpp.put(tsk.WhatId,tsk.Distributor__c); 
        }
    }
    List<Opportunity> listOfOpp = [Select Id,AccountId from Opportunity where ID =: mapOfUniqueOpp.keySet()];
    for(Opportunity opp : listOfOpp){
        mapOfUniqueAcc.put(opp.AccountId,mapOfUniqueOpp.get(opp.Id));
    }
    for(Id dst : mapOfUniqueAcc.values()){
        
    }
}