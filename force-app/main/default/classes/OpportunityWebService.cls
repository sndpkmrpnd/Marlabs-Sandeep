@RestResource(urlmapping = '/Opportunites/*')
global with sharing class OpportunityWebService {
    @HttpGet
    global static Opportunity getOpportunities(){
        RestRequest req = RestContext.request;
        String OppID = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Opportunity opp = [Select ID, Name from Opportunity where ID =: OppID];
        return opp;
    }
    @HttpPost
    global static Opportunity addNewOpportunity(String Name, String stage, String closedate, String Amount){
        Opportunity opp = new Opportunity();
        opp.Name = Name;
        opp.StageName = stage;
        opp.CloseDate = Date.ValueOf(closedate);
        opp.Amount = Decimal.valueOf(Amount);   
        Insert opp;
        return opp;
    }
}