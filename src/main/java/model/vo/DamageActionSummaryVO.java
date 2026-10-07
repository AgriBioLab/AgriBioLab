package model.vo;

import java.sql.Date;

public class DamageActionSummaryVO {
	private String actionType;
	private int executionConfirmQuantity;
	private String planActionContent;
	private Date executionConfirmDate;
	
	public DamageActionSummaryVO() {}
 	
	public DamageActionSummaryVO(String actionType, int executionConfirmQuantity, String planActionContent,
			Date executionConfirmDate) {
		setActionType(actionType);
		setExecutionConfirmQuantity(executionConfirmQuantity);
		setPlanActionContent(planActionContent);
		setexecutionConfirmDate(executionConfirmDate);
	}

	public String getActionType() { return actionType; }
	public void setActionType(String actionType) { this.actionType = actionType;  }

	public int getExecutionConfirmQuantity() { return executionConfirmQuantity; }
	public void setExecutionConfirmQuantity(int executionConfirmQuantity) { this.executionConfirmQuantity = executionConfirmQuantity; }

	public String getPlanActionContent() { return planActionContent; }
	public void setPlanActionContent(String planActionContent) { this.planActionContent = planActionContent; }

	public Date getexecutionConfirmDate() { return executionConfirmDate; }
	public void setexecutionConfirmDate(Date executionConfirmDate) { this.executionConfirmDate = executionConfirmDate; }
	
	
	
	
	

}
