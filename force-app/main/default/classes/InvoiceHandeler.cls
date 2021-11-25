public class InvoiceHandeler {
    
    public static void rollupSummery(){
        
        List<Account> accountList = new List<Account>();
        List<AggregateResult> rollup = [select sum(Amount__c)totalAmount,max(Amount__c)maxAmount,min(Amount__c)minAmount,Account__c from Invoice__c group By Account__c];
        for(AggregateResult agg : rollup)
        {
            if(agg.get('Account__c') != null)
            {
            Account acc = new Account();
            acc.Id = (Id)agg.get('Account__c');
            acc.Total_Amount__c = (Decimal)agg.get('totalAmount');
            acc.Maximum_Amount__c = (Decimal)agg.get('maxAmount');
            acc.Minumun_Amount__c = (Decimal)agg.get('minAmount');
            accountList.add(acc);
            }
        }
        
        if(!accountList.isEmpty()){
            update accountList;
        }   
    }
    
    public static void oneActive(List<Invoice__c > allInvoiceList){
        Set<Id> acc = new Set<Id>();
        //List<Invoice__c> invoiceList = new List<Invoice__c>([ select id,Status__c from  Invoice__C where Status__C = 'Open'and Account__c=:acc]);
        
        for(Invoice__c i : allInvoiceList){
            acc.add(i.Account__c);
        } 
        
        List<Invoice__c> invoiceList = new List<Invoice__c>([ select id,Status__c from  Invoice__C where Status__C = 'Open'and Account__c=:acc]);
        
        for(Invoice__c i : allInvoiceList){
            
            if(i.Status__c =='Open'){
                if(invoiceList.size()>1){
                    i.adderror('only one application can active');
                }
            } 
        }
        
    }
}