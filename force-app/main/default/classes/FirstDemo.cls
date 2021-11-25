public class FirstDemo {

    public FirstDemo(){
        System.debug('deafult constructor');
    }
    public FirstDemo(integer i){
        System.debug('parameterized constructor');
    }
    public static void m1(){
        System.debug('static method');
    }
    public void m2(){
        system.debug('non static m');
    }
}