// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup2.sqf
//	Used by Town Invasion mission
//	@file Author: AgentRev, JoSchaap

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = [_this, 2, 7, [0]] call BIS_fnc_param;
_radius = [_this, 3, 10, [0]] call BIS_fnc_param;

_unitTypes =
			[
	"C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F",
	"C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F",
	"C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F","C_journalist_F","C_Orestes",
	"C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F",
	"C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F",
	"C_man_w_worker_F","C_man_p_beggar_F","C_man_p_beggar_F_afro",
	"C_man_p_fugitive_F"
//				"I_G_Soldier_F",
//				"I_G_Soldier_lite_F",
//				"I_G_Soldier_SL_F",
//				"I_G_Soldier_SL_F",
//				"I_G_Soldier_TL_F",
//				"I_G_Soldier_AR_F",
//				"I_G_medic_F",
//				"I_G_Soldier_AR_F",
//				"I_G_medic_F",
//				"I_G_engineer_F",
//				"I_G_Soldier_exp_F",
//				"I_G_Soldier_GL_F",
//				"I_G_Soldier_M_F",
//				"I_G_Soldier_LAT_F",
//				"I_G_Soldier_A_F",
//				"I_G_officer_F"
			];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeVest _unit;
	removeBackpack _unit;
	_unit addVest "V_HarnessOSpec_gry";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addMagazine "30Rnd_556x45_Stanag";
	_unit addItemToUniform "HandGrenade";
	_unit addItemToUniform "MiniGrenade";

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_TRG21_GL_F";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addWeapon "arifle_TRG20_F";
			_unit addMagazine "RPG32_F";
			_unit addWeapon "launch_RPG32_F";
			_unit addMagazine "RPG32_F";
			_unit addMagazine "RPG32_HE_F";

		};
		// Rifleman
		default
		{
			if (_unit == leader _group) then
			{
				_unit addWeapon "srifle_DMR_01_DMS_snds_BI_F";
				_unit setRank "SERGEANT";
				_unit addMagazine "10Rnd_762x54_Mag";
				_unit addMagazine "10Rnd_762x54_Mag";
				_unit addMagazine "10Rnd_762x54_Mag";
				_unit addItemToVest "SmokeShellRed";
				_unit addItemToVest "SmokeShellGreen";
				_unit addItemToVest "SmokeShellBlue";		
			}
			else
			{
				_unit addWeapon "arifle_TRG20_F";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
//	_unit setCombatMode "GREEN";  //testing
	_unit addEventHandler ["Killed", server_playerDied];
};
