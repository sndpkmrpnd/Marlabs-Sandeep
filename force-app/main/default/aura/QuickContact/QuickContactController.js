({
    doSave : function(component, event, helper) {
        debugger;
        var action = component.get("c.insertContact");
        action.setParams({
            "con" : component.get("v.createContact"),
            "accId" : component.get("v.accId")
        });
        action.setCallback(this,function(response)
                           {
                               var state = response.getState();
                               if(state==='SUCCESS' || state==='DRAFT'){
                                    var res = response.getReturnValue();
                                    var componentEvent = component.getEvent('quickContact');
                                    Console.log('componentEvent::',componentEvent);
                                    componentEvent.setParams({
                                        ContactRecord : res
                                    });
                                    componentEvent.fire();
                               }
                               else if(state==='INCOMPLETE'){
                                   
                               }
                               else if(state==='ERROR'){
                                  var errors = response.getError();
                                  console.log('Error',errors);
                                  console.log('DuplicateResults',errors[0].duplicateResults);
                                  console.log('FieldErrors',errors[0].fieldErrors);
                                  console.log('pageErrors',errors[0].pageErrors);
                                  console.log('pageErrorMsg',errors[0].pageErrors[0].message);
                                  if(errors || errors[0].message){
                                      
                                  }
                               }
                               console.log(res);
                           });
        $A.enqueueAction(action);	
    }
})