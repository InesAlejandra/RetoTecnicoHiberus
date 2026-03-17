public with sharing class CasePriorityService {
     public static void assignPriority(List<Case> cases){

        for(Case c : cases){

            if(c.Type == 'Incidente' && c.Origin == 'Chat'){
                c.Priority = 'High';
                System.debug('alta');
            }
            else if(c.Type == 'Consulta' && c.Origin == 'Teléfono'){
                c.Priority = 'Medium';
                System.debug('media');
            }
            else{
                c.Priority = 'Low';
                System.debug('baja');
            }

        }

    }

    public static void notifyHighPriority(List<Case> cases){

        List<Case> highPriorityCases = new List<Case>();

        for(Case c : cases){

            if(c.Priority == 'High'){
                highPriorityCases.add(c);
            }

        }

        if(!highPriorityCases.isEmpty()){
            EmailService.sendHighPriorityNotification(highPriorityCases);
        }

    }
}