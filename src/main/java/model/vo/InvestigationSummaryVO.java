package model.vo;

public class InvestigationSummaryVO {
	private int num;
	private String investDate;
	private int damageRate;
	private int damageArea;

	public InvestigationSummaryVO() {}

	public InvestigationSummaryVO(int num, String investDate, int damageRate, int damageArea) {
		setNum(num);
		setInvestDate(investDate);
		setDamageRate(damageRate);
		setDamageArea(damageArea);
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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
		return "InvestigationSummaryVO [num=" + num + ", investDate=" + investDate + ", damageRate=" + damageRate
				+ ", damageArea=" + damageArea + "]";
	}
}
