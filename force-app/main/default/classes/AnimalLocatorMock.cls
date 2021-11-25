global class AnimalLocatorMock implements HttpCalloutMock {
    public static HttpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"animal":{"id":1,"name":"tiger","eats":"dear","says":"grow"}}');
        res.setStatusCode(200);
        return res; 
    }
}