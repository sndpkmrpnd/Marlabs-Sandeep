({
    doInit : function(component, event, helper) {
        component.set('v.test', 'Value Initiated');
    },
    doChange : function(component, event, helper) {
        alert("Value Changed");
        var appEvent = $A.get("e.c:ApplicationEvent");
        appEvent.fire();
    },
    checkSystemEvent : function(component, event, helper) {
        component.set('v.test', 'After ButtonClick');
    }
})