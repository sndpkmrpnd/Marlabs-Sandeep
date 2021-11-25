public class NoOfUniqueAccountsonDistributor{
    Public static void updateStrategy(List<Id> dstrlistID){
        List<Distributor__c> dstrlistUpdate = new List<Distributor__c>();
        Set<Id> uniqueAccountIDs = new Set<Id>();
        List<Distributor__c> dstrlist = [SELECT Id,name,(SELECT Id,Opportunity__c,Opportunity__r.AccountID FROM 
                                         Distributor_Lists__r where Distributor__c IN :dstrlistID)
                                         FROM Distributor__c WHERE ID IN :dstrlistID];
        for(Distributor__c dtr : dstrlist)
        {
            for(Distributor_List__c dls : dtr.Distributor_Lists__r){
              
                uniqueAccountIDs.add(dls.Opportunity__r.AccountID);
            }
            dtr.Accounts_Count__c = uniqueAccountIDs.size();
            dstrlistUpdate.add(dtr);
        }
        System.debug('uniqueAccountIDs' +uniqueAccountIDs.size());
        
        update dstrlistUpdate;
    }
}