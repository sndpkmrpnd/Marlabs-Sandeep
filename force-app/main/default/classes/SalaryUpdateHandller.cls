public class SalaryUpdateHandller {
    public static void updateSalaryOnAcc(List<Contact> con){
        try{
            list<Account> accListToUpdate = new list<Account>();
            Set<Id> setOfId = new Set<Id>();
              for(Contact cn : con){
                 setOfId.add(cn.accountid);  
              }
            if(setOfId != null && setOfId.size() > 0){
                Account acc = new Account();
                Decimal devSal = 0.0;
                Decimal mangSal = 0.0;
                Account queryAcc = [select id,Develper_Salary__c,Manager_Salary__c,Both_of_Salary__c,(select id,Type__c,Salaray__c from Contacts) from Account where id IN : setOfId LIMIT 1];
                for(Contact cnn : queryAcc.Contacts){
                    if(cnn.Type__c  == 'Developer'){
                        devSal += cnn.Salaray__c;
                    }
                    System.debug('devSal::'+devSal);
                    if(cnn.Type__c  == 'Manager'){
                        mangSal += cnn.Salaray__c;
                     System.debug('mangSal::'+mangSal);   
                    }
                    queryAcc.Develper_Salary__c = devSal;
                    System.debug('queryAcc.Develper_Salary__c::'+queryAcc.Develper_Salary__c);
                    queryAcc.Manager_Salary__c = mangSal;
                    System.debug('queryAcc.Manager_Salary__c::'+queryAcc.Manager_Salary__c);
                    queryAcc.Both_of_Salary__c = devSal + mangSal;
                    //acc.Id = queryAcc.Id;
                    //accListToUpdate.add(queryAcc);
                }
                    Update queryAcc;
            }
        }
        catch(exception e) 
        {
            system.debug('Exception message:-'+e.getMessage() +'  LineNumber:-'+e.getLineNumber() +'  StackTraceString:-'+e.getStackTraceString());           
        }
    }
}