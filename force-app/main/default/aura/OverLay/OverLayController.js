/*({
    navigateURL : function(component, event, helper) {   
     debugger;
      var pageReference = component.find("v.navi");  
      var pageReferenceNav = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: "00B0o00000CEnTUEA1"
            }
        };
        pageReference.navigate(pageReferenceNav);
    }
})*/


// auraNavigatorController.js
({
    init : function(cmp, event, helper) {
        debugger;
        var navService = cmp.find("navService");
        var pageReference = {
            
            "type": "standard__component",
            "attributes": {
                "componentName": "c__BeerExplorer"    
            },    
            "state": {
                "myAttr" : "attrValue"  
            }
        };
        cmp.set("v.pageReference", pageReference);
        var defaultUrl = "#";
        navService.generateUrl(pageReference)
        .then($A.getCallback(function(url) {
            cmp.set("v.url", url ? url : defaultUrl);
        }), $A.getCallback(function(error) {
            cmp.set("v.url", defaultUrl);
        }));
    },
    
    handleClick: function(cmp, event, helper) {
        debugger;
        var navService = cmp.find("navService");
        // Uses the pageReference definition in the init handler
        var pageReference = cmp.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageReference);
    },
    
    createModal : function(component, event, helper) {
        component.find('overLayLib').showCustomModal({
            header: "Application Confirmation",
            body: "This is Test",
            footer:"Footer",
            showCloseButton: true,
            closeCallback: function() {
                alert('You closed the alert!');
            }
        })
        
    },
    
    handleLoad : function(component, event, helper) {
        
    },
    handleSubmit : function(component, event, helper) {
        alert('submit handled');
    },
    handleSuccess : function(component, event, helper) {
        
    },
    createButton : function(component, event, helper) {
        $A.createComponent('lightning:button',
                          {
                              label : "Press Me!" ,
                              value : "Press Me!",
                              onclick : component.getReference("c.handleSubmit")
                          }, function(newButton, status, errorMessage){
                              alert(status);
                              if(status === 'SUCCESS'){
                                  var body = component.get('v.body');
                                  body.push(newButton);
                                  component.set('v.body',body);
                              }
                          }
                         );
    }
})