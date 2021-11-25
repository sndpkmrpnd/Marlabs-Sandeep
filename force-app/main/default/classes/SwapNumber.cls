public class SwapNumber {
    public static void swapNum(Integer a, Integer b){
        a = a + b;
        b = a - b;
        a = a - b;
        system.debug('a value: '+a);
        system.debug('b value: '+b);
    }
}