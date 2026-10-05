package model.vo.js;

public class DocumentVO {

	private String docName;
	private String fileUrl;

	public DocumentVO() {}

	public DocumentVO(String docName, String fileUrl) {
		setDocName(docName);
		setFileUrl(fileUrl);
	}

	public String getDocName() {
		return docName;
	}

	public void setDocName(String docName) {
		this.docName = docName;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	@Override
	public String toString() {
		return "DocumentVO [docName=" + docName + ", fileUrl=" + fileUrl + "]";
	}
}
