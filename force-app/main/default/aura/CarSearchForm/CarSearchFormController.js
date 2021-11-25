({
    doInit : function(component, event, helper) {
        debugger;
        var createCarRecord = $A.get("e.force:createRecord");
        if(createCarRecord){
            component.set("v.showNew", true);
        }  else{
            component.set("v.showNew", false);
            console.log('event is not supported');
        }      
        helper.getCarType(component, helper);
        /*var stringArry = ['Sports Car', "Luxury Car", 'Van'];
        component.set("v.carTypes",stringArry);
        alert("Component is Initialized");*/
    },
    
    onSearchClick : function(component, event, helper) {
        helper.handleOnSearchClick(component, event, helper);		
    },
    
    createRecored : function(component, event, helper) {
       	var createCarRecord = $A.get("e.force:createRecord");
        createCarRecord.setParams({
            "entityApiName": "Car_Type__c"
        });
        createCarRecord.fire();
    },
    
    neValueSelected : function(component, event, helper) {
        debugger;
        var carTypeId = component.find("carTypeList").get("v.value");
        alert(carTypeId+' Option selected');
    },
    
    /* toogleButton : function(component, event, helper) {
      var currentValue = component.get("v.isNewAvailable");	
        if(currentValue){
            component.set("v.isNewAvailable",false);
        }
        else{
            component.set("v.isNewAvailable",true);
        }
	},*/
    
    /* handleRender : function(component, event, helper) {
      alert("Component is Rendered");
	}*/
})