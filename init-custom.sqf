// Add any 3rd party init.sqf scripts here
// ACRE retransmitter towers.
#define CH20 96.200
#define CH21 98.975
#define CH22 103.125
#define CH23 105.550
#define CH24 109.350
#define CH25 112.925

#define CH30 125.025
#define CH31 129.525
#define CH32 134.075
#define CH33 137.300
#define CH34 138.675
#define CH35 140.425

#define CH81 281.500
#define CH82 285.275
#define CH83 290.025
#define CH84 293.850
#define CH85 295.200
#define CH86 298.725

if (isServer) then {

	retrans1 setPosASL [17228.8,720.748,136.384]; // airfield
	["ACRE_PRC117F", retrans1, CH21, CH31, 20000] call acre_api_fnc_attachRxmtToObj;

	retrans2 setPosASL [17490.5,6043.78,1068.1]; // mike 2
	["ACRE_PRC117F", retrans2, CH31, CH22, 20000] call acre_api_fnc_attachRxmtToObj;
	["ACRE_PRC117F", retrans2, CH22, CH32, 20000] call acre_api_fnc_attachRxmtToObj;

	retrans3 setPosASL [11033.3,19636.9,1194.93]; // baker
	["ACRE_PRC117F", retrans3, CH32, CH23, 20000] call acre_api_fnc_attachRxmtToObj;
	["ACRE_PRC117F", retrans3, CH23, CH33, 20000] call acre_api_fnc_attachRxmtToObj;

	retrans4 setPosASL [6520.8755,18280.566,350.74179]; // mike 1
	["ACRE_PRC117F", retrans4, CH33, CH24, 20000] call acre_api_fnc_attachRxmtToObj;
	["ACRE_PRC117F", retrans4, CH24, CH34, 20000] call acre_api_fnc_attachRxmtToObj;

	// baker
	["ACRE_PRC117F", retrans3, CH34, CH35, 20000] call acre_api_fnc_attachRxmtToObj;

	retrans5 setPosASL [8201.65,8672.35,1190.09]; // robstrepo
	["ACRE_PRC117F", retrans5, CH35, CH25, 20000] call acre_api_fnc_attachRxmtToObj;

};

createMarker ["retrans1", getPos retrans1]; "retrans1" setMarkerType "Dot"; "retrans1" setMarkerText "1 - airfield";
createMarker ["retrans2", getPos retrans2]; "retrans2" setMarkerType "Dot"; "retrans2" setMarkerText "2 - mike 2";
createMarker ["retrans3", getPos retrans3]; "retrans3" setMarkerType "Dot"; "retrans3" setMarkerText "3 - baker (North)";
createMarker ["retrans4", getPos retrans4]; "retrans4" setMarkerType "Dot"; "retrans4" setMarkerText "4 - mike 1";
createMarker ["retrans5", getPos retrans5]; "retrans5" setMarkerType "Dot"; "retrans5" setMarkerText "5 - robstrepo";


if (!isDedicated) then {
  onMapSingleClick "player setPos _pos";
};
