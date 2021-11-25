({
	handleClick : function(component, event, helper) {
		var clicked = event.getSource();
        var btnMessage = clicked.get('v.label');
        component.set("v.message",btnMessage);
	}
})