package model.vo.pgt;

public class DocumentVO {
	private String documentName;
	private String fileURL;
	
	public DocumentVO() {}

	public DocumentVO(String documentName, String fileURL) {		
		setDocumentName(documentName);
		setFileURL(fileURL);
	}

	public String getDocumentName() { return documentName; }
	public void setDocumentName(String documentName) { this.documentName = documentName; }

	public String getFileURL() { return fileURL; }
	public void setFileURL(String fileURL) { this.fileURL = fileURL; }
	
	
	
	

}
