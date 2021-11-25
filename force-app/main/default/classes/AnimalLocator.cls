public class AnimalLocator { 
    public static String  getAnimalNameById(Integer i){
         String retVal;
         Http http = new Http();
         HttpRequest request = new HttpRequest();
         String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/';
         endpoint = endpoint+i;
         request.setEndpoint(endpoint);
         request.setMethod('GET');
         HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<string, Object> results = (Map<string, Object>) JSON.deserializeUntyped(response.getBody());
            Map<string,object> mapOfAnimals = (map<string,object>) results.get('animal');
            retVal = string.valueof(mapOfAnimals.get('name'));
        }
     return retVal;
    }
}