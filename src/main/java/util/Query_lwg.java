package util;

public interface Query_lwg {
	String GET_APPLICATION_RECEPTION = "SELECT agri.app_id, app.ORGANIZATION_NAME, app.APP_CATEGORY, agri.PRODUCTION_AREA, agri.DISASTER_TYPE, agri.PRODUCT_NAME, app.REPRESENTATIVE_NAME "
			+ "FROM agriculture_damage_app agri "
			+ "JOIN applicant app ON agri.APPLICANT_ID = app.APPLICANT_ID "
			+ "WHERE agri.app_id = ?";

	String GET_COMPENSATION_CALCULATION = "SELECT CALC_CRITERION, CALC_QUANTITY, DIFFERENCE_REASON, CALC_INSTITUTION_NAME, CALC_COMPLETION_DATE, FINAL_COMPENSATION_AMOUNT, CRITERION_UNIT_PRICE, COMPENSATION_APPLIED_RATE, CALC_CHARGER_NAME "
			+ "FROM compensation_calc "
			+ "WHERE compensation_claim_id = ?";

	String GET_COMPENSATION_PAYMENT = "SELECT payment_decision_date, payment_institution, recipient_name, payment_account_number, payment_completion_date, payment_charger_name, payment_amount "
			+ "FROM compensation_payment "
			+ "WHERE compensation_claim_id = ?";

	String GET_COMPENSATION_PAYMENT_DOCUMENTS = "SELECT doc.doc_name, doc.file_url "
			+ "FROM compensation_payment_doc doc JOIN compensation_payment payment ON doc.compensation_payment_id = doc.compensation_payment_id "
			+ "WHERE payment .compensation_claim_id= ?";
	
	String GET_COMPENSATION_PROGRESS = "SELECT agri.app_date, invest.INVEST_DATE, action.plan_action_confirm_date, action.execution_confirm_date, payment.payment_completion_date "
			+ "FROM agriculture_damage_app agri"
			+ " LEFT JOIN damage_site_invest invest ON agri.APP_ID = invest.APP_ID"
			+ " LEFT JOIN damage_action action ON agri.APP_ID = action.APP_ID"
			+ " LEFT JOIN compensation_claim claim ON agri.APP_ID = claim.APP_ID"
			+ " LEFT JOIN compensation_payment payment ON claim.COMPENSATION_CLAIM_ID = payment.COMPENSATION_CLAIM_ID "
			+ "WHERE agri.app_id = ?";
}
