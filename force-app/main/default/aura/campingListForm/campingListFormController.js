({
    clickCreateItem: function(component, event, helper) {
        debugger;
        var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validCamping){
            var addItm = component.get("v.newItem");
            //helper.createItem(component, addItm);
        var createEvent = component.getEvent("addItem");
        createEvent.setParams({
            "item" : "addItm"
        })
        createEvent.fire();
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                                   'Name': '',
                                   'Quantity__c': 0,
                                   'Price__c': 0,
                                   'Packed__c': false });
        }
    }
})