public with sharing class EmailService {
    public static void sendHighPriorityNotification(List<Case> cases){

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(Case c : cases){

            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            mail.setToAddresses(new List<String>{'ilburbano95@test.com'});

            mail.setSubject('Caso de Alta Prioridad Creado');

            mail.setPlainTextBody(
                'Se ha creado un caso de alta prioridad.\n\n' +
                'Case Number: ' + c.CaseNumber + '\n' +
                'Tipo: ' + c.Type + '\n' +
                'Origen: ' + c.Origin
            );

            emails.add(mail);

        }

        if(!emails.isEmpty()){
            Messaging.sendEmail(emails);
        }

    }

}