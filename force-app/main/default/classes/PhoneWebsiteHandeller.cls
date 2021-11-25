public class PhoneWebsiteHandeller {
     
    public static void phoneUpdate(List<Account> accountList){
        for(Account acc : accountList){
            if(acc.Phone!=null)
                acc.phone=null;
        }
    }
    
        public static void websiteUpdate(List<Account> accountList){
        for(Account acc : accountList){
            if(acc.website!=null)
                acc.website='www.et.com';
        }
    }
}