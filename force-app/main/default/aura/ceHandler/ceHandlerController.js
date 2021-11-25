({
	handleComponentEvent  : function(component, event, helper) {
		var message = event.getParam("message");
        component.set("v.messageFromEvent", message);
        var numEventsHandled = parseInt(component.get("v.numEvents")) + 1;
        component.set("v.numEvents", numEventsHandled);

	}
})