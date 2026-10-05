package model.vo.pgt;

import java.sql.Date;

public class DamageActionSummaryVO {
	private String actionType;
	private int executionConfirmQuantity;
	private String planActionContent;
	private Date executionConfirmDATE;
	
	public DamageActionSummaryVO() {}
 	
	public DamageActionSummaryVO(String actionType, int executionConfirmQuantity, String planActionContent,
			Date executionConfirmDATE) {
		setActionType(actionType);
		setExecutionConfirmQuantity(executionConfirmQuantity);
		setPlanActionContent(planActionContent);
		setExecutionConfirmDATE(executionConfirmDATE);
	}

	public String getActionType() { return actionType; }
	public void setActionType(String actionType) { this.actionType = actionType;  }

	public int getExecutionConfirmQuantity() { return executionConfirmQuantity; }
	public void setExecutionConfirmQuantity(int executionConfirmQuantity) { this.executionConfirmQuantity = executionConfirmQuantity; }

	public String getPlanActionContent() { return planActionContent; }
	public void setPlanActionContent(String planActionContent) { this.planActionContent = planActionContent; }

	public Date getExecutionConfirmDATE() { return executionConfirmDATE; }
	public void setExecutionConfirmDATE(Date executionConfirmDATE) { this.executionConfirmDATE = executionConfirmDATE; }
	
	
	
	
	

}
