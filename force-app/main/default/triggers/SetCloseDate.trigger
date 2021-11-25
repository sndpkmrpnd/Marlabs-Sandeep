trigger SetCloseDate on Opportunity (before insert,before update) {
    if((trigger.isinsert || trigger.isupdate) && (trigger.isbefore)){
        for(Opportunity opp : trigger.new){
            if(opp.StageName == 'Closed Won' || opp.StageName=='Closed Lost'){
                opp.CloseDate=System.today();
            }
            else{
                opp.CloseDate=System.today()+15;
            }
        }
    }
}