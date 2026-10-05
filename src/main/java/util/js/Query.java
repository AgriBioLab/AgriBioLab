package util.js;

public interface Query {
	String GET_COMPENSATION_CLAIM =
			"SELECT compensation_claim_amount, compensation_claim_quantity, claim_date, compensation_claim_area FROM compensation_claim WHERE app_id = ?";
	
	String GET_INVESTIGATION_SUMMARY = "SELECT invest_date, damage_rate, damage_area FROM damage_site_invest WHERE app_id = ?";
	
	String GET_APPLICATION_DOCUMENTS = "SELECT doc_name, file_url FROM app_doc WHERE app_id = ?";
}
