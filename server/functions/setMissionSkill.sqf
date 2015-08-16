// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: setMissionSkill.sqf
//	@file Author: AgentRev
//	@file Created: 21/10/2013 19:14
//	@file Args:

if (!isServer) exitWith {};

private ["_unit", "_skill", "_accuracy"];
_unit = _this;

if (["A3W_missionsDifficulty"] call isConfigOn) then
{
	_skill = 0.8; // Default skill for ARMA3 is 0.5
	_accuracy = 0.20; // Relative multiplier; absolute default accuracy for ARMA3 is 0.25
}
else
{
	_skill = 0.70;
	_accuracy = 0.20;
};

//_unit allowFleeing 0;
_unit allowFleeing 0.1;

_unit setSkill _skill;
_unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * _accuracy];  // ARMA3 default (0.25) divided by multiplier
_unit setSkill ["aimingShake", 0.1];
_unit setSkill ["aimingSpeed", 0.4];
_unit setSkill ["endurance", 1];
_unit setSkill ["spotDistance", 2];
_unit setSkill ["spotTime", 0.2];
_unit setSkill ["courage", 1];
_unit setSkill ["reloadSpeed", 0.1];				
_unit setSkill ["commanding", 0.4];
_unit setSkill ["general", 0.3];

// Available skills are explained here: http://community.bistudio.com/wiki/AI_Sub-skills
// Skill values are between 0 and 1
