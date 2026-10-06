package model.vo;

public class InvestigationSummaryVO {
	private String investDate;
	private int damageRate;
	private int damageArea;

	public InvestigationSummaryVO() {}

	public InvestigationSummaryVO(String investDate, int damageRate, int damageArea) {
		setInvestDate(investDate);
		setDamageRate(damageRate);
		setDamageArea(damageArea);
	}

	public String getInvestDate() {
		return investDate;
	}

	public void setInvestDate(String investDate) {
		this.investDate = investDate;
	}

	public int getDamageRate() {
		return damageRate;
	}

	public void setDamageRate(int damageRate) {
		this.damageRate = damageRate;
	}

	public int getDamageArea() {
		return damageArea;
	}

	public void setDamageArea(int damageArea) {
		this.damageArea = damageArea;
	}

	@Override
	public String toString() {
		return "InvestigationSummaryVO [investDate=" + investDate + ", damageRate=" + damageRate + ", damageArea="
				+ damageArea + "]";
	}
}
