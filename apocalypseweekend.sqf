private "_runningdate";
if (isNil "ApocalypseWeekendBuildings") then {
	ApocalypseWeekendBuildings = [];
};
while {true} do {
	_runningdate = "real_date" callExtension "+";
	_runningdate = call compile _runningdate;
	diag_log("[APOKALYPSEwEEKEND] _runningdate: " + str(_runningdate));
	_runningdate =  [_runningdate select 3,_runningdate select 4,_runningdate select 6,"Error"];
	//diag_log("[APOKALYPSEwEEKEND] _runningdate: " + str(_runningdate));
	if (_runningdate select 2>= 0) then {
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
	} else {
		if (true) exitWith {diag_log("[APOKALYPSEwEEKEND] " + str(_runningdate select 3) + ": can't figure out the day of week.")};
	};
	if ((((ApocalypseWeekendPeriods select 0) == (_runningdate select 2)) && ((ApocalypseWeekendPeriods select 1) == (_runningdate select 0)) && ((ApocalypseWeekendPeriods select 2) == (_runningdate select 1))) || (testmod == 1)) then {
		DZE_GodModeBase = false;
		diag_log("[APOKALYPSEwEEKEND] Starting on " + str(_runningdate select 3) + " at " + str(_runningdate select 0) + ":" + str(_runningdate select 1));
		sleep 5;
		[nil,nil,rTitleText,"[APOKALYPSEwEEKEND] EVENT STARTED!","PLAIN",10] call RE;
		sleep 10;
		{
			diag_log("[APOKALYPSEwEEKEND] " + str(_x));
			if (!(isnil "ApocalypseWeekendBuildings") && ((typeOf _x) in dayz_allowedObjects)) then {
				_x removeAllMPEventHandlers "MPKilled";
				_x removeAllMPEventHandlers "HandleDamage";
				_x addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
			};
		} count ApocalypseWeekendBuildings;
		diag_log("[APOKALYPSEwEEKEND] EVENT STARTED! ALl PLAYER BUILD OBJECTS ARE DESTRUCTIBLE!");
		sleep 360;
		[nil,nil,rTitleText,"[APOKALYPSEwEEKEND] 1 Minute left.","PLAIN",10] call RE;
		sleep 60;
		DZE_GodModeBase = true;
		{
			diag_log("[APOKALYPSEwEEKEND] " + str(_x));
			if (!(isnil "ApocalypseWeekendBuildings") && ((typeOf _x) in dayz_allowedObjects)) then {
				_x removeAllMPEventHandlers "MPKilled";
				_x removeAllMPEventHandlers "HandleDamage";
				_x addEventHandler ["HandleDamage",{false}];
			};
		} count ApocalypseWeekendBuildings;
		diag_log("[APOKALYPSEwEEKEND] EVENT ENDED!");
	};
};
