public with sharing class CaseTriggerHandler {

    public static void handleBefore(List<Case> cases){

        CasePriorityService.assignPriority(cases);

    }

    public static void handleAfter(List<Case> cases){

        CasePriorityService.notifyHighPriority(cases);

    }

}