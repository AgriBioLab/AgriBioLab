package com.agribiolab.compensation.vo;

import java.time.LocalDate;

public class AttachmentFileVO {
    private Long fileId;
    private String fileCategory;
    private String documentName;
    private String submitSource;
    private LocalDate submittedAt;
    private String checkedYn;
    private String checkedText;
    private LocalDate checkedAt;
    private String checkedBy;
    private String filePath;

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public String getFileCategory() {
        return fileCategory;
    }

    public void setFileCategory(String fileCategory) {
        this.fileCategory = fileCategory;
    }

    public String getDocumentName() {
        return documentName;
    }

    public void setDocumentName(String documentName) {
        this.documentName = documentName;
    }

    public String getSubmitSource() {
        return submitSource;
    }

    public void setSubmitSource(String submitSource) {
        this.submitSource = submitSource;
    }

    public LocalDate getSubmittedAt() {
        return submittedAt;
    }

    public void setSubmittedAt(LocalDate submittedAt) {
        this.submittedAt = submittedAt;
    }

    public String getCheckedYn() {
        return checkedYn;
    }

    public void setCheckedYn(String checkedYn) {
        this.checkedYn = checkedYn;
    }

    public String getCheckedText() {
        return checkedText;
    }

    public void setCheckedText(String checkedText) {
        this.checkedText = checkedText;
    }

    public LocalDate getCheckedAt() {
        return checkedAt;
    }

    public void setCheckedAt(LocalDate checkedAt) {
        this.checkedAt = checkedAt;
    }

    public String getCheckedBy() {
        return checkedBy;
    }

    public void setCheckedBy(String checkedBy) {
        this.checkedBy = checkedBy;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
