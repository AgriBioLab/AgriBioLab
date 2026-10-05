package model.vo.pgt;

import java.sql.Date;

public class CompensationClaimDocumentVO {
	private String documentName;
	private String submissionPlace;
	private Date submissionDate;
	private String fileURL;
	private String reviewerName;
	private Date confirmDate;
	
	public CompensationClaimDocumentVO() {}

	public CompensationClaimDocumentVO(String documentName, String submissionPlace, Date submissionDate, String fileURL,
			String reviewerName, Date confirmDate) {
		setDocumentName(documentName);
		setSubmissionPlace(submissionPlace);
		setSubmissionDate(submissionDate);
		setFileURL(fileURL);
		setReviewerName(reviewerName);
		setConfirmDate(confirmDate);
	}

	public String getDocumentName() { return documentName; }
	public void setDocumentName(String documentName) { this.documentName = documentName; }

	public String getSubmissionPlace() { return submissionPlace; }
	public void setSubmissionPlace(String submissionPlace) { this.submissionPlace = submissionPlace; }

	public Date getSubmissionDate() { return submissionDate; }
	public void setSubmissionDate(Date submissionDate) { this.submissionDate = submissionDate; }

	public String getFileURL() { return fileURL; }
	public void setFileURL(String fileURL) { this.fileURL = fileURL; }

	public String getReviewerName() { return reviewerName; }
	public void setReviewerName(String reviewerName) { this.reviewerName = reviewerName; }

	public Date getConfirmDate() { return confirmDate; }
	public void setConfirmDate(Date confirmDate) { this.confirmDate = confirmDate; }
	
	
	
	
	

}
