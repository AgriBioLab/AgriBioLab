package util.js;

public interface Query {
	String GET_COMPENSATION_CLAIM =
			"SELECT compensation_claim_amount, compensation_claim_quantity, claim_date, compensation_claim_area FROM compensation_claim WHERE app_id = ?";
}
