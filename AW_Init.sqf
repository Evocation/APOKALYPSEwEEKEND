if (isServer) then {
	private "_depot";
	_depot = [
	"any",		//day: 0 = Sunday - 1 = Monday - [...] - 6 = Saturday - "any" or 7 = every day
	15,			//hour: 1 - 24
	43,			//minutes: 0-59
	2			//event runtime in minutes
	];
	ApocalypseWeekendBuildings = [];
	if (typeName (_depot select 0) == "STRING") then {
		_depot set [0,7];
	};
	[_depot select 0,_depot select 1,_depot select 2,_depot select 3] execVM "\z\addons\dayz_server\modules\apocalypseweekend.sqf";
};
if (!isDedicated) then {
	setObjectsGod = {
		//diag_log("[APOKALYPSEwEEKEND] ApocalypseWeekendGMB " + str(ApocalypseWeekendGMB));
		DZE_GodModeBase = true;
		if DZE_GodModeBase then {
			{
				_x removeAllMPEventHandlers "MPKilled";
				_x addEventHandler ["HandleDamage",{false}];
			} foreach _this;
		};
	};
	"ApocalypseWeekendGMB" addPublicVariableEventHandler {(_this select 1) spawn setObjectsGod};
};
