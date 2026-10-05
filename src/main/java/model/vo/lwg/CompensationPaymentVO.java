package model.vo.lwg;

public class CompensationPaymentVO {
	private String paymentDecisionDate;
	private String paymentInstitution;
	private String recipientName;
	private String paymentAccountNumber;
	private String paymentCompletionDate;
	private String paymentChargerName;
	private int paymentAmount;

	public CompensationPaymentVO() {}

	public CompensationPaymentVO(String paymentDecisionDate, String paymentInstitution, String recipientName,
			String paymentAccountNumber, String paymentCompletionDate, String paymentChargerName, int paymentAmount) {
		setPaymentDecisionDate(paymentDecisionDate);
		setPaymentInstitution(paymentInstitution);
		setRecipientName(recipientName);
		setPaymentAccountNumber(paymentAccountNumber);
		setPaymentCompletionDate(paymentCompletionDate);
		setPaymentChargerName(paymentChargerName);
		setPaymentAmount(paymentAmount);
	}

	public String getPaymentDecisionDate() {
		return paymentDecisionDate;
	}

	public void setPaymentDecisionDate(String paymentDecisionDate) {
		this.paymentDecisionDate = paymentDecisionDate;
	}

	public String getPaymentInstitution() {
		return paymentInstitution;
	}

	public void setPaymentInstitution(String paymentInstitution) {
		this.paymentInstitution = paymentInstitution;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getPaymentAccountNumber() {
		return paymentAccountNumber;
	}

	public void setPaymentAccountNumber(String paymentAccountNumber) {
		this.paymentAccountNumber = paymentAccountNumber;
	}

	public String getPaymentCompletionDate() {
		return paymentCompletionDate;
	}

	public void setPaymentCompletionDate(String paymentCompletionDate) {
		this.paymentCompletionDate = paymentCompletionDate;
	}

	public String getPaymentChargerName() {
		return paymentChargerName;
	}

	public void setPaymentChargerName(String paymentChargerName) {
		this.paymentChargerName = paymentChargerName;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	@Override
	public String toString() {
		return "CompensationPaymentVO [paymentDecisionDate=" + paymentDecisionDate + ", paymentInstitution="
				+ paymentInstitution + ", recipientName=" + recipientName + ", paymentAccountNumber="
				+ paymentAccountNumber + ", paymentCompletionDate=" + paymentCompletionDate + ", paymentChargerName="
				+ paymentChargerName + ", paymentAmount=" + paymentAmount + "]";
	}
}
