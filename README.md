APOKALYPSEwEEKEND
=================


this is a Script i started for another Server owner and i think im going to publish it
maybe there r ppl who like it too :)
actualy its job is going to set all buildings by player destroyable at a specific time on a specific day every week ( for example saturday 8 pm )


#Installation instructions

#1.
u should download killzonekid's real_date.dll:

http://killzonekid.com/arma-extension-real_date-dll-v3-0/

extract it and past it to the root of ur @DayZ_Epoch_Server folder


#2.1.
now u have to open ur dayz_server.pbo and copy the apocalypseweekend.sqf into the modules folder
in the system folder

#2.2.
find the server_monitor.sqf in dayz_server\system folder, open it and search for:

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

ApocalypseWeekendBuildings set [count ApocalypseWeekendBuildings,_object];

so it looks like:

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

save, go back and open the compile folder
#2.3.
open server_publishObject.sqf and search for

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

ApocalypseWeekendBuildings set [count ApocalypseWeekendBuildings,_object];

so it looks like:

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

#2.4.
repeat the last step for the server_swapObject.sqf in the same folder

save and repack the 3 files to the correct folder it was before in ur dayz_server.pbo


#3.
go to ur mission folder or .pbo, past the AW_Init.sqf there or in a sub folder of it and edit it to ur likings


open ur init.sqf and search for

~~~~
	//Load in compiled functions
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";	//Initilize the Variables (IMPORTANT: Must happen very early)
	progressLoadingScreen 0.1;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";		//Initilize the publicVariable event handlers
~~~~

and add the last line ABOVE it

// APOKALYPSEwEEKEND
[] execVM "yOURcUSTOMfOLDERfORtHIS\AW_Init.sqf"

so it looks like:

~~~~
	// APOKALYPSEwEEKEND
	[] execVM "yOURcUSTOMfOLDERfORtHIS\AW_Init.sqf"

	//Load in compiled functions
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";	//Initilize the Variables (IMPORTANT: Must happen very early)
	progressLoadingScreen 0.1;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";		//Initilize the publicVariable event handlers
~~~~

save ur init.sqf and close it

#4
go to ur battleye filters folder (in the root of ur arma server or in your instance folder.. just check for the latest log files ^^
find the publicvariable.txt and open it

you should see something like

~~~~
	5 "" !"PVDZE_" !"norrn" !"usec"........
~~~~

add !"ApocalypseWeekendGMB" to it so it should looks like:

~~~~
	5 "" !"ApocalypseWeekendGMB" !"PVDZE_" !"norrn" !"usec"
~~~~

save the publicvariable.txt and close it


done.. hope some ppl enjoy it ^^
