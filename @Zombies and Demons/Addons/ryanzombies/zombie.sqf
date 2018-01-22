scriptName "Zombie Brains v4.7";

/* -------------------------------- Executed by all players -------------------------------- */

_zombie = _this select 0;

_zombie setDamage 0.7;
_zombie setSpeaker "NoVoice";
_zombie enableFatigue false;
_zombie setBehaviour "CARELESS";
_zombie setUnitPos "UP";
_zombie setMimic "safe";

_zombie setVariable ["RZ_isZombie",true];
_zombie setVariable ["RZ_isDemon", _zombie isKindOf "RyanZombieboss1"];

removegoggles _zombie;

if(is3DEN) exitWith
{
	_tempArray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"]; // temp solution for EDEN
	_face = selectRandom _tempArray;
	_zombie setface _face;
};

if(local _zombie) then 
{
	_face = selectRandom RZ_FaceArray;
	[_zombie, _face] remoteExecCall ["setFace"];	
};

_soundpitch = 0.925 + random 0.15;
_zombie setPitch _soundPitch;

_group = group _zombie;
_group setCombatMode "BLUE";
_group allowFleeing 0;
_group enableAttack false;



_waitForModules = 0.5 + random 1;
sleep _waitForModules;


if (!(isnil "ryanzombiesglow") && !(_zombie getVariable "RZ_isDemon")) then {_zombie setface format ["%1_glowing",face _zombie];};
if (isnil "ryanzombiesglowdemondisable" && _zombie getVariable "RZ_isDemon") then {_zombie setface format ["%1_glowing",face _zombie];}; 

if (!(isnil "Ryanzombiesinvincible") && 	!(_zombie getVariable "RZ_isDemon")) then {_zombie allowdammage false};
if (!(isnil "Ryanzombiesinvincibledemon") && (_zombie getVariable "RZ_isDemon")) then {_zombie allowdammage false};


if (!isnil "ryanzombiesdisablescript") exitwith {};


if(local _zombie) then 
{
	_zombie addEventHandler ["HandleDamage", 
	{
		_damage = nil;
		if (((_this select 4) == "") && (_this select 0) getVariable ["RZ_isJumping",false]) then 
		{
			if(!isNil "ace_medical") then 
			{
				_damage = damage (_this select 0); // needs an ACE equivalent of getHit _index
			} else {
				_damage = (_this select 0) getHit (_this select 1);
			};
		} else {
			if (isnil "Ryanzombiesdisableexplodingheads") then 
			{
				_this call RZ_fnc_headExplodeCheck; nil
			};
			if (!isNil "RZ_HeadshotsOnly" && (_this select 1) != "head") then 
			{
				_damage = damage (_this select 0);
			};
		};		
		_damage
	}];
};

if ((!isServer) and hasInterface) exitwith {};

/* -------------------------------- Server/HC executed code below -------------------------------- */

_roamLogicName = "ryanzombieslogicroam";
_waypointLogicEnabled = "ryanzombieswaypoint";
_waypointLogicName = "ryanzombieslogicwaypoint";

if(_zombie getVariable ["RZ_isDemon",false]) then 
{
	_zombie setDamage Ryanzombieshealthdemon;
	_roamLogicName = "ryanzombieslogicroamdemon";
	_waypointLogicEnabled = "ryanzombieswaypointdemon";
	_waypointLogicName = "ryanzombieslogicwaypointdemon";
	
	if !(isnil "ryanzombiesdeletiondemons") then {[_zombie,true] execVM "\ryanzombies\delzombies.sqf"};
	
} else {
	_zombie setDamage Ryanzombieshealth;
	
	if !(isnil "ryanzombiesdeletion") then {[_zombie, false] execVM "\ryanzombies\delzombies.sqf"};
};	

_zombie setVariable ["RZ_Target",objNull];
_zombie setVariable ["RZ_TargetVehType",""];
_zombie setVariable ["RZ_isJumping",false];
_zombie setVariable ["RZ_aggressiveSoundCount",round (random 5)]; 

_class = getText (configFile >> "CfgVehicles" >> (typeof _zombie) >> "vehicleClass");
_zombie setVariable ["RZ_vehicleClass",_class];

[_zombie,_class] call RZ_fnc_zombie_setAnimSpeedCoef;



_zombie addEventHandler ["Killed",{ _this call RZ_fnc_zombie_onDeath; }];
if (isnil "ryanzombiesdisablebleeding") then 
{
	_zombie addMPEventHandler ["MPHit", {(_this select 0) setBleedingRemaining 1}];
};



// Main loop
while {alive _zombie} do
{
	_maxTargetFindingAttempts = 5 + (round (random 3));
	_zombie setVariable ["RZ_maxAttempts",_maxTargetFindingAttempts];
	
	if(isNull (_zombie getVariable "RZ_Target")) then 
	{
		_zombie setFormDir random 360;
		if (isnil "ryanzombiesdisablemoaning") then 
		{
			_moanSound = selectRandom ([_zombie,"moan"] call RZ_fnc_zombie_getZombieSoundArray); 
			[_zombie, _moanSound] remoteExecCall ["say3d"];
		};
		if !(isnil _roamLogicName) then 
		{
			_zombie call RZ_fnc_zombie_roam;
		};
		if !(isnil _waypointLogicEnabled) then 
		{
			[_zombie,_waypointLogicName] call RZ_fnc_zombie_gotoWaypoint;
		};
	};
	_zombie call RZ_fnc_zombie_findTargetLoop;
};






