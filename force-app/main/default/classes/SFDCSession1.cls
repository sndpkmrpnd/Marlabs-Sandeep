public class SFDCSession1 {
    Public Integer firstNum;
    public Integer seconNum;
    public SFDCSession1(Integer a, Integer b){
        this.firstNum  = a;
        this.seconNum = b;
    }
     public void add(Integer firstNum, Integer secondNum){
               Integer a = firstNum;
               Integer b = secondNum;
               Integer c = a + b;
         System.debug('c::'+c);
    }
}