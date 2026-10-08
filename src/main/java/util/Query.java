package util;

public interface Query {
	String QUALITY_OFFICER_LOGIN = "SELECT username, password, position, name FROM quality_assurance_officer WHERE username = ? AND password = ?";
	
	String GET_COMPENSATION_CLAIM = "SELECT compensation_claim_amount, compensation_claim_quantity, claim_date, compensation_claim_area FROM compensation_claim WHERE app_id = ?";
	
	String GET_INVESTIGATION_SUMMARY = "SELECT ROW_NUMBER () OVER (ORDER BY invest_date) num, invest_date, damage_rate, damage_area FROM damage_site_invest WHERE app_id = ? ORDER BY INVEST_DATE DESC";
	
	String GET_APPLICATION_DOCUMENTS = "SELECT doc_name, file_url FROM app_doc WHERE app_id = ?";
	
	String GET_COMPENSATIONLIST = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL ORDER BY a.app_date DESC";
	
	String GET_COMPENSATIONLIST_BY_APPLICATION_ID = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and a.app_id=? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_APPLICATION_CATEGORY = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and app_category = ? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_ORGANIZATION_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and organization_name = ? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_REPRESENTATIVE_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and representative_name = ?  ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_PRODUCT_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and product_name = ? ORDER BY a.app_date DESC";
	
	String GET_COMPENSATIONlIST_BY_PAYMENT_COMPLETION_DATE = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount, cp.payment_institution FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date IS NOT NULL and payment_completion_date >= TO_DATE(?, 'YYYY-MM-DD') AND payment_completion_date <= TO_DATE(?, 'YYYY-MM-DD')  ORDER BY a.app_date DESC";

	String GET_COMPENSATION_DETAIL= "SELECT a.app_status,cc.compensation_claim_amount,cp.payment_amount, da.action_charger_name,cc.claim_date,cp.payment_completion_date FROM agriculture_damage_app a JOIN damage_action da ON da.app_id=a.app_id LEFT JOIN compensation_claim cc ON cc.app_id=a.app_id LEFT JOIN compensation_payment cp ON cp.compensation_claim_id=cc.compensation_claim_id WHERE a.app_id=? ORDER BY a.app_date DESC";
	
	String GET_DAMAGE_ACTION_SUMMARY = "SELECT d.action_type, d.execution_confirm_date, d.execution_confirm_quantity, d.plan_action_content FROM damage_action d JOIN agriculture_damage_app a ON a.app_id=d.app_id WHERE a.app_id=?";

	String GET_INVESTIGATION_DOCUMENTS = "SELECT ccd.doc_name, ccd.file_url FROM compensation_calc_doc ccd JOIN compensation_calc cc ON ccd.compensation_calc_id=cc.compensation_calc_id WHERE compensation_claim_id=?";

	String GET_COMPENSATION_CLAIM_DOCUMENTS = "SELECT doc_name, submission_place, submission_date, file_url, reviewer_name, confirm_date FROM compensation_claim_doc WHERE compensation_claim_id=?";


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
