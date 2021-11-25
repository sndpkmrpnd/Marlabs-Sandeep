({

    init: function(cmp, event, helper) {
            debugger;
        var pageReference = cmp.get("v.pageReference");
        cmp.set("v.firstName", pageReference.state.firstName);
        cmp.set("v.lastName", pageReference.state.lastName);
    }
})