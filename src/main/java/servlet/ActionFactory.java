package servlet;

import java.sql.SQLException;

public class ActionFactory {
	
	public static Action getAction(String cmd) {
	  if(cmd==null) cmd="";
		Action action = null;
		
		switch(cmd) {
        case "qualityOfficerLoginUI":
            action = new QualityOfficerLoginUIAction();
            break;
        case "qualityOfficerLogout":
            action = new QualityOfficerLogoutAction();
            break;
		case "compensationListUI":
			try {
				action = new CompensationListUIAction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
      break;
    case "compensationDetailAction":
      action = new compensationDetailAction();
			break;
		}
		
		return action;
	}
}
