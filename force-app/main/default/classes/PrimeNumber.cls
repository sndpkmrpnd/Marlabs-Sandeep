public class PrimeNumber {
    public static void checkPrime(Integer num){
        Integer count = 0;
        for(integer i = 2; i<=num; i++){
            if(Math.mod(num, i) == 0){
                count++;
            }
        }
        If(count == 1){
            System.debug(num+' is a prime number');
        }
        else if(num == 1){
            System.debug(num+' is not a prime number');
        }
        else{
            System.debug(num+' is not a prime number');
        }
        
    }
}