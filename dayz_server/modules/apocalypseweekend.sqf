private "_runningdate";
if (isNil "ApocalypseWeekendBuildings") then {
	ApocalypseWeekendBuildings = [];
};
while {sleep 2;true} do {
	_runningdate = "real_date" callExtension "+";
	_runningdate = call compile _runningdate;
	//diag_log("[APOKALYPSEwEEKEND] _runningdate: " + str(_runningdate));
	_runningdate =  [_runningdate select 3,_runningdate select 4,_runningdate select 6,"Error",_this select 3];
	if (_runningdate select 2 >= 0) then {
		_runningdate set [3,"Sunday"];
		if (_runningdate select 2 >= 1) then {
			_runningdate set [3,"Monday"];
			if (_runningdate select 2 >= 2) then {
				_runningdate set [3,"Tuesday"];
				if (_runningdate select 2 >= 3) then {
					_runningdate set [3,"Wednesday"];
					if (_runningdate select 2 >= 4) then {
						_runningdate set [3,"Thursday"];
						if (_runningdate select 2 >= 5) then {
							_runningdate set [3,"Friday"];
							if (_runningdate select 2 == 6) then {
								_runningdate set [3,"Saturday"];
							};
						};
					};
				};
			};
		};
	};
	if ((((_this select 0) == (_runningdate select 2)) || ((_this select 0) == 7)) && ((_this select 1) == (_runningdate select 0)) && ((_this select 2) == (_runningdate select 1))) then {
		DZE_GodModeBase = false;
		diag_log("[APOKALYPSEwEEKEND] Starting on " + str(_runningdate select 3) + " at " + str(_runningdate select 0) + ":" + str(_runningdate select 1));
		{
			if ((typeOf _x) in dayz_allowedObjects) then {
				_x removeAllEventHandlers "HandleDamage";
				_x removeAllMPEventHandlers "MPKilled";
				_x addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
				_x enableSimulation false;
			};
		} forEach ApocalypseWeekendBuildings;
		diag_log("[APOKALYPSEwEEKEND] EVENT STARTED! ALL PLAYER BUILD OBJECTS ARE DESTRUCTIBLE!");
		[nil,nil,rTitleText,"[APOKALYPSEwEEKEND] EVENT STARTED!","PLAIN",10] call RE;
		sleep (((_runningdate select 4) * 60) - 60);
		[nil,nil,rTitleText,"[APOKALYPSEwEEKEND] 1 Minute left.","PLAIN",10] call RE;
		sleep 60;
		DZE_GodModeBase = true;
		ApocalypseWeekendGMB = ApocalypseWeekendBuildings;
		publicVariable "ApocalypseWeekendGMB";
		{
			if (((typeOf _x) in dayz_allowedObjects) && (alive _x)) then {
				_x removeAllMPEventHandlers "MPKilled";
				_x addEventHandler ["HandleDamage",{false}];
				_x addMPEventHandler ["MPKilled",{false}];
				_x enableSimulation false;
			};
		} forEach ApocalypseWeekendBuildings;
		[nil,nil,rTitleText,"[APOKALYPSEwEEKEND] EVENT ENDED!","PLAIN",10] call RE;
		diag_log("[APOKALYPSEwEEKEND] EVENT ENDED!");
	};
};
