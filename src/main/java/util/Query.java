package util;

public interface Query {
	String GET_COMPENSATION_DETAIL= "SELECT a.app_id,a.app_status,cc.compensation_claim_amount,calc.final_compensation_amount,da.action_charger_name,cc.claim_date,cp.payment_completion_date FROM agriculture_damage_app a LEFT JOIN damage_action da ON da.app_id=a.app_id LEFT JOIN compensation_claim cc ON cc.app_id=a.app_id LEFT JOIN compensation_calc calc ON calc.compensation_claim_id=cc.compensation_claim_id LEFT JOIN compensation_payment cp ON cp.compensation_claim_id=cc.compensation_claim_id WHERE a.app_id=?";


}
