// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright ? 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Sniper.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf";

private ["_positions", "_boxes1", "_currBox1", "_box1", "_box2","_box3","_obj", "_tent"];

_setupVars =
{
	_missionType = "Sniper's Nest";
	_locationsArray = MissionSpawnMarkers;
};


	
_setupObjects =
{
	_missionPos = markerPos _missionLocation;
		//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	
	_randomBox = ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"] call BIS_fnc_selectRandom;
	_box1 = createVehicle ["Box_NATO_AmmoOrd_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, _randomBox] call fn_refillbox;

	_randomBox = ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"] call BIS_fnc_selectRandom;	
	_box2 = createVehicle ["Box_NATO_AmmoOrd_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, _randomBox] call fn_refillbox;
	
	_randomBox = ["mission_USLaunchers","mission_USSpecial","mission_Main_A3snipers"] call BIS_fnc_selectRandom;	
	_box3 = createVehicle ["Box_NATO_AmmoOrd_F", _missionPos, [], 5, "None"];
	_box3 setDir random 360;
	[_box3, _randomBox] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1,_box2,_box3];
	
	_tent = createVehicle ["CamoNet_INDP_big_F", _missionPos, [], 3, "None"];
	_tent allowDamage false;
	_tent setDir random 360;
	_tent setVariable ["R3F_LOG_disabled", false];
	
	_missionPos = getPosASL _tent;
//	_obj = createVehicle ["I_GMG_01_high_F", _missionPos,[], 10,"None"]; 
//	_obj setPosASL [_missionPos select 0, (_missionPos select 1) + 2, _missionPos select 2];
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos] spawn createSniperGroup;

	_aiGroup setCombatMode "YELLOW";
	_aiGroup setBehaviour "STEALTH";
	
	_missionHintText = format ["Two teams of snipers are defending a camouflaged weapons drop. Head to the marked area and take them out!", sideMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
//	{ deleteVehicle _x } forEach [_box1, _tent, _obj];
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _tent];
};

_successExec =
{
	// Mission completed
	
	_successHintMessage = format ["The snipers are dead! Outstanding! The loot is yours."];
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3];
};

_this call sideMissionProcessor;