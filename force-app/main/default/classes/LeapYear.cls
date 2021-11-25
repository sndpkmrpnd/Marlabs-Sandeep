public class LeapYear {
    public static boolean isLeapYear(Integer year){
        boolean isLeap = false;
        if(Math.mod(year, 400) == 0 || Math.mod(year, 4) == 0){
            isLeap = true;
        }
        System.debug('isLeap:'+isLeap);
        return isLeap;
    }
}