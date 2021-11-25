trigger SalaryUpdate on Contact (after insert,after update,after delete) {
    if((Trigger.isAfter && Trigger.isInsert) || (Trigger.isAfter && Trigger.isUpdate) || (Trigger.isAfter && Trigger.isDelete)){
        SalaryUpdateHandller.updateSalaryOnAcc(Trigger.new);
    }
}