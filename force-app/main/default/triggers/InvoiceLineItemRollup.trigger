trigger InvoiceLineItemRollup on Invoice_Line_Item__c (after insert, after update, after delete, after undelete) {
 Set<Id> setOfId = new Set<Id>();
    if(trigger.isDelete){
        System.debug('Im Inside delete');
        for(Invoice_Line_Item__c lineItem : trigger.Old){
            setOfId.add(lineItem.Invoice__c);
            System.debug('setOfId::'+setOfId);
        }
    }
    if(trigger.isUpdate){
        System.debug('Im Inside Update');
        for(Invoice_Line_Item__c lineItem : trigger.new){
            setOfId.add(lineItem.Invoice__c);
            System.debug('setOfId::'+setOfId);
        }
        for(Invoice_Line_Item__c lineItem : trigger.old){
            setOfId.add(lineItem.Invoice__c);
            System.debug('setOfId::'+setOfId);
        }
    }
    if(trigger.isInsert){
        System.debug('Im Inside Insert');
        for(Invoice_Line_Item__c lineItem : trigger.new){
            setOfId.add(lineItem.Invoice__c);
            System.debug('setOfId::'+setOfId);
        }
    }
    System.debug('setOfId::'+setOfId);
    List<Invoice__c> listOfInv = new List<Invoice__c>();
    List<AggregateResult> listOfResult = [Select Count(Id)countRec,Invoice__c from Invoice_Line_Item__c where Invoice__c IN : setOfId Group By Invoice__c];
    System.debug('listOfResult::'+listOfResult);
    for(AggregateResult ar : listOfResult){
        ID invoiceId = (ID)ar.get('Invoice__c');
        Integer count = (Integer)ar.get('countRec');
        Invoice__c inv = new Invoice__c(Id = invoiceId);
        inv.Invoice_Line_Item_RollUp__c = count;
        listOfInv.add(inv);
    }
    System.debug('listOfInv::'+listOfInv);
    Update listOfInv;
}