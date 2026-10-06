package model.vo;

import java.sql.Date;

public class CompensationClaimVO {
	private int compensationClaimAmount;
	private int compensationClaimArea;
	private int compensationClaimQuantity;
	private Date claimDate;

	public CompensationClaimVO(int compensationClaimAmount, int compensationClaimArea, int compensationClaimQuantity,
			Date claimDate) {
		setCompensationClaimAmount(compensationClaimAmount);
		setCompensationClaimArea(compensationClaimArea);
		setCompensationClaimQuantity(compensationClaimQuantity);
		setClaimDate(claimDate);
	}

	public int getCompensationClaimAmount() {
		return compensationClaimAmount;
	}

	public void setCompensationClaimAmount(int compensationClaimAmount) {
		this.compensationClaimAmount = compensationClaimAmount;
	}

	public int getCompensationClaimArea() {
		return compensationClaimArea;
	}

	public void setCompensationClaimArea(int compensationClaimArea) {
		this.compensationClaimArea = compensationClaimArea;
	}

	public int getCompensationClaimQuantity() {
		return compensationClaimQuantity;
	}

	public void setCompensationClaimQuantity(int compensationClaimQuantity) {
		this.compensationClaimQuantity = compensationClaimQuantity;
	}

	public Date getClaimDate() {
		return claimDate;
	}

	public void setClaimDate(Date claimDate) {
		this.claimDate = claimDate;
	}

	@Override
	public String toString() {
		return "CompensationClaimVO [compensationClaimAmount=" + compensationClaimAmount + ", compensationClaimArea="
				+ compensationClaimArea + ", compensationClaimQuantity=" + compensationClaimQuantity + ", claimDate="
				+ claimDate + "]";
	}
}
