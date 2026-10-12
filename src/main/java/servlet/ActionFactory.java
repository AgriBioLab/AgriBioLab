package servlet;

import java.sql.SQLException;

public class ActionFactory {
	
	public static Action getAction(String cmd) throws SQLException {
	  if(cmd==null) cmd="";
		Action action = null;
				
		switch(cmd) {
        case "qualityOfficerLoginUI":
            action = new QualityOfficerLoginUI();
            break;
        case "qualityOfficerLoginAction":
            action = new QualityOfficerLoginAction();
        	break;
        case "qualityOfficerLogout":
            action = new QualityOfficerLogoutAction();
            break;
		case "compensationListUI":
			action = new CompensationListUIAction();
			break;
		case "compensationDetailAction":
			action = new compensationDetailAction();
			break;
		}
				
		return action;
	}
}
