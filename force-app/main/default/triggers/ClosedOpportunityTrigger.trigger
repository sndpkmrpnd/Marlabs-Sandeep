trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    List<Task> tskList = new List<Task>();
    oppList = [select id,StageName from Opportunity where id IN : Trigger.New];
    for(Opportunity opp : oppList){
        if(opp.StageName == 'Closed Won'){
            Task t = new task();
            t.WhatId = opp.id;
            t.Subject = 'Follow Up Test Task';
            tskList.add(t);
        }
    }
    Insert tskList;
}