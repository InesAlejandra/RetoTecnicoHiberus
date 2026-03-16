trigger CaseTrigger on Case (before insert, before update, after insert, after update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            System.debug('triggercase');
            CaseTriggerHandler.handleBefore(Trigger.new);
        }
    }

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            CaseTriggerHandler.handleAfter(Trigger.new);
        }
    }
}