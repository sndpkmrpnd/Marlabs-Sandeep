public class PalindromeNumber {
    Public static void checkPalindrome(Integer num){
        Integer temp = num;
        Integer sum = 0;
        Integer reminder,divideNum;
        while(num > 0){
            reminder = math.mod(num,10); //getting reminder
            System.debug('reminder::'+reminder);
            sum = (sum*10)+reminder;  //reversing number
            System.debug('sum::'+sum);
            num = num/10;
            System.debug('num::'+num);
        }
        If(temp == sum){
            System.debug('Palindrom');
        }
        else{
            System.debug('Not Palindrom');
        }
    }
}