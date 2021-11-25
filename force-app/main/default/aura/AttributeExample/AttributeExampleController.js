({
	doClick : function(component, event, helper) {
		alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.Whom'));
        component.set('v.Whom',"Babu");
        var ag = component.find('testId');
        //alert(ag.get('v.value'));
        //ag.set('v.value',67);
	}
})