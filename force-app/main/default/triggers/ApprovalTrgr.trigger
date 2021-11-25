trigger ApprovalTrgr on Approval_Record__c (before insert,before update) {
     ApprovalHandeller.papulateName(trigger.new);
    //ApprovalHandeller.duplicateFind(trigger.new);
}