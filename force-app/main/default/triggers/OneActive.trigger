trigger OneActive on Invoice__c(after insert, before update,after update) 
{   
    
    InvoiceHandeler.oneActive(trigger.new);
     if(Trigger.isInsert || Trigger.isUpdate)
    {
        InvoiceHandeler.rollupSummery();
    }

 
    
      /*Set<Id> acc = new Set<Id>();
      //List<Invoice__c> invoiceList = new List<Invoice__c>([ select id,Status__c from  Invoice__C where Status__C = 'Open'and Account__c=:acc]);
           
       for(Invoice__c i : trigger.new){
       acc.add(i.Account__c);
       } 
    
   List<Invoice__c> invoiceList = new List<Invoice__c>([ select id,Status__c from  Invoice__C where Status__C = 'Open'and Account__c=:acc]);
     
   for(Invoice__c i : trigger.new){
   
       if(i.Status__C =='Open'){
               if(invoiceList.size()>0){
                i.adderror('only one application can active');
              }
       } 
   }
*/
}