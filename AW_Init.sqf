private "_depot";
_depot = [
6,		//day: 0 = Sunday - 1 = Monday - [...] - 6 = Saturday - "any" = every day
20,			//hour: 1 - 24
00,			//minutes: 0-59
120			//event runtime in minutes
];
ApocalypseWeekendBuildings = [];
if (typeName (_depot select 0) == "STRING") then {
	_depot set [0,7];
};
[_depot select 0,_depot select 1,_depot select 2,_depot select 3] execVM "\z\addons\dayz_server\modules\apocalypseweekend.sqf";
