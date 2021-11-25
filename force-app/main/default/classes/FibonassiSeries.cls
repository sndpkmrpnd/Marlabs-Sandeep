public class FibonassiSeries {
    public static string generateFiboNumb(Integer limitss){
        String fiboString = 'FiboNumbers : ';
        Integer f1=0,f2=1,nextNum=0;
        for(Integer i=0; i<limitss; i++){
           nextNum = f1+f2;
           f1 = f2;
           f2 = nextNum;
           fiboString += ', '+String.valueOf(nextNum);          
        }
        System.debug('fiboString::'+fiboString);
        return fiboString;
    }
}