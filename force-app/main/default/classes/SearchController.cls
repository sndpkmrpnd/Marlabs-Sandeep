public class SearchController 
{  
    public String searchKey {get;set;}
    public String updateKey {get;set;}
    public String updatePhone {get;set;}
    public Map<Id,sObjectWrapper> wrapperMap;
    public list <Contact> con {get;set;}
    
    public SearchController()
    {  
        
        wrapperMap = new Map<Id,sObjectWrapper>();  
        
    }  
    public void search()
    {
        if(!String.isBlank(searchKey)){
            string searchquery='select Name,department,id,title,email,phone from Contact where name like \'%'+searchKey+'%\'';
            //con= Database.query(searchquery);
            
            System.debug(Database.query(searchquery));
            clearContacts();
            for(Contact con : Database.query(searchquery))
            {  
                wrapperMap.put(con.Id,new sObjectWrapper(con,false));  
                
            }
        }
        
        
    }
    
    public List<sObjectWrapper> getRecords(){
        return wrapperMap.values();
    }
    
    public void clearContacts()
    {
        wrapperMap.clear();
    }
    
    public class sObjectWrapper
    {  
        public boolean isSelected{get;set;}  
        public Contact myContact{get;set;}  
        public String editID{get;set;}
        
        public sObjectWrapper(Contact myContact,Boolean isSelected)
        {  
            this.myContact = myContact;  
            
            this.isSelected = isSelected;  
        }  
    }
    public void deleteRecords(){  
        List<Contact> conToDel = new List<Contact>();  
        System.debug('--->'+wrapperMap);
        for(sObjectWrapper wrap : wrapperMap.values()){  
            
            if(wrap.isSelected){  
                conToDel.add(wrap.myContact);  
            }  
        }  
        system.debug('---> '+conToDel);
        if(!conToDel.isEmpty())
            delete conToDel;
        //wrappers = getData();
        search();  
    } 
    
    
    //------------pop up---------
    public boolean displayPopup {get; set;}     
    public String editID{get;set;}
    
    public void closePopup() 
    {        
        displayPopup = false;   
        System.debug('popup closed');
    }     
    public void showPopup() 
    {        
        displayPopup = true; 
        updateKey = wrapperMap.get(editID).myContact.Department;
        updatePhone = wrapperMap.get(editID).myContact.Phone;
        System.debug('showpop up opened');
    }
    public void save()
    {
        System.debug(updateKey);
        //List<Contact> conts=[select id,name,email,phone,department from Contact where ID=:editID];
        if(wrapperMap.containsKey(editID)){
            Contact conRec = wrapperMap.get(editID).myContact;
            System.debug('printing id'+conRec);
            conRec.Department=updateKey;
            conRec.phone=updatePhone;
            System.debug('yupiee updated');
            update conRec;
            updateKey ='';
            updatePhone = '';
            closePopup();
        }
   
    }
    public PageReference printView() {
    PageReference oPageRef = Page.PdfView;
    oPageRef.setRedirect(false);

    return oPageRef;
}
}