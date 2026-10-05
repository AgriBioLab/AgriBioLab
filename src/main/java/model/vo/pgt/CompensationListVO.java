package model.vo.pgt;

import java.sql.Date;

public class CompensationListVO {
	private String applicationId;
	private String productName;
	private String applicationCategory;
	private String representativeName;
	private String organizationName;
	private Date paymentCompletionDate;
	private int paymentAmount;
	
	public CompensationListVO() {
	}

	public CompensationListVO(String applicationId, String productName, String applicationCategory,
			String representativeName, String organizationName, Date paymentCompletionDate, int paymentAmount) {
		this.applicationId = applicationId;
		this.productName = productName;
		this.applicationCategory = applicationCategory;
		this.representativeName = representativeName;
		this.organizationName = organizationName;
		this.paymentCompletionDate = paymentCompletionDate;
		this.paymentAmount = paymentAmount;
	}

	public String getApplicationId() { return applicationId;}
	public void setApplicationId(String applicationId) { this.applicationId = applicationId; }

	public String getProductName() { return productName; }
	public void setProductName(String productName) { this.productName = productName; }

	public String getApplicationCategory() { return applicationCategory; }
	public void setApplicationCategory(String applicationCategory) { this.applicationCategory = applicationCategory; }

	public String getRepresentativeName() { return representativeName; }
	public void setRepresentativeName(String representativeName) { this.representativeName = representativeName; }

	public String getOrganizationName() { return organizationName; }
	public void setOrganizationName(String organizationName) { this.organizationName = organizationName; }

	public Date getPaymentCompletionDate() { return paymentCompletionDate; }
	public void setPaymentCompletionDate(Date paymentCompletionDate) { this.paymentCompletionDate = paymentCompletionDate; }

	public int getPaymentAmount() { return paymentAmount; }

	public void setPaymentAmount(int paymentAmount) { this.paymentAmount = paymentAmount; }

	@Override
	public String toString() {
		return "CompensationListVO [applicationId=" + applicationId + ", productName=" + productName
				+ ", applicationCategory=" + applicationCategory + ", representativeName=" + representativeName
				+ ", organizationName=" + organizationName + ", paymentCompletionDate=" + paymentCompletionDate
				+ ", paymentAmount=" + paymentAmount + "]";
	}
	
	
	
	
	

}
