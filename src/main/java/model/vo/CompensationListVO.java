package model.vo;

import java.sql.Date;

public class CompensationListVO {
	private String appId;
	private String productName;
	private String appCategory;
	private String representativeName;
	private String organizationName;
	private Date paymentCompletionDate;
	private int paymentAmount;
	private String paymentInstitution;
	
	public CompensationListVO() {
	}

	public CompensationListVO(String appId, String productName, String appCategory,
			String representativeName, String organizationName, Date paymentCompletionDate, int paymentAmount, String paymentInstitution) {
		setAppId(appId);
		setProductName(productName);
		setAppCategory(appCategory);
		setRepresentativeName(representativeName);
		setOrganizationName(organizationName);
		setPaymentCompletionDate(paymentCompletionDate);
		setPaymentAmount(paymentAmount);
		setPaymentInstitution(paymentInstitution);
	}

	public String getAppId() { return appId;}
	public void setAppId(String appId) { this.appId = appId; }

	public String getProductName() { return productName; }
	public void setProductName(String productName) { this.productName = productName; }

	public String getAppCategory() { return appCategory; }
	public void setAppCategory(String appCategory) { this.appCategory = appCategory; }

	public String getRepresentativeName() { return representativeName; }
	public void setRepresentativeName(String representativeName) { this.representativeName = representativeName; }

	public String getOrganizationName() { return organizationName; }
	public void setOrganizationName(String organizationName) { this.organizationName = organizationName; }

	public Date getPaymentCompletionDate() { return paymentCompletionDate; }
	public void setPaymentCompletionDate(Date paymentCompletionDate) { this.paymentCompletionDate = paymentCompletionDate; }

	public int getPaymentAmount() { return paymentAmount; }
	public void setPaymentAmount(int paymentAmount) { this.paymentAmount = paymentAmount; }
	
	public String getPaymentInstitution() { return paymentInstitution; }
	public void setPaymentInstitution(String paymentInstitution) { this.paymentInstitution = paymentInstitution; }

	@Override
	public String toString() {
		return "CompensationListVO [appId=" + appId + ", productName=" + productName + ", appCategory=" + appCategory
				+ ", representativeName=" + representativeName + ", organizationName=" + organizationName
				+ ", paymentCompletionDate=" + paymentCompletionDate + ", paymentAmount=" + paymentAmount
				+ ", paymentInstitution=" + paymentInstitution + "]";
	}
	
}
