_zombie = _this select 0;

_zombie sethit ["body",0.5];

if (isDedicated || !hasInterface) exitWith {};
removeGoggles _zombie;
if(is3DEN) exitWith {};

sleep 0.5;

waitUntil{!isNil "BIS_fnc_init"};
waituntil {!(IsNull (findDisplay 46))};


if (player != _zombie) exitWith {_zombie disableAI "ANIM";};


_face = selectRandom RZ_FaceArray;
[_zombie, _face] remoteExecCall ["setFace"];


if (isnil "Ryanzombiesattackspeedplayer") then {Ryanzombiesattackspeedplayer = 0.8};
if (isnil "Ryanzombiesattackdistanceplayer") then {Ryanzombiesattackdistanceplayer = 2.35};
if (isnil "Ryanzombiesattackstrenthplayer") then {Ryanzombiesattackstrenthplayer = 1.5};
if (isnil "Ryanzombiesdamageplayer") then {Ryanzombiesdamageplayer = 0.15};
if (isnil "Ryanzombiesdamagecarplayer") then {Ryanzombiesdamagecarplayer = 0.02};
if (isnil "Ryanzombiesdamageairplayer") then {Ryanzombiesdamageairplayer = 0.01};
if (isnil "Ryanzombiesdamagetankplayer") then {Ryanzombiesdamagetankplayer = 0.002};
if (isnil "Ryanzombiesdamagecarstrenthplayer") then {Ryanzombiesdamagecarstrenthplayer = 1.5};
if (isnil "Ryanzombiesdamageairstrenthplayer") then {Ryanzombiesdamageairstrenthplayer = 1};
if (isnil "Ryanzombiesdamagetankstrenthplayer") then {Ryanzombiesdamagetankstrenthplayer = 0.4};

_zombie enableFatigue false;



#include "\a3\editor_f\Data\Scripts\dikCodes.h"



RZ_PC_MouseEH = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", 
{
	_ret = false;
	if(vehicle player isKindOf "RyanZombiePlayer1") then 
	{	
		if ((_this select 1) == 0) then 
		{
			if((time - (player getVariable ["RZ_TimeLastAttack",0])) > Ryanzombiesattackspeedplayer) then 
			{
				player call RZ_fnc_Attack;
			};	
			_ret = false;
		};
	};
	_ret
}];

_cbaEnabled = isClass(configFile >> "CfgPatches" >> "cba_main");

if(_cbaEnabled) then 
{
	["Zombies and Demons","pounce", "Pounce", 
	{
		if(vehicle player isKindOf "RyanZombiePlayer1") then 
		{
			if((time - (player getVariable ["RZ_TimeLastPounce",0])) > 0.05) then 
			{		
				player call RZ_fnc_Pounce;
			};
		};
	}, {}, [DIK_SPACE, [false, false, false]],true] call CBA_fnc_addKeybind;	
	
	["Zombies and Demons","pounce2", "Pounce w/Shift", 
	{		
		if(vehicle player isKindOf "RyanZombiePlayer1") then 
		{
			if((time - (player getVariable ["RZ_TimeLastPounce",0])) > 0.05) then 
			{		
				player call RZ_fnc_Pounce;
			};
		};
	}, {}, [DIK_SPACE, [true, false, false]],true] call CBA_fnc_addKeybind;	
	
	
	["Zombies and Demons","taunt", "Taunt", 
	{		
		if(vehicle player isKindOf "RyanZombiePlayer1") then 
		{
			if((time - (player getVariable ["RZ_TimeLastTaunt",0])) > 1) then 
			{
				player call RZ_fnc_Taunt;
			};	
		};
	}, {}, [DIK_T, [false,false,false]],false] call CBA_fnc_addKeybind;
	
	
	["Zombies and Demons","attack", "Attack (besides LMB)", 
	{		
		if(vehicle player isKindOf "RyanZombiePlayer1") then 
		{
			if((time - (player getVariable ["RZ_TimeLastAttack",0])) > Ryanzombiesattackspeedplayer) then 
			{
				player call RZ_fnc_Attack;
			};	
		};
	}, {}, [-1, [false,false,false]],false] call CBA_fnc_addKeybind;	
} else {

	RZ_PC_KeyEH = (findDisplay 46) displayAddEventHandler ["KeyDown", 
	{
		_ret = false;
		if(vehicle player isKindOf "RyanZombiePlayer1") then 
		{
			_keyPressed = _this select 1;
			
			if (_keyPressed == DIK_SPACE) then 
			{
				if((time - (player getVariable ["RZ_TimeLastPounce",0])) > 0.05) then 
				{		
					player call RZ_fnc_Pounce;
				};
				_ret = true;
			};	
			
			if (_keyPressed == DIK_T) then 
			{
				if((time - (player getVariable ["RZ_TimeLastTaunt",0])) > 1) then 
				{		
					player call RZ_fnc_Taunt;
				};
				_ret = true;
			};
		};
		_ret
	}];	
};

_fallDamageEH = player addEventHandler ["HandleDamage", 
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
	};
	(_this select 0) setHit ["body",0.5];		
	_damage
}];

if !(isnil "ryanzombiesmovementspeedplayer") then {player setAnimSpeedCoef ryanzombiesmovementspeedplayer; };

RZ_Effects_Array = [];

_respawnEH = player addEventHandler ["Respawn",
{
	_zombie = _this select 0;
	if(!(alive _zombie) || !(canMove _zombie)) exitWith {}; 
	if(!(_zombie isKindOf "RyanZombiePlayer1")) exitWith {};

	_zombie setdamage 0;
	_zombie setHit ["body",0.5];

	if !(isnil "ryanzombiesmovementspeedplayer") then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedplayer; };

	_face = selectRandom RZ_FaceArray;
	[_zombie, _face] remoteExecCall ["setFace"];

	ppEffectDestroy RZ_Effects_Array;

	_colors = ppEffectCreate ["colorCorrections",1600]; _blur = ppEffectCreate ["RadialBlur",1601]; _inversion = ppEffectCreate ["ColorInversion",1602];
	[_colors,_blur,_inversion] ppEffectEnable RZ_PlayerZombiePPEnabled;

	_colors ppEffectAdjust[ 1, 1, 0, [-0.06, -0.06, 0.06, 0],[-0.24, 0.05, 0.07, 1.17],[0.49, 5, 5, 5]];
	_blur ppEffectAdjust[0.09, 0, 0.26, 0.35];
	_inversion ppEffectAdjust[0.27, 0.2, 0.29];

	[_colors,_blur,_inversion] ppEffectCommit 0;

	RZ_Effects_Array = [_colors,_blur,_inversion];

	_zombie enableFatigue false;
	removegoggles _zombie;
	
}];

player setdamage 0;
player sethit ["body",0.5];


_colors = ppEffectCreate ["colorCorrections",1600]; _blur = ppEffectCreate ["RadialBlur",1601]; _inversion = ppEffectCreate ["ColorInversion",1602];
[_colors,_blur,_inversion] ppEffectEnable RZ_PlayerZombiePPEnabled;

_colors ppEffectAdjust[ 1, 1, 0, [-0.06, -0.06, 0.06, 0],[-0.24, 0.05, 0.07, 1.17],[0.49, 5, 5, 5]];
_blur ppEffectAdjust[0.09, 0, 0.26, 0.35];
_inversion ppEffectAdjust[0.27, 0.2, 0.29];

[_colors,_blur,_inversion] ppEffectCommit 0;

RZ_Effects_Array = [_colors,_blur,_inversion];