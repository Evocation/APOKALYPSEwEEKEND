APOKALYPSEwEEKEND
=================


this is a Script i started for another Server owner and i think im going to publish it, because i got some problems.. maybe there r ppl who wanna help :)
actualy its job is going to set all buildings by player destroyable at a specific time on a specific day every week ( for example saturday 8 pm )

my current problem is, that the buildings after the event r still able to get destroyed, but back after restart
maybe some1 got an idea about it without changing too much in the server_publishObject.sqf, server_swapObject.sqf and server_monitor.sqf


#Installation instructions

#1. u should download killzonekid's real_date.dll:

http://killzonekid.com/arma-extension-real_date-dll-v3-0/

extract it and past it to the root of ur @DayZ_Epoch_Server folder


#2.1. now u have to open ur dayz_server.pbo and copy the apocalypseweekend.sqf into the modules folder
in the system folder u find the server_monitor.sqf, open it and search for

~~~~
	if ((typeOf _object) in dayz_allowedObjects) then {
		if (DZE_GodModeBase) then {
			_object addEventHandler ["HandleDamage", {false}];
		} else {
			_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
		};
		// Test disabling simulation server side on buildables only.
		_object enableSimulation false;
~~~~

add BELOW the last line

~~~~
	if ((typeOf _object) in dayz_allowedObjects) then {
		if (DZE_GodModeBase) then {
			_object addEventHandler ["HandleDamage", {false}];
		} else {
		_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
		};
		// Test disabling simulation server side on buildables only.
		_object enableSimulation false;
	
		ApocalypseWeekendBuildings set [count ApocalypseWeekendBuildings,_object];
~~~~

save, go back and change to compile folder
#2.2. open server_publishObject.sqf and search for

~~~~
	if (DZE_GodModeBase) then {
		_object addEventHandler ["HandleDamage", {false}];
	}else{
		_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
	};
	// Test disabling simulation server side on buildables only.
	_object enableSimulation false;
~~~~

add BELOW the last line

~~~~
	if (DZE_GodModeBase) then {
		_object addEventHandler ["HandleDamage", {false}];
	}else{
		_object addMPEventHandler ["MPKilled",{_this call object_handleServerKilled;}];
	};
	// Test disabling simulation server side on buildables only.
	_object enableSimulation false;
	
	ApocalypseWeekendBuildings set [count ApocalypseWeekendBuildings,_object];
~~~~

#2.3. repeat the last step for the server_swapObject.sqf

save and repack the 3 files to the correct folder it was before


#3. go to ur mission folder or .pbo, past the AW_Init.sqf there or in a sub folder of it and edit it to ur likings


open ur init.sqf and search for

~~~~
	if (isServer) then {
		// Add trader citys
		_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_13.Tavi\mission.sqf";
		_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	};
~~~~

and add the last line ABOVE the closing bracket ( }; )

~~~~
	if (isServer) then {
		// Add trader citys
		_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_13.Tavi\mission.sqf";
		_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
		[] execVM "AW_Init.sqf"
	};
~~~~

save ur init.sqf and close it


done.. hope some1 can help me for the last step :)
