({
    doInit : function(component, event, helper) {
        var action = component.get('c.getContactList');
        action.setParams({
            accId : component.get('v.recordId'),
        });
        action.setCallback(this,function(response)
                           {
                               var res = response.getReturnValue();
                               console.log(res);
                               component.set('v.contactList',res);
                           });
        $A.enqueueAction(action);
    },
    doRedirect : function(component, event, helper){
        var eventSource = event.getSource();
        var eventId = eventSource.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": eventId,
            "slideDevName": "Details"
        });
        navEvt.fire();
    },
    handleCompEvent : function(component, event, helper) {
        var availableContact = component.get('v.contactList');
        var ContactRecord = event.getParam('ContactRecord');
        availableContact.push(ContactRecord);
        component.set('v.contactList',availableContact);
    }
})