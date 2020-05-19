private ["_isJipPlayer"];

_isJipPlayer = _this select 0;

drn_rendesvouzTasks = [];
drn_hijackTasks = [];

drn_SetTaskStateEventArgs = []; // taskName, state

drn_SetTaskStateLocal = {
	private ["_taskList", "_state"];
	private ["_code"];

	_taskList = _this select 0;
	_state = _this select 1;
	
	_code = "{_x setTaskState """ + _state + """} foreach " + _taskList + ";";
    diag_log _code;
	call compile _code;

	if (isServer) then {
		private ["_code2"];

		_code2 = _taskList + "Status = """ + _state + """; publicVariable """ + _taskList + "Status"";";
        diag_log _code2;
		call compile _code2;
	};
};

"drn_SetTaskStateEventArgs" addPublicVariableEventHandler {
	drn_SetTaskStateEventArgs call drn_SetTaskStateLocal;
};

drn_SetTaskStateOnAllMachines = {
	private ["_taskList", "_state"];

	_taskList = _this select 0;
	_state = _this select 1;

	drn_SetTaskStateEventArgs = [_taskList, _state];
	publicVariable "drn_SetTaskStateEventArgs";
	drn_SetTaskStateEventArgs call drn_SetTaskStateLocal;
};

if (isServer) then {
    drn_rendesvouzTasksStatus = "CREATED";
    publicVariable "drn_rendesvouzTasksStatus";
    
    drn_hijackTasksStatus = "CREATED";
    publicVariable "drn_hijackTasksStatus";
};

{
    if (!isNil "_x") then {
        private ["_task"];
        
        _task = _x createSimpleTask ["Hijack a communication center"];
        _task setSimpleTaskDescription ["Hijack a communication center.", "Hijack a communication center", ""];
        drn_hijackTasks set [count drn_hijackTasks, _task];
        
        _task = _x createSimpleTask ["Rendesvouz with allied forces."];
        _task setSimpleTaskDescription ["Rendesvouz with allied forces.", "Rendesvouz with allied forces.", ""];
        drn_rendesvouzTasks set [count drn_rendesvouzTasks, _task];
        
        _x createDiaryRecord ["Diary", ["Mission mechanics *important*", "The guards took everything you had, weapons, maps, compasses, everything.<br /><br />If you manage to escape from the temporary prison, be sure the enemy will send all they can afford to find you.<br /><br />All enemy units have heard about your activities and capture. If you are detected by an enemy unit, it will contact its headquarter within seconds (so if you take him out quickly enough the information may never reach HQ).<br /><br />If your position is reported to headquarter, their search leader will focus the search in an area close to the reported position. If they lose track of you, they will assume you are still in the vicinity, and widen the search area after some amount of time.<br /><br />Chernarus is full of innocent civilians and currently positive regarding your presence. However, if they feel threatened (if you kill one) they will turn against you and help the enemy by reporting in your position whenever they see you.<br /><br />To find your way home you will need to establish radio contact with NATO forces. The enemy communication centers can be hijacked! (Communication centers are marked on the enemy's maps).<br /><br />The enemy communication centers are heavily guarded and take some time to hijack. You are lucky to have a talented demolition operator in your group, who can handle such tasks pretty quick. To get near a communication center you will probably need some heavy weapons.<br /><br />CSAT stores heavy weapons in its ammunition depots (marked on enemies' maps).<br /><br />You will not die, you only get unconscious, and your skillful teammates can fix you in almost any shape. Your team's medic can heal you quite quickly."]];
        _x createDiaryRecord ["Diary", ["Order", "Take the first opportunity to escape the prison and find a way to rendezvous with NATO forces.<br /><br />The guard on your side of the fence doesn't seem very well, does he...?)"]];
        _x createDiaryRecord ["Diary", ["Intelligence Revealed", "In effort to counter the expected NATO reinforcement, CSAT and The Syndicat is working hard to prepare the conflict. All over the island they have set up ammunition depots as well as technically advanced communication centers guarded by heavy armor."]];
        _x createDiaryRecord ["Diary", ["Situation", "CTRG Group 11 is deployed at Chernarus to gather intel about the situation prior to the arrival of NATO. However, finding themselves in a much more hostile environment than expected, they are captured by a Syndicat force suspisious about their intentions. Group 11 is unarmed and put in a temporary built prison while awaiting further interrogation."]];
        _x createDiaryRecord ["Diary", ["Background", "The earthquake shaking the Horizon Islands has brought more than a natural disaster. In the chaos of humanitarian efforts being carried out across the island, CSAT has found a unique opportunity to further destabilise the region by strengthening the Syndicat. The Syndicat has since then increased its activities and, in absence of the Gendarmarie, taken over control of cities and villages of Chernarus at a relatively low cost.<br /><br />In the resulting political vacuum the Gendarmarie is nowhere to be seen, but it is assumed to be silently regrouping and preparing the arrival of NATO piecekeeping forces."]];
        
    };
} foreach call drn_fnc_Escape_GetPlayers;

// If JIP player then set completed tasks
if (_isJipPlayer) then {
    diag_log "DEBUG START";
    if (!isNil "drn_rendesvouzTasksStatus") then {
        diag_log ("[drn_rendesvouzTasks, " + str drn_rendesvouzTasksStatus + "]");
        ["drn_rendesvouzTasks", drn_rendesvouzTasksStatus] call drn_SetTaskStateLocal;
    };
    
    if (!isNil "drn_hijackTasksStatus") then {
        diag_log ("[drn_hijackTasks, " + str drn_hijackTasksStatus + "]");
        ["drn_hijackTasks", drn_hijackTasksStatus] call drn_SetTaskStateLocal;
    };
};
