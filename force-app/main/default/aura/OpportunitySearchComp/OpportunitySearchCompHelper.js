({
	fetchOppHelper : function(searchValue, component) {
        console.log("searchValue::",searchValue);
		component.set("v.columnToDisplay", [
            {label: "OPP Name",fieldName: "Name",type:"text"},
            {label: "Amount",fieldName: "Amount", type:"currency"},
            {label: "Close Date",fieldName: "CloseDate", type:"date"}
        ]);
        
        var action = component.get("c.getOpportunityRec");
        action.setParams({
            "recName" : searchValue
        });
        console.log("action::",action);
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log("state::",state);
            if(state=="SUCCESS"){
                console.log("response.getReturnValue()::",response.getReturnValue());
                component.set("v.listOfOpportunity",response.getReturnValue());
            }
            else{
                alert("An error occured while fetching the data");
            }
        });
        $A.enqueueAction(action);
	}
})