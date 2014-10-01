APOKALYPSEwEEKEND
=================


this is a Script i started for another Server owner and i think im going to publish it, because i got some problems.. maybe there r ppl who wanna help :)
actualy its job is going to set all buildings by player destroyable at a specific time on a specific day every week ( for example saturday 8 pm )

currently i got problems with the addMPEventHandler i wanna use to realize its working
some bugs i wanna fix later, but for the first it should work ofc....


#Installation instructions

first u should download killzonekid's real_date.dll:

http://killzonekid.com/arma-extension-real_date-dll-v3-0/

extract it and past it to the root of ur @DayZ_Epoch_Server folder


now u have to open ur init.sqf and search for

~~~~
	//Load in compiled functions
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";	//Initilize the Variables (IMPORTANT: Must happen very early)
	call compile preprocessFileLineNumbers "addons\JAEM\variables.sqf";
	progressLoadingScreen 0.1;
~~~~

somewhere ABOVE it add these variables:

~~~~
	ApocalypseWeekendBuildings = [];
	ApocalypseWeekendPeriods = [6,20,0]; //day 0 = Sunday / 1 = Monday / [...] / 6 = Saturday, hour 20, minutes 0
	//Load in compiled functions
	...
~~~~

search for

	if (isServer) then {
		// Add trader citys
		_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_13.Tavi\mission.sqf";
		_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	};

and add the last line ABOVE the closing bracket

~~~~
	if (isServer) then {
		// Add trader citys
		_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_13.Tavi\mission.sqf";
		_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
		[] execVM "\z\addons\dayz_server\modules\apocalypseweekend.sqf"
	};
~~~~

save ur init.sqf and close it

after this u have to open ur dayz_server.pbo and past the apocalypseweekend.sqf from this repositorie in the modules folder


done.. hope u r more clever than me
