({  
	doInit : function(component, event, helper) {
        debugger;
		helper.fetchOppHelper(null, component);
	},
    searchOpportunites : function(component, event, helper) {
        var searchValue = component.find("serchKeyFieldId").get("v.value");
        console.log("searchValue: ", searchValue);
        helper.fetchOppHelper(searchValue, component);
    }
})