public with sharing class CarTypeSearch {
   @AuraEnabled
    public static List<Car_Type__c> getCarTypes(){
        return [select id,Name from Car_Type__c];
    }
}