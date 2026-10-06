package servlet;

public class ActionFactory {
	
	public static Action getAction(String cmd) {
		
		if (cmd == null)
			cmd = "";

		Action action = null;
		
		switch (cmd) {
		case "compensationSummaryAction":
			action = new compensationSummaryAction();
			break;
		}
		
		return action;
	}
}
