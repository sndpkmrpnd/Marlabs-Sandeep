global class AccRemotingController {
    public String accountName { get; set; }
    public static List<Account> accounts { get; set; }

    public AccRemotingController(){}

    @RemoteAction
    global static List<Account> getAccount(){
       // String updatedAccName = '%'+accountName+'%';
        accounts = [select id, name, phone, type, Email__c from Account];
        System.debug('Account Size : '+accounts.size());
        return accounts;
    }
}