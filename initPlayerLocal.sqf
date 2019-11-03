// Stop players' characters from calling out orders (that can reveal directions and positions).

0 fadeRadio 0;
enableRadio false;
enableSentences false;

// Remove the "Move map to player location" button on the map.

[] spawn {
	disableSerialization;
	
	while { true } do {
		waitUntil { visibleMap };
		
		private _display = uiNamespace getVariable "RSCDiary";
		
		private _ctrl = _display displayCtrl 1202;
		_ctrl ctrlEnable false;
		_ctrl ctrlSetTextColor [0, 0, 0, 0];
		_ctrl ctrlSetTooltip "";
		_ctrl ctrlCommit 0;
		waitUntil { !visibleMap };
	};
};
