_zombie = player;

if((time - (_zombie getVariable ["RZ_TimeLastAttack",0])) > Ryanzombiesattackspeedplayer) then 
{
	if(stance _zombie == "PRONE" || stance _zombie == "UNDEFINED") exitWith{};

	_targets = nearestobjects [_zombie, ["Man","Land","Air"], 10];   
	_target = objNull;
	if(count _targets >= 2) then 
	{
		_targets deleteAt 0;
		{
			if((alive _x) || !(_x iskindof "man")) exitWith { _target = _x };
		} foreach _targets;
	};
	
	if(stance _zombie == "STAND") then
	{
		[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
	};
	if(stance _zombie == "CROUCH") then 
	{

		[_zombie, "AinvPknlMstpSnonWnonDnon_2"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
	};
	
	_attackSound = selectRandom RZ_NormalZombieAttackArray;
	playsound3d [_attackSound, _zombie];

	_zombie setVariable ["RZ_TimeLastAttack",time];
	if(isNull _target) exitWith {};	

	_rDir = _zombie getRelDir (vehicle _target);
	if((_rDir > 0 && _rDir < 40) || (_rDir > 320 && _rDir < 360)) then
	{
		[_target,_zombie] spawn 
		{
			params ["_target","_zombie"];
			
			if (vehicle _target iskindof "man") then
			{
				if(_zombie distance _target < Ryanzombiesattackdistanceplayer) then
				{
					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < Ryanzombiesattackdistanceplayer && (alive _target) && (alive _zombie) && !(lineIntersects [eyepos _zombie, eyepos _target,_zombie,_target])) then
					{
						_biteSound = selectRandom RZ_ZombieHitArray;
						playsound3d [_biteSound, _target];

						[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"];

						[_target,group _zombie] remoteExecCall ["RZ_ServerSided_AttackScriptsInfantry",2];
						
						_scream = selectRandom RZ_HumanScreamArray;
						[_target, _scream] remoteExecCall ["say3d"];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesattackstrenthplayer), (_vel select 1) + (cos _dir * Ryanzombiesattackstrenthplayer), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity",_target];
					};
				};
				
			} else {
				if ((vehicle _target iskindof "car") && _zombie distance _target < 7 && !(lineIntersects [eyepos _zombie, eyepos _target,_zombie,_target])) then
				{
					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < 7 && (alive _zombie)) then
					{
						_count = count (getAllHitPointsDamage _target select 0);
						_index = 0;
						_damage = random Ryanzombiesdamagecarplayer;

						while {_count > _index} do
						{
							if ((getAllHitPointsDamage _target select 0) select _index != "HitFuel") then {[_target, [_index,(_target getHitIndex _index)+_damage]] remoteExecCall ["fnc_RyanZombies_SetHitIndex",_target]};
							_index = _index + 1;
						};

						if ((getnumber (configfile >> "CfgVehicles" >> typeof _target >> "armor")) < 90) then 
						{
							if !(canmove _target) then 
							{
								{
									if (random 10 < 1) then 
									{
										_scream = selectRandom RZ_HumanScreamArray;
										[_x, _scream] remoteExecCall ["say3d"];
									}
								} foreach crew _target; 
								[crew _target,group _zombie] remoteExecCall ["RZ_ServerSided_AttackScriptsVehicle",2];
							};
						};

						_vehicleHitSound = selectRandom RZ_VehicleHitArray;
						playsound3d [_vehicleHitSound, _target];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamagecarstrenthplayer), (_vel select 1) + (cos _dir * Ryanzombiesdamagecarstrenthplayer), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity",_target];
					};
				};

				
				if ((vehicle _target iskindof "tank") && _zombie distance _target < 8 && !(lineIntersects [eyepos _zombie, eyepos _target,_zombie,_target])) then
				{
					_target allowfleeing 1;
					sleep 0.3;
					if (_zombie distance _target < 8 && (alive _zombie)) then
					{
						_count = count (getAllHitPointsDamage _target select 0);
						_index = 0;
						_damage = random Ryanzombiesdamagetankplayer;

						while {_count > _index} do
						{
							if ((getAllHitPointsDamage _target select 0) select _index != "HitHull") then {[_target, [_index,(_target getHitIndex _index)+_damage]] remoteExecCall ["fnc_RyanZombies_SetHitIndex",_target]};
							_index = _index + 1;
						};

						_vehicleHitSound = selectRandom RZ_VehicleHitArray;
						playsound3d [_vehicleHitSound, _target];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamagetankstrenthplayer), (_vel select 1) + (cos _dir * Ryanzombiesdamagetankstrenthplayer), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity",_target];
					};
				};

				
				if ((vehicle _target iskindof "air") && _zombie distance _target < 10) then
				{
					sleep 0.3;
					if (_zombie distance _target < 10 && (alive _zombie)) then
					{
						vehicle _target setdamage (damage (vehicle _target) + Ryanzombiesdamageairplayer);

						_vehicleHitSound = selectRandom RZ_VehicleHitArray;
						playsound3d [_vehicleHitSound, _target];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesdamageairstrenthplayer), (_vel select 1) + (cos _dir * Ryanzombiesdamageairstrenthplayer), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity",_target];
					};
				};

				
				if ((vehicle _target iskindof "staticweapon" OR vehicle _target iskindof "ship") && _zombie distance _target < 4.5 && !(lineIntersects [eyepos _zombie, eyepos _target,_zombie,_target])) then
				{
					sleep 0.3;
					if (_zombie distance _target < 4.5 && (alive _zombie)) then
					{
						[_target,group _zombie] remoteExecCall ["RZ_ServerSided_AttackScriptsInfantry",2];

						_biteSound = selectRandom RZ_ZombieHitArray;
						playsound3d [_biteSound, _target];

						_vel = velocity _target;
						_dir = direction _zombie;
						[_target, [(_vel select 0) + (sin _dir * Ryanzombiesattackstrenthplayer), (_vel select 1) + (cos _dir * Ryanzombiesattackstrenthplayer), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity",_target];
					};
				};		
			};
		};
	};	
};