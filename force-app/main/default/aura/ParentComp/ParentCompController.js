({
	doClick : function(component, event, helper) {
		var childComp = component.find('childComp');
        childComp.childe('I am from parent component');
	},
    
    doHandle : function(component, event, helper) {
		alert('calling from child to parent');
	}
})