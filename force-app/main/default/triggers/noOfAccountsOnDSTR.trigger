trigger noOfAccountsOnDSTR on Distributor_List__c (after insert, after update, after delete, after undelete) {
    
    if(Trigger.IsInsert && Trigger.isAfter)
    {
        List<Id> DistrListID = new List<Id> ();
        
        for(Distributor_List__c rec : Trigger.New)
        {
            DistrListID.add(rec.Distributor__c);   
        }  
        NoOfUniqueAccountsonDistributor.updateStrategy(DistrListID);             
        
    }
    else if(Trigger.IsUpdate && Trigger.isAfter)
    {
        List<Id> DistrListID = new List<Id> ();
        
        for(Distributor_List__c rec : Trigger.New)
        {
            DistrListID.add(rec.Distributor__c);   
        }  
        NoOfUniqueAccountsonDistributor.updateStrategy(DistrListID);             
        
    }
    else if(Trigger.IsDelete && Trigger.isAfter)
    {
        List<Id> DistrListID = new List<Id> ();
        
        for(Distributor_List__c rec : Trigger.Old)
        {
            DistrListID.add(rec.Distributor__c);   
        }  
        NoOfUniqueAccountsonDistributor.updateStrategy(DistrListID);             
        
    }
    
    
    
}