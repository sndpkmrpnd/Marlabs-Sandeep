public class OpportunitySearchController {
   @AuraEnabled
    public static List<Opportunity> getOpportunityRec(String recName){
        List<Opportunity> oppRec = new List<Opportunity>();
        System.debug('recName::'+recName);
        String searchKey = String.isBlank(recName) ? '%%' : recName + '%';
        System.debug('searchKey::'+searchKey);
        oppRec = [Select Id, Name, Amount, CloseDate from Opportunity where Name LIKE : searchKey LIMIT 15];
        System.debug('oppRec::'+oppRec);
        return oppRec;
    }
    @AuraEnabled
    public static List<Opportunity> getAccOpportunityRec(String accId){
        List<Opportunity> oppRec = new List<Opportunity>();
        oppRec = [Select Id, Name, Amount, CloseDate from Opportunity where ID =: accId];
        System.debug('oppRec::'+oppRec);
        return oppRec;
    }
}