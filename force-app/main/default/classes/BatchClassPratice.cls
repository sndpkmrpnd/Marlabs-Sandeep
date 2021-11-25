global class BatchClassPratice implements Database.Batchable<SObject>, Database.Stateful{
    private Integer magNum = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Name from Account LIMIT 100');
    }
    global void execute(Database.BatchableContext bc, List<Account> acc){
        for(Integer i = 0; i<=5; i++){
            magNum++;
        }
    }
    global void finish(Database.BatchableContext bc){
        System.debug('In the finish method');
        System.debug('magNum::'+magNum);
    }
}