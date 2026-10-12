package model.vo;

public class DamageApplicationVO {
	private String appId;
	private String organizationName;
	private String appCategory;
	private String productionArea;
	private String disasterType;
	private String productName;
	private String representativeName;


	public DamageApplicationVO() {}

	public DamageApplicationVO(String appId, String organizationName, String appCategory, String productionArea,
			String disasterType, String productName, String representativeName) {
		setAppId(appId);
		setOrganizationName(organizationName);
		setAppCategory(appCategory);
		setProductionArea(productionArea);
		setDisasterType(disasterType);
		setProductName(productName);
		setRepresentativeName(representativeName);
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getAppCategory() {
		return appCategory;
	}

	public void setAppCategory(String appCategory) {
		this.appCategory = appCategory;
	}

	public String getProductionArea() {
		return productionArea;
	}

	public void setProductionArea(String productionArea) {
		this.productionArea = productionArea;
	}

	public String getDisasterType() {
		return disasterType;
	}

	public void setDisasterType(String disasterType) {
		this.disasterType = disasterType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getRepresentativeName() {
		return representativeName;
	}

	public void setRepresentativeName(String representativeName) {
		this.representativeName = representativeName;
	}

	@Override
	public String toString() {
		return "ApplicationReceptionVO [appId=" + appId + ", organizationName=" + organizationName + ", appCategory="
				+ appCategory + ", productionArea=" + productionArea + ", disasterType=" + disasterType
				+ ", productName=" + productName + ", representativeName=" + representativeName + "]";
	}
}
