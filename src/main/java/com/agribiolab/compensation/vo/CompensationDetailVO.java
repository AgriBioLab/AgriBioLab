package com.agribiolab.compensation.vo;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CompensationDetailVO {
    private String applyNo;
    private String targetType;
    private String targetTypeName;
    private String businessName;
    private String ownerName;
    private String disasterType;
    private String itemName;
    private String productionPlace;
    private BigDecimal requestAmount;
    private LocalDate requestDate;
    private BigDecimal requestQtyKg;
    private BigDecimal requestAreaM2;
    private String basisName;
    private BigDecimal unitPrice;
    private BigDecimal applyRate;
    private String calculationFormulaText;
    private String adjustmentReason;
    private String calculationOrgName;
    private String calculationManagerName;
    private LocalDate calculatedAt;
    private BigDecimal finalAmount;
    private LocalDate paymentConfirmedAt;
    private LocalDate paymentDate;
    private String paymentOrgName;
    private String paymentManagerName;
    private String payeeName;
    private String maskedAccountNo;
    private String paymentExclusionReason;
    private String actionMethod;
    private String planContent;
    private BigDecimal actualActionQtyKg;
    private LocalDate resultCheckedAt;
    private LocalDate surveyCompletedAt;
    private Integer finalSurveyRound;
    private BigDecimal finalDamageRate;
    private BigDecimal finalDamageAreaM2;
    private List<AttachmentFileVO> attachments = new ArrayList<>();

    public String getApplyNo() {
        return applyNo;
    }

    public void setApplyNo(String applyNo) {
        this.applyNo = applyNo;
    }

    public String getTargetType() {
        return targetType;
    }

    public void setTargetType(String targetType) {
        this.targetType = targetType;
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

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getDisasterType() {
        return disasterType;
    }

    public void setDisasterType(String disasterType) {
        this.disasterType = disasterType;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getProductionPlace() {
        return productionPlace;
    }

    public void setProductionPlace(String productionPlace) {
        this.productionPlace = productionPlace;
    }

    public BigDecimal getRequestAmount() {
        return requestAmount;
    }

    public void setRequestAmount(BigDecimal requestAmount) {
        this.requestAmount = requestAmount;
    }

    public LocalDate getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(LocalDate requestDate) {
        this.requestDate = requestDate;
    }

    public BigDecimal getRequestQtyKg() {
        return requestQtyKg;
    }

    public void setRequestQtyKg(BigDecimal requestQtyKg) {
        this.requestQtyKg = requestQtyKg;
    }

    public BigDecimal getRequestAreaM2() {
        return requestAreaM2;
    }

    public void setRequestAreaM2(BigDecimal requestAreaM2) {
        this.requestAreaM2 = requestAreaM2;
    }

    public String getBasisName() {
        return basisName;
    }

    public void setBasisName(String basisName) {
        this.basisName = basisName;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getApplyRate() {
        return applyRate;
    }

    public void setApplyRate(BigDecimal applyRate) {
        this.applyRate = applyRate;
    }

    public String getCalculationFormulaText() {
        return calculationFormulaText;
    }

    public void setCalculationFormulaText(String calculationFormulaText) {
        this.calculationFormulaText = calculationFormulaText;
    }

    public String getAdjustmentReason() {
        return adjustmentReason;
    }

    public void setAdjustmentReason(String adjustmentReason) {
        this.adjustmentReason = adjustmentReason;
    }

    public String getCalculationOrgName() {
        return calculationOrgName;
    }

    public void setCalculationOrgName(String calculationOrgName) {
        this.calculationOrgName = calculationOrgName;
    }

    public String getCalculationManagerName() {
        return calculationManagerName;
    }

    public void setCalculationManagerName(String calculationManagerName) {
        this.calculationManagerName = calculationManagerName;
    }

    public LocalDate getCalculatedAt() {
        return calculatedAt;
    }

    public void setCalculatedAt(LocalDate calculatedAt) {
        this.calculatedAt = calculatedAt;
    }

    public BigDecimal getFinalAmount() {
        return finalAmount;
    }

    public void setFinalAmount(BigDecimal finalAmount) {
        this.finalAmount = finalAmount;
    }

    public LocalDate getPaymentConfirmedAt() {
        return paymentConfirmedAt;
    }

    public void setPaymentConfirmedAt(LocalDate paymentConfirmedAt) {
        this.paymentConfirmedAt = paymentConfirmedAt;
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

    public String getPaymentManagerName() {
        return paymentManagerName;
    }

    public void setPaymentManagerName(String paymentManagerName) {
        this.paymentManagerName = paymentManagerName;
    }

    public String getPayeeName() {
        return payeeName;
    }

    public void setPayeeName(String payeeName) {
        this.payeeName = payeeName;
    }

    public String getMaskedAccountNo() {
        return maskedAccountNo;
    }

    public void setMaskedAccountNo(String maskedAccountNo) {
        this.maskedAccountNo = maskedAccountNo;
    }

    public String getPaymentExclusionReason() {
        return paymentExclusionReason;
    }

    public void setPaymentExclusionReason(String paymentExclusionReason) {
        this.paymentExclusionReason = paymentExclusionReason;
    }

    public String getActionMethod() {
        return actionMethod;
    }

    public void setActionMethod(String actionMethod) {
        this.actionMethod = actionMethod;
    }

    public String getPlanContent() {
        return planContent;
    }

    public void setPlanContent(String planContent) {
        this.planContent = planContent;
    }

    public BigDecimal getActualActionQtyKg() {
        return actualActionQtyKg;
    }

    public void setActualActionQtyKg(BigDecimal actualActionQtyKg) {
        this.actualActionQtyKg = actualActionQtyKg;
    }

    public LocalDate getResultCheckedAt() {
        return resultCheckedAt;
    }

    public void setResultCheckedAt(LocalDate resultCheckedAt) {
        this.resultCheckedAt = resultCheckedAt;
    }

    public LocalDate getSurveyCompletedAt() {
        return surveyCompletedAt;
    }

    public void setSurveyCompletedAt(LocalDate surveyCompletedAt) {
        this.surveyCompletedAt = surveyCompletedAt;
    }

    public Integer getFinalSurveyRound() {
        return finalSurveyRound;
    }

    public void setFinalSurveyRound(Integer finalSurveyRound) {
        this.finalSurveyRound = finalSurveyRound;
    }

    public BigDecimal getFinalDamageRate() {
        return finalDamageRate;
    }

    public void setFinalDamageRate(BigDecimal finalDamageRate) {
        this.finalDamageRate = finalDamageRate;
    }

    public BigDecimal getFinalDamageAreaM2() {
        return finalDamageAreaM2;
    }

    public void setFinalDamageAreaM2(BigDecimal finalDamageAreaM2) {
        this.finalDamageAreaM2 = finalDamageAreaM2;
    }

    public List<AttachmentFileVO> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<AttachmentFileVO> attachments) {
        this.attachments = attachments == null ? new ArrayList<>() : attachments;
    }
}
