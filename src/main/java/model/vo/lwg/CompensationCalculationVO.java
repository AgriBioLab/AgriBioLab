package model.vo.lwg;

public class CompensationCalculationVO {

	private String calcCriterion;
	private int calcQuantity;
	private String differenceReason;
	private String calcInstitutionName;
	private String calcCompletionDate;
	private int finalCompensationAmount;
	private int criterionUnitPrice;
	private double compensationAppliedRate;
	private String calcChargerName;

	public CompensationCalculationVO() {}

	public CompensationCalculationVO(String calcCriterion, int calcQuantity, String differenceReason,
			String calcInstitutionName, String calcCompletionDate, int finalCompensationAmount, int criterionUnitPrice,
			double compensationAppliedRate, String calcChargerName) {
		setCalcCriterion(calcCriterion);
		setCalcQuantity(calcQuantity);
		setDifferenceReason(differenceReason);
		setCalcInstitutionName(calcInstitutionName);
		setCalcCompletionDate(calcCompletionDate);
		setFinalCompensationAmount(finalCompensationAmount);
		setCriterionUnitPrice(criterionUnitPrice);
		setCompensationAppliedRate(compensationAppliedRate);
		setCalcChargerName(calcChargerName);		
	}

	public String getCalcCriterion() {
		return calcCriterion;
	}

	public void setCalcCriterion(String calcCriterion) {
		this.calcCriterion = calcCriterion;
	}

	public int getCalcQuantity() {
		return calcQuantity;
	}

	public void setCalcQuantity(int calcQuantity) {
		this.calcQuantity = calcQuantity;
	}

	public String getDifferenceReason() {
		return differenceReason;
	}

	public void setDifferenceReason(String differenceReason) {
		this.differenceReason = differenceReason;
	}

	public String getCalcInstitutionName() {
		return calcInstitutionName;
	}

	public void setCalcInstitutionName(String calcInstitutionName) {
		this.calcInstitutionName = calcInstitutionName;
	}

	public String getCalcCompletionDate() {
		return calcCompletionDate;
	}

	public void setCalcCompletionDate(String calcCompletionDate) {
		this.calcCompletionDate = calcCompletionDate;
	}

	public int getFinalCompensationAmount() {
		return finalCompensationAmount;
	}

	public void setFinalCompensationAmount(int finalCompensationAmount) {
		this.finalCompensationAmount = finalCompensationAmount;
	}

	public int getCriterionUnitPrice() {
		return criterionUnitPrice;
	}

	public void setCriterionUnitPrice(int criterionUnitPrice) {
		this.criterionUnitPrice = criterionUnitPrice;
	}

	public double getCompensationAppliedRate() {
		return compensationAppliedRate;
	}

	public void setCompensationAppliedRate(double compensationAppliedRate) {
		this.compensationAppliedRate = compensationAppliedRate;
	}

	public String getCalcChargerName() {
		return calcChargerName;
	}

	public void setCalcChargerName(String calcChargerName) {
		this.calcChargerName = calcChargerName;
	}

	@Override
	public String toString() {
		return "CompensationCalculationVO [calcCriterion=" + calcCriterion + ", calcQuantity=" + calcQuantity
				+ ", differenceReason=" + differenceReason + ", calcInstitutionName=" + calcInstitutionName
				+ ", calcCompletionDate=" + calcCompletionDate + ", finalCompensationAmount=" + finalCompensationAmount
				+ ", criterionUnitPrice=" + criterionUnitPrice + ", compensationAppliedRate=" + compensationAppliedRate
				+ ", calcChargerName=" + calcChargerName + "]";
	}
}
