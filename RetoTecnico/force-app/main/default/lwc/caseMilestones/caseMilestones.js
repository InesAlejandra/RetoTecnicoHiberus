import { LightningElement, api, wire } from 'lwc';
import getMilestones from '@salesforce/apex/CaseMilestoneController.getMilestones';

export default class CaseMilestones extends LightningElement {

    @api recordId;
    milestones = [];
    error;

    @wire(getMilestones, { caseId: '$recordId' })
    wiredMilestones({ data, error }) {
        if (data) {
            this.milestones = data.map(m => {
                return {
                    ...m,
                    statusClass: this.getStatusClass(m),
                    timeLabel: this.formatTime(m.minutesRemaining)
                };
            });
        } else if (error) {
            this.error = error;
        }
    }

    getStatusClass(milestone) {

        if (milestone.isCompleted) {
            return 'completed';
        }

        if (milestone.minutesRemaining <= 0) {
            return 'overdue';
        } else if (milestone.minutesRemaining < 60) {
            return 'warning';
        } else {
            return 'ontrack';
        }
    }

    formatTime(minutes) {
        if (!minutes) return 'N/A';

        if (minutes <= 0) return 'Vencido';

        let hours = Math.floor(minutes / 60);
        let mins = minutes % 60;

        return `${hours}h ${mins}m restantes`;
    }

}