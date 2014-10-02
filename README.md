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


now u have to open ur dayz_server.pbo and copy the apocalypseweekend.sqf into the modules folder and edit it to ur likings

go to ur mission folder or .pbo, past the AW_Init.sqf there or in a sub folder of it


open ur init.sqf and search for

~~~~
	if (isServer) then {
		// Add trader citys
		_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_13.Tavi\mission.sqf";
		_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	};
~~~~

and add the last line ABOVE the closing bracket

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
