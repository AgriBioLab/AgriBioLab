package servlet;

import java.sql.SQLException;

public class ActionFactory {
	
	public static Action getAction(String cmd) {
	  if(cmd==null) cmd="";
		Action action = null;
		
		switch(cmd) {
		case "compensationListUI":
			try {
				action = new CompensationListUIAction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
      break;
    case "compensationSummaryAction":
      action = new compensationSummaryAction();
			break;
		}
		
		return action;
	}
}
