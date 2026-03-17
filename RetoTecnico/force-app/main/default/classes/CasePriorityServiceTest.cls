@isTest
public class CasePriorityServiceTest {

    @isTest
    static void testHighPriorityCase(){

        Case c = new Case(
            Subject = 'Incident Case',
            Type = 'Incidente',
            Origin = 'Chat'
        );

        insert c;

        Case insertedCase = [SELECT Priority FROM Case WHERE Id = :c.Id];

        System.assertEquals('High', insertedCase.Priority);

    }

    @isTest
    static void testMediumPriorityCase(){

        Case c = new Case(
            Subject = 'Client inquiry',
            Type = 'Consulta',
            Origin = 'Teléfono'
        );

        insert c;

        Case insertedCase = [SELECT Priority FROM Case WHERE Id = :c.Id];

        System.assertEquals('Medium', insertedCase.Priority);

    }

    @isTest
    static void testLowPriorityCase(){

        Case c = new Case(
            Subject = 'Other case',
            Type = 'Problem',
            Origin = 'Email'
        );

        insert c;

        Case insertedCase = [SELECT Priority FROM Case WHERE Id = :c.Id];

        System.assertEquals('Low', insertedCase.Priority);

    }

}