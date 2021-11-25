trigger Checkbox on Account (after insert,after update) 
{
    List<Invoice__c> InvoicesToSave= new List<Invoice__c>();
    String invoiceStatus;
    
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        try {
            for (Account account : Trigger.new){
                Account acc = [SELECT Id,Create_Invoice__c FROM Account WHERE Id =: Trigger.new];
                
                List<Invoice__c> invoiceList = [SELECT Id, Status__c,Account__c FROM Invoice__c WHERE Account__c = :acc.Id];
                
                If(invoiceList!=null){
                    for(Invoice__c invoices : invoiceList) {
                        invoiceStatus = invoices.Status__c;
                    }
                    if(invoiceStatus!=null && invoiceStatus == 'Open' && account.Create_Invoice__c == true){
                        account.addError('Cannot create an Invoice. There can be only one Open status Invoice allowed.');
                    }
                    else if(account.Create_Invoice__c!=null && account.Create_Invoice__c == true){
                        Invoice__c Inv = new Invoice__c();
                        Inv.Account__c=acc.Id;
                        InvoicesToSave.add(Inv);
                    }
                }
                insert InvoicesToSave;
            }
        } catch (Exception e) {
            System.debug(e);
        }
    }
   
}