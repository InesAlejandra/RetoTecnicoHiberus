public with sharing class CaseMilestoneController {

    @AuraEnabled(cacheable=true)
    public static List<CaseMilestoneWrapper> getMilestones(Id caseId){

        List<CaseMilestone> milestones = [
            SELECT Id,
                   MilestoneType.Name,
                   TargetDate,
                   CompletionDate,
                   StartDate
            FROM CaseMilestone
            WHERE CaseId = :caseId
        ];

        List<CaseMilestoneWrapper> result = new List<CaseMilestoneWrapper>();

        for(CaseMilestone cm : milestones){

            CaseMilestoneWrapper wrap = new CaseMilestoneWrapper();

            wrap.name = cm.MilestoneType.Name;
            wrap.targetDate = cm.TargetDate;
            wrap.startDate = cm.StartDate;
            wrap.isCompleted = (cm.CompletionDate != null);

            // cálculo de tiempo restante (en minutos)
            if(cm.TargetDate != null){
                Long diff = cm.TargetDate.getTime() - System.now().getTime();
                wrap.minutesRemaining = diff / (1000 * 60);
            }

            result.add(wrap);
        }

        return result;
    }

    public class CaseMilestoneWrapper{
        @AuraEnabled public String name;
        @AuraEnabled public Datetime targetDate;
        @AuraEnabled public Datetime startDate;
        @AuraEnabled public Boolean isCompleted;
        @AuraEnabled public Long minutesRemaining;
    }

}