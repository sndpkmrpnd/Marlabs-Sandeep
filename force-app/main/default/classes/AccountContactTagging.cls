public class AccountContactTagging {
    public static void tagAccount(LIST<Contact> conList){
    
    system.debug('conList::'+conList);
    Account accList = [SELECT id,Name FROM Account WHERE id = '0010o00002LNByb' limit 1];
    List<Contact> updateconList = new List<Contact>();
    String accID = accList.id;
        system.debug('accID::'+accID);
        for(Contact c : conList){
            string dep = c.Department;
            system.debug('dep::'+dep);
            
            if(c.Department == 'EDUCATION'){
                contact con = new contact();
                con.id =c.id;
                con.AccountId = accID;
                system.debug('C.AccountId::'+C.AccountId);
               updateconList.add(con); 
            }
            if(!updateconList.isEmpty()){
                update updateconList;
                system.debug('updateconList::'+updateconList);
            }
           
        }
        
    }
}