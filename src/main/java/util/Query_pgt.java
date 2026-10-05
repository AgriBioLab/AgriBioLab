package util;

public interface Query_pgt {
	String GET_COMPENSATIONLIST_BY_APPLICATION_ID = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE a.app_id=? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_APPLICATION_CATEGORY = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE app_category = ? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_ORGANIZATION_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE organization_name = ? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_REPRESENTATIVE_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE representative_name = ? ORDER BY a.app_date DESC";

	String GET_COMPENSATIONLIST_BY_PRODUCT_NAME = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE product_name = ? ORDER BY a.app_date DESC";
	
	String GET_COMPENSATIONlIST_BY_PAYMENT_COMPLETION_DATE = "SELECT a.app_id, a.product_name, ap.app_category, ap.representative_name, ap.organization_name, cp.payment_completion_date, cp.payment_amount FROM agriculture_damage_app a JOIN applicant ap ON a.applicant_id = ap.applicant_id LEFT JOIN compensation_claim cc ON a.app_id = cc.app_id LEFT JOIN compensation_payment cp ON cc.compensation_claim_id = cp.compensation_claim_id WHERE payment_completion_date >= TO_DATE(?, 'YYYY-MM-DD') AND payment_completion_date <= TO_DATE(?, 'YYYY-MM-DD') ORDER BY a.app_date DESC";

	String GET_COMPENSATION_DETAIL= "SELECT a.app_status,cc.compensation_claim_amount,cp.payment_amount, da.action_charger_name,cc.claim_date,cp.payment_completion_date FROM agriculture_damage_app a JOIN damage_action da ON da.app_id=a.app_id LEFT JOIN compensation_claim cc ON cc.app_id=a.app_id LEFT JOIN compensation_payment cp ON cp.compensation_claim_id=cc.compensation_claim_id WHERE a.app_id=? ORDER BY a.app_date DESC";
	
	String GET_DAMAGE_ACTION_SUMMARY = "SELECT d.action_type, d.execution_confirm_date, d.execution_confirm_quantity, d.plan_action_content FROM damage_action d JOIN agriculture_damage_app a ON a.app_id=d.app_id WHERE a.app_id=?";

	String GET_INVESTIGATION_DOCUMENTS = "SELECT ccd.doc_name, ccd.file_url FROM compensation_calc_doc ccd JOIN compensation_calc cc ON ccd.compensation_calc_id=cc.compensation_calc_id WHERE compensation_claim_id=?";

	String GET_COMPENSATION_CLAIM_DOCUMENTS = "SELECT doc_name, submission_place, submission_date, file_url, reviewer_name, confirm_date FROM compensation_claim_doc WHERE compensation_claim_id=?";
}
