@isTest
public class AnimalLocatorTest {
   @isTest
    public static void testAnimalNameById(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
    }
}