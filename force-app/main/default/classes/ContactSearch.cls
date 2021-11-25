public class ContactSearch {
    public static List<Contact> searchForContacts(String lstName, String pstlCode){
        List<Contact> cntctList = new List<Contact>();
        Contact cnt = new contact();
        cnt.LastName = lstName;
        cnt.MailingPostalCode = pstlCode;
        cntctList.add(cnt);
        return cntctList;
    }
}