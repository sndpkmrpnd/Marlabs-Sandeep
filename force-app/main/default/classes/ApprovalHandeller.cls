public class ApprovalHandeller {
    public static void papulateName(list<Approval_Record__c> appList){
        for(Approval_Record__c a : appList){
        a.Name = a.Product_Name__c+'-'+a.Quantity__c+'-'+a.Type__c;
        }
    }
    
   /* public static void duplicateFind(list<Approval_Record__c> appLis){
    
    set<string> newNameSet = new set<string>();
    set<string> dbNameSet = new set<string>();


    for(Approval_Record__c a : appLis){

        newNameSet.add(a.Approval_Name__c);
    }

    for(Approval_Record__c aq : [select id, Approval_Name__c from Approval_Record__c where Approval_Name__c IN: newNameSet]){

        dbNameSet.add(aq.Approval_Name__c);

    }

    for(Approval_Record__c an : appLis){

        if(dbNameSet.contains(an.Approval_Name__c))

            an.addError('You are inserting Duplicate approval record');

    }


    }*/
}