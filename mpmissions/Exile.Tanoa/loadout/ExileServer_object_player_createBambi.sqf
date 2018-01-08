/**
 * ExileServer_object_player_createBambi
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_requestingPlayer","_spawnLocationMarkerName","_thugToCheck","_HaloSpawnCheck","_bambiPlayer","_accountData","_direction","_position","_spawnAreaPosition","_spawnAreaRadius","_clanID","_clanData","_clanGroup","_player","_devFriendlyMode","_devs","_parachuteNetID","_spawnType","_parachuteObject"];
_sessionID = _this select 0;
_requestingPlayer = _this select 1;
_spawnLocationMarkerName = _this select 2;
_bambiPlayer = _this select 3;
_accountData = _this select 4;
_direction = random 360;
_Respect = (_accountData select 0);
if ((count ExileSpawnZoneMarkerPositions) isEqualTo 0) then 
{
    _position = call ExileClient_util_world_findCoastPosition;
    if ((toLower worldName) isEqualTo "namalsk") then 
    {
        while {(_position distance2D [76.4239, 107.141, 0]) < 100} do 
        {
            _position = call ExileClient_util_world_findCoastPosition;
        };
    };
}
else 
{
    _spawnAreaPosition = getMarkerPos _spawnLocationMarkerName;
    _spawnAreaRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
    _position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
    while {surfaceIsWater _position} do 
    {
        _position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
    };
};

_name = name _requestingPlayer;
_clanID = (_accountData select 3);
if !((typeName _clanID) isEqualTo "SCALAR") then
{
    _clanID = -1;
    _clanData = [];
}
else
{
    _clanData = missionNamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
    if(isNull (_clanData select 5))then
    {
        _clanGroup = createGroup independent;
        _clanData set [5,_clanGroup];
        _clanGroup setGroupIdGlobal [_clanData select 0];
        missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanData];
    }
    else
    {
        _clanGroup = (_clanData select 5);
    };
    [_player] joinSilent _clanGroup;
};
_bambiPlayer setPosATL [_position select 0,_position select 1,0];
_bambiPlayer disableAI "FSM";
_bambiPlayer disableAI "MOVE";
_bambiPlayer disableAI "AUTOTARGET";
_bambiPlayer disableAI "TARGET";
_bambiPlayer disableAI "CHECKVISIBLE";
_bambiPlayer setDir _direction;
_bambiPlayer setName _name;
_bambiPlayer setVariable ["ExileMoney", 0, true]; 
_bambiPlayer setVariable ["ExileScore", (_accountData select 0)];
_bambiPlayer setVariable ["ExileKills", (_accountData select 1)];
_bambiPlayer setVariable ["ExileDeaths", (_accountData select 2)];
_bambiPlayer setVariable ["ExileClanID", _clanID];
_bambiPlayer setVariable ["ExileClanData", _clanData];
_bambiPlayer setVariable ["ExileHunger", 100];
_bambiPlayer setVariable ["ExileThirst", 100];
_bambiPlayer setVariable ["ExileTemperature", 37];
_bambiPlayer setVariable ["ExileWetness", 0];
_bambiPlayer setVariable ["ExileAlcohol", 0]; 
_bambiPlayer setVariable ["ExileName", _name]; 
_bambiPlayer setVariable ["ExileOwnerUID", getPlayerUID _requestingPlayer]; 
_bambiPlayer setVariable ["ExileIsBambi", true];
_bambiPlayer setVariable ["ExileXM8IsOnline", false, true];
_bambiPlayer setVariable ["ExileLocker", (_accountData select 4), true];
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then 
{
    _devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
    {
        if ((getPlayerUID _requestingPlayer) isEqualTo (_x select 0))exitWith 
        {
            if((name _requestingPlayer) isEqualTo (_x select 1))then
            {
                _bambiPlayer setVariable ["ExileMoney", 500000, true];
                _bambiPlayer setVariable ["ExileScore", 100000];
            };
        };
    }
    forEach _devs;
};
_parachuteNetID = "";

_thugToCheck = _sessionID call ExileServer_system_session_getPlayerObject;
_HaloSpawnCheck = _thugToCheck getVariable ["playerWantsHaloSpawn", 0];

if (_HaloSpawnCheck isEqualTo 1) then
{
    _position set [2, getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteDropHeight")]; 
    if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "haloJump")) isEqualTo 1) then
    {
        _bambiPlayer addBackpackGlobal "B_Parachute";
        _bambiPlayer setPosATL _position;
        _spawnType = 2;
    }
    else 
    {
        _parachuteObject = createVehicle ["Steerable_Parachute_F", _position, [], 0, "CAN_COLLIDE"];
        _parachuteObject setDir _direction;
        _parachuteObject setPosATL _position;
        _parachuteObject enableSimulationGlobal true;
        _parachuteNetID = netId _parachuteObject;
        _spawnType = 1;
    };
}
else
{
    _spawnType = 0;
};

switch (true) do 
{
   case (_Respect > 0 && _Respect < 2500):
   //Bambi
     {
     _bambiPlayer forceAddUniform "Exile_Uniform_BambiOverall";
     _bambiplayer addItem "Exile_Item_PlasticBottleFreshWater";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
     
      };
   
   case (_Respect > 2499 && _Respect < 5000):
   //Bambi Plus
    {
     _bambiPlayer forceAddUniform "Exile_Uniform_BambiOverall";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PlasticBottleFreshWater";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_Noodles";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
    };
 
    case (_Respect > 4999 && _Respect < 7500):
    //Super Bambi
    {
     _bambiPlayer forceAddUniform "Exile_Uniform_BambiOverall";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PlasticBottleCoffee";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_Noodles";  
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addHeadGear "H_Hat_blue";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
    };
 
    case (_Respect > 7499 && _Respect < 10000):
    //Definetly Not a Bambi
    {
     _bambiPlayer forceAddUniform "U_C_Man_casual_5_F";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PlasticBottleCoffee";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_Noodles";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
    };
 
    case (_Respect > 9999 && _Respect < 12500):
    //Woodman
    {
     _bambiPlayer forceAddUniform "U_C_Man_casual_6_F";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PlasticBottleCoffee";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_Noodles";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
     _bambiplayer addHeadGear "H_Hat_blue";
    };
    case (_Respect > 12499 && _Respect < 15000):
    //Robber
    {
     _bambiPlayer forceAddUniform "U_C_Man_casual_1_F";
     _bambiplayer addItem "Exile_Item_PlasticBottleCoffee";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Noodles";
     _bambiPlayer addMagazine "Exile_Magazine_8Rnd_9x18";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Makarov";
     _bambiplayer addHeadGear "H_Hat_checker";
    };
    case (_Respect > 14999 && _Respect < 20000):
    //Hunter
    {
     _bambiPlayer forceAddUniform "U_C_HunterBody_grn";
     _bambiplayer addBackpack "B_HuntingBackpack";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_EnergyDrink";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Noodles";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiPlayer addMagazine "Exile_Magazine_8Rnd_9x18";
     _bambiPlayer addMagazine "Exile_Magazine_8Rnd_9x18";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Makarov";
     _bambiplayer addHeadGear "H_StrawHat_dark";
    };
    case (_Respect > 19999 && _Respect < 25000):
    //Worker
    {
     _bambiPlayer forceAddUniform "U_C_WorkerCoveralls";
     _bambiplayer addBackpack "B_HuntingBackpack";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Bandage";
     _bambiplayer addItem "Exile_Item_BeefParts";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiPlayer addMagazine "10Rnd_9x21_Mag";
     _bambiPlayer addMagazine "10Rnd_9x21_Mag";
     _bambiPlayer addWeaponGlobal "hgun_Pistol_01_F";
     _bambiplayer addHeadGear "H_Booniehat_oli";
    };
    case (_Respect > 24999 && _Respect < 30000):
    //Murderer
    {
     _bambiPlayer forceAddUniform "U_B_T_Soldier_F";
     _bambiplayer addBackpack "B_HuntingBackpack";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_Dogfood_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiPlayer addMagazine "30Rnd_9x21_Mag";
     _bambiPlayer addMagazine "30Rnd_9x21_Mag";
     _bambiPlayer addWeaponGlobal "hgun_P07_F";
     _bambiplayer addHeadGear "H_Booniehat_oli";
    };
    case (_Respect > 29999 && _Respect < 40000):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_B_T_Soldier_AR_F";
     _bambiplayer addBackpack "B_HuntingBackpack";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_CatFood_Cooked";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "8Rnd_B_Beneli_74Pellets";
     _bambiPlayer addWeaponGlobal "M1014";
     _bambiplayer addHeadGear "H_Hat_Camo";
    };
    case (_Respect > 39999 && _Respect < 50000):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_I_CombatUniform_shortsleeve";
     _bambiplayer addBackpack "B_AssaultPack_dgtl";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_CatFood_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "CUP_30Rnd_9x19_MP5";
     _bambiPlayer addWeaponGlobal "CUP_smg_MP5SD6";
     _bambiplayer addHeadGear "H_Hat_Camo";
    };
    case (_Respect > 49999 && _Respect < 60000):
    //KUT AK
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_O_OfficerUniform_ocamo";
     _bambiplayer addBackpack "B_FieldPack_ocamo";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_GloriousKnakworst_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "20Rnd_556x45_UW_Mag";
     _bambiplayer addItem "20Rnd_556x45_UW_Mag";
     _bambiPlayer addWeaponGlobal "arifle_sdar_f";
     _bambiplayer addHeadGear "H_Booniehat_oli";
     _bambiPlayer addWeapon "NVGoggles";
    };
    case (_Respect > 59999 && _Respect < 75000):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_O_T_Officer_F";
     _bambiplayer addBackpack "B_TacticalPack_ocamo";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_MacasCheese_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "CUP_30Rnd_556x45_Stanag";
     _bambiplayer addItem "CUP_30Rnd_556x45_Stanag";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiPlayer addWeaponGlobal "CUP_arifle_M16A4_Base";
     _bambiplayer addHeadGear "H_Booniehat_oli";
     _bambiPlayer addWeapon "NVGoggles";
    };
    case (_Respect > 74999 && _Respect < 100000):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_O_T_Officer_F";
     _bambiplayer addBackpack "B_Kitbag_mcamo";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_DogFood_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "30Rnd_65x39_caseless_green";
     _bambiplayer addItem "30Rnd_65x39_caseless_green";
     _bambiPlayer addWeaponGlobal "arifle_Katiba_F";
     _bambiplayer addHeadGear "H_Watchcap_blk";
     _bambiPlayer addWeapon "NVGoggles";
    };
    case (_Respect > 99999 && _Respect < 499999):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_O_T_Officer_F";
     _bambiplayer addBackpack "CUP_B_USPack_Coyote";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_DogFood_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "30Rnd_65x39_caseless_mag";
     _bambiplayer addItem "30Rnd_65x39_caseless_mag";
     _bambiPlayer addWeaponGlobal "arifle_MX_Black_F";
     _bambiplayer addHeadGear "H_Watchcap_blk";
     _bambiPlayer addWeapon "NVGoggles";
    };
    case (_Respect > 499999 && _Respect < 999999):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_B_CTRG_Soldier_urb_2_F";
     _bambiplayer addBackpack "CUP_B_USPack_Coyote";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PowerDrink";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_DogFood_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "30Rnd_762x39_mag_tracer_F";
     _bambiplayer addItem "30Rnd_762x39_mag_tracer_F";
     _bambiPlayer addWeaponGlobal "arifle_AK12_F";
     _bambiplayer addHeadGear "CUP_H_SLA_TankerHelmet";
     _bambiPlayer addWeapon "NVGoggles";
    };
   case (_Respect > 999999):
    //Prisoner
    {
     _bambiPlayer forceAddUniform "U_B_CTRG_Soldier_3_F";
     _bambiplayer addBackpack "CUP_B_USPack_Coyote";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_PlasticBottleCoffee";
     _bambiplayer addItem "Exile_Item_Vishpirin";
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Item_BBQSandwich_Cooked";
     _bambiplayer addItem "Exile_Item_CanOpener";
     _bambiplayer addItem "30Rnd_762x39_mag_tracer_F";
     _bambiplayer addItem "30Rnd_762x39_mag_tracer_F";
     _bambiplayer addItem "30Rnd_762x39_mag_tracer_F";
     _bambiPlayer addWeaponGlobal "arifle_ak12_f";
     _bambiplayer addPrimaryWeaponItem "optic_aco";
     _bambiplayer addHeadGear "CUP_H_SLA_TankerHelmet";
     _bambiPlayer addWeapon "NVGoggles";
    };
   default
     {  
     _bambiplayer forceadduniform "Exile_Uniform_BambiOverall";
     _bambiplayer addVest "V_Rangemaster_belt";
     _bambiplayer addItem "Exile_Item_Beer";   
     _bambiplayer addItem "Exile_Item_DuctTape";
     _bambiplayer addItem "Exile_Magazine_7Rnd_45ACP";
     _bambiPlayer addWeaponGlobal "Exile_Weapon_Colt1911";
     };
};
if((canTriggerDynamicSimulation _bambiPlayer) isEqualTo false) then 
{
    _bambiPlayer triggerDynamicSimulation true; 
};
_bambiPlayer addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
_bambiPlayer call ExileServer_object_player_database_insert;
_bambiPlayer call ExileServer_object_player_database_update;
[
    _sessionID, 
    "createPlayerResponse", 
    [
        _bambiPlayer, 
        _parachuteNetID, 
        str (_accountData select 0),
        (_accountData select 1),
        (_accountData select 2),
        100,
        100,
        0,
        (getNumber (configFile >> "CfgSettings" >> "BambiSettings" >> "protectionDuration")) * 60, 
        _clanData,
        _spawnType
    ]
] 
call ExileServer_system_network_send_to;
[_sessionID, _bambiPlayer] call ExileServer_system_session_update;
true