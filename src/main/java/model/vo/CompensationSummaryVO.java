package model.vo;

import java.sql.Date;

public class CompensationSummaryVO {
	private String applicationId;
    private String applicationStatus;
    private int compensationClaimAmount;
    private int finalCompensationAmount;
    private String actionChargerName;
    private Date claimDate;
    private Date paymentCompletionDate;
    
    public CompensationSummaryVO() {}
    
    public CompensationSummaryVO(String applicationId, String applicationStatus, int compensationClaimAmount,
			int finalCompensationAmount, String actionChargerName, Date claimDate, Date paymentCompletionDate) {
    	setApplicationId(applicationId);
    	setApplicationStatus(applicationStatus);
    	setCompensationClaimAmount(compensationClaimAmount);
    	setFinalCompensationAmount(finalCompensationAmount);
    	setActionChargerName(actionChargerName);
    	setClaimDate(claimDate);
    	setPaymentCompletionDate(paymentCompletionDate);
	}
    
	public String getApplicationId() { return applicationId; }
    public void setApplicationId(String appId) { this.applicationId = appId; }
    
    public String getApplicationStatus() { return applicationStatus; }
    public void setApplicationStatus(String appStatus) { this.applicationStatus = appStatus; }
    
    public int getCompensationClaimAmount() { return compensationClaimAmount; }
    public void setCompensationClaimAmount(int compensationClaimAmount) { this.compensationClaimAmount = compensationClaimAmount; }
    
    public int getFinalCompensationAmount() { return finalCompensationAmount; }
    public void setFinalCompensationAmount(int finalCompensationAmount) { this.finalCompensationAmount = finalCompensationAmount; }
    
    public String getActionChargerName() { return actionChargerName; }
    public void setActionChargerName(String actionChargerName) { this.actionChargerName = actionChargerName; }
    
    public Date getClaimDate() { return claimDate; }
    public void setClaimDate(Date claimDate) { this.claimDate = claimDate; }
    
    public Date getPaymentCompletionDate() { return paymentCompletionDate; }
    public void setPaymentCompletionDate(Date paymentCompletionDate) { this.paymentCompletionDate = paymentCompletionDate; }
}
