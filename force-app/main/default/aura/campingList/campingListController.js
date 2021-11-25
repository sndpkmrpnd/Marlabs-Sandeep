({
    /*clickCreateItem : function(component, event, helper) {
        var isFormValid = component.find("campingItemForm").reduce(function(isValid, inputCmp){
        	inputCmp.showHelpMessageIfInvalid();    	
            return isValid && inputCmp.get("v.validity").valid;
        });
        
        if (isFormValid) {
            var newCampingItem = JSON.parse(JSON.stringify(component.get("v.newItem")));
            console.log(JSON.parse(JSON.stringify(newCampingItem)), JSON.stringify(newCampingItem));
            var campingItems = JSON.parse(JSON.stringify(component.get("v.items")));
            campingItems.push(newCampingItem);
            component.set("v.items",campingItems);
            component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});

        }
	}
    	clickCreateItem : function(component, event, helper) {
        var isFormValid = component.find("campingItemForm").reduce(function(isValid, inputCmp){
        	inputCmp.showHelpMessageIfInvalid();    	
            return isValid && inputCmp.get("v.validity").valid;
        });
        
        if (isFormValid) {
            
            var newCampingItem = component.get("v.newItem");
            helper.createItem(component,newCampingItem);
           
        }
	},*/
    // Load expenses from Salesforce
    doInit: function(component, event, helper) {
        
        // Create the action
        var action = component.get("c.getItems");
        
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    handleAddItem: function(component, event, helper) {
        debugger;
        var newItem =event.getParam("item"); 
        var action = component.get("c.saveItem");
        action.setParams({"item": newItem});
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(newItem);
                component.set("v.items",items);
            }
        });
        $A.enqueueAction(action);
        
    } 
})