trigger PreventingActiveAccount on Account (before delete) {
    if(trigger.isdelete && trigger.isbefore){
        for(Account acc : trigger.old){
          if(acc.Active__c == 'Yes')
            acc.addError('you can not delete');
        }
    }
}