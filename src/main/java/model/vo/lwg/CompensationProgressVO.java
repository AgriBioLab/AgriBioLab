package model.vo.lwg;

public class CompensationProgressVO {

	private String appDate;
	private String investDate;
	private String planActionConfirmDate;
	private String executionConfirmDate;
	private String paymentCompletionDate;

	public CompensationProgressVO() {}

	public CompensationProgressVO(String appDate, String investDate, String planActionConfirmDate,
			String executionConfirmDate, String paymentCompletionDate) {
		setAppDate(appDate);
		setInvestDate(investDate);
		setPlanActionConfirmDate(planActionConfirmDate);
		setExecutionConfirmDate(executionConfirmDate);
		setPaymentCompletionDate(paymentCompletionDate);
	}

	public String getAppDate() {
		return appDate;
	}

	public void setAppDate(String appDate) {
		this.appDate = appDate;
	}

	public String getInvestDate() {
		return investDate;
	}

	public void setInvestDate(String investDate) {
		this.investDate = investDate;
	}

	public String getPlanActionConfirmDate() {
		return planActionConfirmDate;
	}

	public void setPlanActionConfirmDate(String planActionConfirmDate) {
		this.planActionConfirmDate = planActionConfirmDate;
	}

	public String getExecutionConfirmDate() {
		return executionConfirmDate;
	}

	public void setExecutionConfirmDate(String executionConfirmDate) {
		this.executionConfirmDate = executionConfirmDate;
	}

	public String getPaymentCompletionDate() {
		return paymentCompletionDate;
	}

	public void setPaymentCompletionDate(String paymentCompletionDate) {
		this.paymentCompletionDate = paymentCompletionDate;
	}

	@Override
	public String toString() {
		return "CompensationProgressVO [appDate=" + appDate + ", investDate=" + investDate + ", planActionConfirmDate="
				+ planActionConfirmDate + ", executionConfirmDate=" + executionConfirmDate + ", paymentCompletionDate="
				+ paymentCompletionDate + "]";
	}
}
