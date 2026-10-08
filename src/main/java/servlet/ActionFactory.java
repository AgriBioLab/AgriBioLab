package servlet;

import java.sql.SQLException;

public class ActionFactory {
	
	public static Action getAction(String cmd) {
	  if(cmd==null) cmd="";
		Action action = null;
		
		System.out.println("get액션 진입");
		
		switch(cmd) {
        case "qualityOfficerLoginUI":
            action = new QualityOfficerLoginUI();
            break;
        case "qualityOfficerLoginAction":
        	try {
        		System.out.println("qualityOfficerLoginAction 진입");
				action = new QualityOfficerLoginAction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
