public class sendAccountUsingRESTAPI {
    private final String clientId = '3MVG9pe2TCoA1Pf7yRjzlrYlV9yMgCAmj5neOdcR4P.5S3P7r4B4uQFGzKI6ETaL59rYEZ1zacU6U1D2AlD9h';
    private final String clientSecret = '10E1696A034B3F7079F6384840F91B34ADE9919F0720C5A6B2567927D5E8C76C';
    private final String username = 'sndpkmrpnd@etmarlabs.com';
    private final String password = 'Trailhead@123';
    public class deserializeResponse
    {
        public String id;
        public String access_token;
    }
    public String ReturnAccessToken (SendAccountUsingRESTAPI acount)
    {
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://ap8.salesforce.com/services/oauth2/token');
                        HttpResponse res = h.send(req);
                        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
                        system.debug('@@@@access_token@@'+resp1 );
                        return resp1.access_token;
                        }
                        
                        public static list<Contact> callgetContact (String accId)
                        {
                            SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
                            String accessToken;
                            accessToken = acount1.ReturnAccessToken (acount1);
                            list<Contact> LstContact=new List<Contact>();
                            if(accessToken != null){
                                String endPoint = 'https://vidyut.salesforce.com/services/apexrest/v1/getContacts/' +accId;
                                Http h2 = new Http();
                                HttpRequest req1 = new HttpRequest();
                                req1.setHeader('Authorization','Bearer ' + accessToken);
                                req1.setHeader('Content-Type','application/json');
                                req1.setHeader('accept','application/json');
                                //req1.setBody(jsonstr);
                                req1.setMethod('GET');
                                req1.setEndpoint(endPoint);
                                HttpResponse res1 = h2.send(req1);
                                String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
                                system.debug('@@@RESPONSE@@'+trimmedResponse);
                                JSONParser parser = JSON.createParser(res1.getBody());
                                set<Contact> contList=new set<Contact>();
                                
                                while (parser.nextToken() != null) {
                                    //Id
                                    
                                    if((parser.getCurrentToken() == JSONToken.FIELD_NAME) ){
                                        Contact cont;
                                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                                            // Get the value.
                                            parser.nextToken();
                                            // Compute the grand total price for all invoices.
                                            string sId= parser.getText();
                                            cont=new Contact();
                                            cont.Id=sId;
                                            system.debug('Id@@@' + sId);
                                            
                                            parser.nextToken();
                                            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                                                (parser.getText() == 'Name')) {
                                                    // Get the value.
                                                    parser.nextToken();
                                                    // Compute the grand total price for all invoices.
                                                    string sName= parser.getText();
                                                    cont.LastName=sName;
                                                    system.debug('Name@@@' + sName );
                                                }
                                            
                                            //Email
                                            parser.nextToken();
                                            if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && 
                                                (parser.getText() == 'Email')) {
                                                    // Get the value.
                                                    parser.nextToken();
                                                    // Compute the grand total price for all invoices.
                                                    string sEmail= parser.getText();
                                                    cont.Email=sEmail;
                                                    system.debug('Email@@@' + sEmail);
                                                }
                                            
                                            
                                        }
                                        contList.add(cont); 
                                    }
                                    
                                    
                                    
                                    contList.remove(null);
                                    
                                }
                                LstContact.AddAll(contList);
                                system.debug('ContList@@@@' +Json.serialize(LstContact));
                                
                                
                                
                                
                            }
                            return LstContact;
                        }
                        }