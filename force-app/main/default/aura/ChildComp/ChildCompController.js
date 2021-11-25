({
	handleChild : function(component, event, helper) {
		var params = event.getParam('arguments');
        if(params){
            var param1 = params.param1;
            alert('Calling from child controller '+param1);
        }
	}
})