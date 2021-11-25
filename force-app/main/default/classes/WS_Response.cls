global virtual class WS_Response {
    
    global String status; 
    global String errorMessage;
    global String successMessage;
    global String statusCode;
    
    global WS_Response(){
        status          = 'success';
        statusCode		= '200';
        errorMessage='';
        successMessage='';    
    }
}