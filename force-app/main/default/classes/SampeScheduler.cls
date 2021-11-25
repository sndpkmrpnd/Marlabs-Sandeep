global class SampeScheduler implements Schedulable {
    global void execute(SchedulableContext sc){
        String cronExp = '20 30 8 10 2 ?';
        String jobID = System.schedule('BatchClassPratice', cronExp,  new SampeScheduler());
    }
}