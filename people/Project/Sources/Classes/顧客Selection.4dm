Class extends EntitySelection

local Function displayList()
	
	$processName:="顧客"
	$formName:="リスト"
	$windowTitle:="顧客リスト"
	
	CALL WORKER:C1389($processName; ds:C1482.dialog; {\
		formName: $formName; \
		tableNumber: This:C1470.getDataClass().getInfo().tableNumber; \
		windowTitle: $windowTitle; \
		controllerClass: cs:C1710._Dialog顧客リスト; \
		selection: This:C1470})