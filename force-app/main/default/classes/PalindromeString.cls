public class PalindromeString {
    public static void checkStringPalindrome(String original){
      String reverse = ''; 
      integer length = original.length();   
        for ( integer i = length - 1; i >= 0; i-- ){
           reverse += original.subString(i,i+1);
        }         
        System.debug('reverse:'+reverse);
    }
}