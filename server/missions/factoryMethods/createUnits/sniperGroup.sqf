//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group","_pos","_mission_radius1","_mission_radius2","_leader","_man2","_man3","_man4","_man5","_man6"];

_group = _this select 0;
_pos = _this select 1;
_mission_radius1 = round(random 600) -300;
_mission_radius2 = round(random 600) -300;
// Sniper .50 cal
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_leader addUniform "U_I_Ghilliesuit";
_leader addVest "V_PlateCarrierIA1_dgtl";
_leader addMagazine "5Rnd_127x108_APDS_Mag";
_leader addWeapon "srifle_GM6_SOS_F";
_leader addPrimaryWeaponItem "optic_Nightstalker";
_leader addMagazine "5Rnd_127x108_APDS_Mag";
_leader addMagazine "5Rnd_127x108_APDS_Mag";
_mission_radius = round(random 600) -300;
_mission_radius2 = round(random 600) -300;

// Sniper .408
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_man2 addUniform "U_I_Ghilliesuit";
_man2 addVest "V_PlateCarrierIA1_dgtl";
_man2 addMagazine "7Rnd_408_Mag";
_man2 addWeapon "srifle_LRR_LRPS_F";
_man2 addMagazine "7Rnd_408_Mag";
_man2 addMagazine "7Rnd_408_Mag";
_mission_radius = round(random 600) -300;
_mission_radius2 = round(random 600) -300;

// Spotter EBR
_man3 = _group createUnit ["C_man_polo_3_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_man3 addUniform "U_I_Ghilliesuit";
_man3 addVest "V_PlateCarrierIA1_dgtl";
_man3 addMagazine "20Rnd_762x51_Mag";
_man3 addWeapon "srifle_EBR_SOS_F";
_man3 addMagazine "20Rnd_762x51_Mag";
_man3 addMagazine "20Rnd_762x51_Mag";
_man3 addItem "Rangefinder";
_mission_radius = round(random 600) -300;
_mission_radius2 = round(random 600) -300;

// Spotter EBR
_man4 = _group createUnit ["C_man_polo_3_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_man4 addUniform "U_I_Ghilliesuit";
_man4 addVest "V_PlateCarrierIA1_dgtl";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addWeapon "srifle_EBR_SOS_F";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addItem "Rangefinder";
_mission_radius = round(random 600) -300;
_mission_radius2 = round(random 600) -300;

//AT Defender
_man5 = _group createUnit ["C_man_polo_3_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_man5 addUniform "U_I_Ghilliesuit";
_man5 addVest "V_HarnessOSpec_brn";
_man5 addBackpack "B_Carryall_oli";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addWeapon "srifle_DMR_01_F";
_man5 addPrimaryWeaponItem "optic_Hamr";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addMagazine "10Rnd_762x51_Mag";
_man5 addMagazine "RPG32_F";
_man5 addWeapon "launch_RPG32_F";
_man5 addMagazine "RPG32_F";
_man5 addMagazine "RPG32_F";
_man5 addMagazine "RPG32_F";
_man5 selectWeapon "launch_RPG32_F";
_mission_radius = round(random 600) -300;
_mission_radius2 = round(random 600) -300;

//AA Defender
_man6 = _group createUnit ["C_man_polo_3_F", [(_pos select 0) + _mission_radius1, (_pos select 1) + _mission_radius2, 0], [], 1, "NONE"];
_man6 addUniform "U_I_Ghilliesuit";
_man6 addVest "V_HarnessOSpec_brn";
_man6 addBackpack "B_Carryall_oli";
_man6 addMagazine "10Rnd_762x51_Mag";
_man6 addWeapon "srifle_DMR_01_F";
_man6 addPrimaryWeaponItem "optic_DMS";
_man6 addMagazine "10Rnd_762x51_Mag";
_man6 addMagazine "10Rnd_762x51_Mag";
_man6 addMagazine "Titan_AA";
_man6 addWeapon "launch_I_Titan_F";
_man6 addMagazine "Titan_AA";
_man6 addMagazine "Titan_AA";
_man6 selectWeapon "launch_I_Titan_F";

sleep 0.1; // Without this delay, headgear doesn't get removed properly

_leader = leader _group;

{
	_x call setMissionSkill;
	_x allowFleeing 0.1;
	_x addRating 9999999;
	_x addEventHandler ["Killed", server_playerDied];
} forEach units _group;

