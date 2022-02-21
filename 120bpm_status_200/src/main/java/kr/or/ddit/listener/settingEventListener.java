package kr.or.ddit.listener;

import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

//@Component
public class settingEventListener {
	


	@TransactionalEventListener(phase=TransactionPhase.AFTER_COMMIT, fallbackExecution=false)
	public void HandlerEvent() {
	}

}
