package com.agribiolab.compensation.vo;

import java.math.BigDecimal;
import java.time.LocalDate;

public class CompensationVO {
    private String applyNo;
    private String targetTypeName;
    private String businessName;
    private String ownerNameMasked;
    private String itemName;
    private BigDecimal finalAmount;
    private LocalDate paymentDate;
    private String paymentOrgName;

    public String getApplyNo() {
        return applyNo;
    }

    public void setApplyNo(String applyNo) {
        this.applyNo = applyNo;
    }

    public String getTargetTypeName() {
        return targetTypeName;
    }

    public void setTargetTypeName(String targetTypeName) {
        this.targetTypeName = targetTypeName;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getOwnerNameMasked() {
        return ownerNameMasked;
    }

    public void setOwnerNameMasked(String ownerNameMasked) {
        this.ownerNameMasked = ownerNameMasked;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public BigDecimal getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(BigDecimal finalAmount) {
        this.finalAmount = finalAmount;
    }

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDate paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentOrgName() {
        return paymentOrgName;
    }

    public void setPaymentOrgName(String paymentOrgName) {
        this.paymentOrgName = paymentOrgName;
    }
}
