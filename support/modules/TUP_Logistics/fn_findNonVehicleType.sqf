private ["_fac","_allvehs","_vehx","_fx","_cx","_grpx","_type","_nonconfigs","_nonsims"];

_fac = nil;
_type = nil;
_nonConfigs = ["CruiseMissile1","CruiseMissile2","Chukar_EP1","Chukar","Chukar_AllwaysEnemy_EP1"];
_nonSims = ["detector","parachute"];

if(count _this > 0) then {
        _fac = _this select 0;
};

if(count _this > 1) then {
        _type = _this select 1;
};

_allvehs = [];
_grpx = count(configFile >> "CfgVehicles");
for "_y" from 1 to _grpx - 1 do {
        _vehx = (configFile >> "CfgVehicles") select _y;       
        if(getNumber (_vehx >> "scope") > 1) then {
                if (!(getText(_vehx >> "simulation") in _nonsims))  then {
                        _cx = configName _vehx;
                        if ({(_cx isKindOf _x)} count _nonconfigs == 0) then {
								if (!isNil "_fac") then {
										_fx = getText(_vehx >> "faction");
										switch(toUpper(typeName _fac)) do {
												case "STRING": {
														if(_fx == _fac) then {
																if (!isnil "_type") then {
																		if (_cx isKindOf _type) then {
																				_allvehs set [count _allvehs, _cx];
																		};
																} else {
																		_allvehs set [count _allvehs, _cx];
																};
														} else {
															
														};
												};
												case "ARRAY": {
														if(_fx in _fac) then {
																if (!isnil "_type") then {
																		if (_cx isKindOf _type) then {
																				_allvehs set [count _allvehs, _cx];
																		};
																} else {
																		_allvehs set [count _allvehs, _cx];
																};
														};
												};
										};
								};
                        };
                };
        };
};

_allvehs;
