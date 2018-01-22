ZnD_modVersion = 4.7;

if (isnil "Ryanzombiesfncs") then
{
	Ryanzombiesfncs = 1;
		
	if (isnil "Ryanzombiesattackspeed") then {Ryanzombiesattackspeed = 0.8};
	if (isnil "Ryanzombiesattackdistance") then {Ryanzombiesattackdistance = 2.35};
	if (isnil "Ryanzombiesattackstrenth") then {Ryanzombiesattackstrenth = 1.5};
	
	if (isnil "Ryanzombiesdamage") then {Ryanzombiesdamage = 0.15};
	if (isnil "Ryanzombiesdamagecar") then {Ryanzombiesdamagecar = 0.02};
	if (isnil "Ryanzombiesdamageair") then {Ryanzombiesdamageair = 0.01};
	if (isnil "Ryanzombiesdamagetank") then {Ryanzombiesdamagetank = 0.002};
	
	if (isnil "Ryanzombiesdamagecarstrenth") then {Ryanzombiesdamagecarstrenth = 1.5};
	if (isnil "Ryanzombiesdamageairstrenth") then {Ryanzombiesdamageairstrenth = 1};
	if (isnil "Ryanzombiesdamagetankstrenth") then {Ryanzombiesdamagetankstrenth = 0.4};
	
	if (isnil "Ryanzombiesdamagecaliberneeded") then {Ryanzombiesdamagecaliberneeded = 2.3;};
	
	if(isnil "RZ_ACEDamageMultiplier") then { RZ_ACEDamageMultiplier = 2; };
	

	if (isnil "ryanzombieshealthdemon") then 	{Ryanzombieshealthdemon = 0.7};
	if (isnil "ryanzombieshealth") then 		{Ryanzombieshealth = 0.7};
	if (isnil "ryanzombieslimit") then 			{Ryanzombieslimit = 5000};	
	

	// functions designed to be compatible with remoteExec's 'function-whitelisting-mode' that is unfortunately broken (at least in a3 1.64)
	fnc_RyanZombies_SwitchMove = compileFinal "_this select 0 switchmove (_this select 1)";
	fnc_RyanZombies_PlayMoveNow = compileFinal "_this select 0 playmovenow (_this select 1)";
	fnc_RyanZombies_DoMoveLocalized = compileFinal "_this select 0 domove (_this select 1)";
	fnc_RyanZombies_Bleeding = compileFinal "_this select 0 setBleedingRemaining (_this select 1)";
	fnc_RyanZombies_Velocity = compileFinal "if(local (_this select 0)) then {_this select 0 setvelocity (_this select 1)}";
	fnc_RyanZombies_SetHitIndex = compileFinal "if(local (_this select 0)) then {_this select 0 setHitIndex (_this select 1)}";
	fnc_RyanZombies_execVM = compileFinal "(_this select 0) execVM (_this select 1)";
	fnc_RyanZombies_AddCamShake = compileFinal "if(local (_this select 1)) then {AddCamShake (_this select 0)};";
	fnc_RyanZombies_RemoveGroups = compileFinal "{if (count units _x == 0) then {deletegroup _x}} foreach allgroups;";
	
	RZ_fnc_Pounce = compile preprocessfilelinenumbers "\ryanzombies\playercontrolled\pounce.sqf";
	RZ_fnc_Attack = compile preprocessfilelinenumbers "\ryanzombies\playercontrolled\attack.sqf";
	RZ_fnc_Taunt = compile preprocessfilelinenumbers "\ryanzombies\playercontrolled\taunt.sqf";
	
	RZ_VehicleAlarmsEnabled = true; 
	RZ_PlayerZombiePPEnabled = true;

	// ------------- arrays -------------
	
	RZ_FaceArray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"];

	
	// ------------ sound arrays ------------
	
	RZ_NormalZombieAttackArray = ["ryanzombies\sounds\attack1.ogg", "ryanzombies\sounds\attack2.ogg", "ryanzombies\sounds\attack3.ogg", "ryanzombies\sounds\attack4.ogg", "ryanzombies\sounds\attack5.ogg"];
	RZ_NormalZombieMoanArray = ["ryanzombiesmoan1","ryanzombiesmoan2","ryanzombiesmoan3","ryanzombiesmoan4","ryanzombiesmoan5","ryanzombiesmoan6","ryanzombiesmoan7"]; // relative path
	RZ_NormalZombieAggressiveArray = ["ryanzombies\sounds\aggressive1.ogg", "ryanzombies\sounds\aggressive2.ogg", "ryanzombies\sounds\aggressive3.ogg", "ryanzombies\sounds\aggressive4.ogg", "ryanzombies\sounds\aggressive5.ogg", "ryanzombies\sounds\aggressive6.ogg", "ryanzombies\sounds\aggressive7.ogg", "ryanzombies\sounds\aggressive8.ogg", "ryanzombies\sounds\aggressive9.ogg", "ryanzombies\sounds\aggressive10.ogg", "ryanzombies\sounds\aggressive11.ogg", "ryanzombies\sounds\aggressive12.ogg", "ryanzombies\sounds\aggressive13.ogg", "ryanzombies\sounds\aggressive14.ogg", "ryanzombies\sounds\aggressive15.ogg", "ryanzombies\sounds\aggressive16.ogg", "ryanzombies\sounds\aggressive17.ogg", "ryanzombies\sounds\aggressive18.ogg", "ryanzombies\sounds\aggressive19.ogg", "ryanzombies\sounds\aggressive20.ogg", "ryanzombies\sounds\aggressive21.ogg", "ryanzombies\sounds\aggressive22.ogg", "ryanzombies\sounds\aggressive23.ogg", "ryanzombies\sounds\aggressive24.ogg", "ryanzombies\sounds\aggressive25.ogg", "ryanzombies\sounds\aggressive26.ogg", "ryanzombies\sounds\aggressive27.ogg", "ryanzombies\sounds\aggressive28.ogg", "ryanzombies\sounds\aggressive29.ogg", "ryanzombies\sounds\aggressive30.ogg", "ryanzombies\sounds\aggressive31.ogg", "ryanzombies\sounds\aggressive32.ogg", "ryanzombies\sounds\aggressive33.ogg", "ryanzombies\sounds\aggressive34.ogg", "ryanzombies\sounds\aggressive35.ogg", "ryanzombies\sounds\aggressive36.ogg", "ryanzombies\sounds\aggressive37.ogg", "ryanzombies\sounds\aggressive38.ogg", "ryanzombies\sounds\aggressive39.ogg", "ryanzombies\sounds\aggressive40.ogg", "ryanzombies\sounds\aggressive41.ogg", "ryanzombies\sounds\aggressive42.ogg", "ryanzombies\sounds\aggressive43.ogg", "ryanzombies\sounds\aggressive44.ogg", "ryanzombies\sounds\aggressive45.ogg", "ryanzombies\sounds\aggressive46.ogg", "ryanzombies\sounds\aggressive47.ogg", "ryanzombies\sounds\aggressive48.ogg", "ryanzombies\sounds\aggressive49.ogg", "ryanzombies\sounds\aggressive50.ogg", "ryanzombies\sounds\aggressive51.ogg", "ryanzombies\sounds\aggressive52.ogg", "ryanzombies\sounds\aggressive53.ogg", "ryanzombies\sounds\aggressive54.ogg", "ryanzombies\sounds\aggressive55.ogg", "ryanzombies\sounds\aggressive56.ogg", "ryanzombies\sounds\aggressive57.ogg", "ryanzombies\sounds\aggressive58.ogg", "ryanzombies\sounds\aggressive59.ogg", "ryanzombies\sounds\aggressive60.ogg", "ryanzombies\sounds\aggressive61.ogg", "ryanzombies\sounds\aggressive62.ogg", "ryanzombies\sounds\aggressive63.ogg", "ryanzombies\sounds\aggressive64.ogg", "ryanzombies\sounds\aggressive65.ogg", "ryanzombies\sounds\aggressive66.ogg", "ryanzombies\sounds\aggressive67.ogg", "ryanzombies\sounds\aggressive68.ogg", "ryanzombies\sounds\aggressive69.ogg", "ryanzombies\sounds\aggressive70.ogg", "ryanzombies\sounds\aggressive71.ogg", "ryanzombies\sounds\aggressive72.ogg", "ryanzombies\sounds\aggressive73.ogg", "ryanzombies\sounds\aggressive74.ogg", "ryanzombies\sounds\aggressive75.ogg", "ryanzombies\sounds\aggressive76.ogg", "ryanzombies\sounds\aggressive77.ogg", "ryanzombies\sounds\aggressive78.ogg", "ryanzombies\sounds\aggressive79.ogg", "ryanzombies\sounds\aggressive80.ogg"];
		
	RZ_DemonAttackArray = ["ryanzombies\sounds\attack_demon1.ogg", "ryanzombies\sounds\attack_demon2.ogg", "ryanzombies\sounds\attack_demon3.ogg", "ryanzombies\sounds\attack_demon4.ogg", "ryanzombies\sounds\attack_demon5.ogg"];
	RZ_DemonDemonHitArray = ["ryanzombies\sounds\demon_hit1.ogg", "ryanzombies\sounds\demon_hit2.ogg"];
	RZ_DemonAggressiveArray = ["ryanzombies\sounds\aggressive_demon1.ogg", "ryanzombies\sounds\aggressive_demon2.ogg", "ryanzombies\sounds\aggressive_demon3.ogg", "ryanzombies\sounds\aggressive_demon4.ogg", "ryanzombies\sounds\aggressive_demon5.ogg", "ryanzombies\sounds\aggressive_demon6.ogg", "ryanzombies\sounds\aggressive_demon7.ogg", "ryanzombies\sounds\aggressive_demon8.ogg"];
	RZ_DemonMoanArray = ["ryanzombiesmoanboss1","ryanzombiesmoanboss2","ryanzombiesmoanboss3","ryanzombiesmoanboss4"]; // relative path
		
	RZ_SpiderZombieAggressiveArray = ["ryanzombies\sounds\aggressive_spider1.ogg", "ryanzombies\sounds\aggressive_spider2.ogg", "ryanzombies\sounds\aggressive_spider3.ogg", "ryanzombies\sounds\aggressive_spider4.ogg", "ryanzombies\sounds\aggressive_spider5.ogg", "ryanzombies\sounds\aggressive_spider6.ogg", "ryanzombies\sounds\aggressive_spider7.ogg", "ryanzombies\sounds\aggressive_spider8.ogg", "ryanzombies\sounds\aggressive_spider9.ogg", "ryanzombies\sounds\aggressive_spider10.ogg", "ryanzombies\sounds\aggressive_spider11.ogg", "ryanzombies\sounds\aggressive_spider12.ogg", "ryanzombies\sounds\aggressive_spider13.ogg", "ryanzombies\sounds\aggressive_spider14.ogg", "ryanzombies\sounds\aggressive_spider15.ogg", "ryanzombies\sounds\aggressive_spider16.ogg", "ryanzombies\sounds\aggressive_spider17.ogg", "ryanzombies\sounds\aggressive_spider18.ogg", "ryanzombies\sounds\aggressive_spider19.ogg", "ryanzombies\sounds\aggressive_spider20.ogg", "ryanzombies\sounds\aggressive_spider21.ogg", "ryanzombies\sounds\aggressive_spider22.ogg", "ryanzombies\sounds\aggressive_spider23.ogg", "ryanzombies\sounds\aggressive_spider24.ogg", "ryanzombies\sounds\aggressive_spider25.ogg", "ryanzombies\sounds\aggressive_spider26.ogg", "ryanzombies\sounds\aggressive_spider27.ogg", "ryanzombies\sounds\aggressive_spider28.ogg", "ryanzombies\sounds\aggressive_spider29.ogg", "ryanzombies\sounds\aggressive_spider30.ogg", "ryanzombies\sounds\aggressive_spider31.ogg", "ryanzombies\sounds\aggressive_spider32.ogg", "ryanzombies\sounds\aggressive_spider33.ogg", "ryanzombies\sounds\aggressive_spider34.ogg", "ryanzombies\sounds\aggressive_spider35.ogg", "ryanzombies\sounds\aggressive_spider36.ogg", "ryanzombies\sounds\aggressive_spider37.ogg", "ryanzombies\sounds\aggressive_spider38.ogg", "ryanzombies\sounds\aggressive_spider39.ogg", "ryanzombies\sounds\aggressive_spider40.ogg"];

	RZ_CrawlerAggressiveArray = ["ryanzombies\sounds\aggressive_crawler1.ogg", "ryanzombies\sounds\aggressive_crawler2.ogg", "ryanzombies\sounds\aggressive_crawler3.ogg", "ryanzombies\sounds\aggressive_crawler4.ogg", "ryanzombies\sounds\aggressive_crawler5.ogg", "ryanzombies\sounds\aggressive_crawler6.ogg", "ryanzombies\sounds\aggressive_crawler7.ogg", "ryanzombies\sounds\aggressive_crawler8.ogg", "ryanzombies\sounds\aggressive_crawler9.ogg", "ryanzombies\sounds\aggressive_crawler10.ogg", "ryanzombies\sounds\aggressive_crawler11.ogg", "ryanzombies\sounds\aggressive_crawler12.ogg", "ryanzombies\sounds\aggressive_crawler13.ogg", "ryanzombies\sounds\aggressive_crawler14.ogg", "ryanzombies\sounds\aggressive_crawler15.ogg", "ryanzombies\sounds\aggressive_crawler16.ogg", "ryanzombies\sounds\aggressive_crawler17.ogg", "ryanzombies\sounds\aggressive_crawler18.ogg", "ryanzombies\sounds\aggressive_crawler19.ogg", "ryanzombies\sounds\aggressive_crawler20.ogg", "ryanzombies\sounds\aggressive_crawler21.ogg", "ryanzombies\sounds\aggressive_crawler22.ogg", "ryanzombies\sounds\aggressive_crawler23.ogg", "ryanzombies\sounds\aggressive_crawler24.ogg"]; 
	RZ_CrawlerAttackArray = ["ryanzombies\sounds\attack_crawler1.ogg", "ryanzombies\sounds\attack_crawler2.ogg"];
	RZ_CrawlerHitArray = ["ryanzombies\sounds\crawler_hit1.ogg", "ryanzombies\sounds\crawler_hit2.ogg"];
	
	RZ_ZombieJumpArray = ["ryanzombies\sounds\jump1.ogg", "ryanzombies\sounds\jump2.ogg", "ryanzombies\sounds\jump3.ogg", "ryanzombies\sounds\jump4.ogg", "ryanzombies\sounds\jump5.ogg", "ryanzombies\sounds\jump6.ogg"];
	RZ_ZombieEatingArray = ["ryanzombies\sounds\eat1.ogg", "ryanzombies\sounds\eat2.ogg", "ryanzombies\sounds\eat3.ogg", "ryanzombies\sounds\eat4.ogg", "ryanzombies\sounds\eat5.ogg"];	
	RZ_ZombieHitArray = ["ryanzombies\sounds\zombie_bite.ogg"];

	RZ_HumanScreamArray = ["ryanzombiesscream1", "ryanzombiesscream2", "ryanzombiesscream3", "ryanzombiesscream4", "ryanzombiesscream5", "ryanzombiesscream6", "ryanzombiesscream7", "ryanzombiesscream8", "ryanzombiesscream9"]; // relative path
	
	RZ_HumanCoughArray = ["ryanzombiescough1", "ryanzombiescough2", "ryanzombiescough3", "ryanzombiescough4", "ryanzombiescough5", "ryanzombiescough6", "ryanzombiescough7", "ryanzombiescough8", "ryanzombiescough9", "ryanzombiescough10", "ryanzombiescough11", "ryanzombiescough12", "ryanzombiescough13", "ryanzombiescough14"]; // relative path
	RZ_HumanInfectedDeathArray = ["ryanzombies\sounds\infected_death1.ogg", "ryanzombies\sounds\infected_death2.ogg"];	

	RZ_VehicleThrowArray = ["ryanzombies\sounds\vehicle_throw1.ogg", "ryanzombies\sounds\vehicle_throw2.ogg"];
	RZ_VehicleHitArray = ["ryanzombies\sounds\vehicle_hit1.ogg", "ryanzombies\sounds\vehicle_hit2.ogg", "ryanzombies\sounds\vehicle_hit3.ogg", "ryanzombies\sounds\vehicle_hit4.ogg"];
	RZ_VehicleSplatArray = ["ryanzombies\sounds\vehicle_splat1.ogg", "ryanzombies\sounds\vehicle_splat2.ogg", "ryanzombies\sounds\vehicle_splat3.ogg"];

	RZ_HeadExplodeArray = ["ryanzombies\sounds\HeadExplode1.ogg", "ryanzombies\sounds\HeadExplode2.ogg", "ryanzombies\sounds\HeadExplode3.ogg"];

	// ------------ inline functions ------------
	
	RZ_fnc_zombie_roam = 
	{
		private _zombie = _this;
		_roamPos = [(getposATL _zombie select 0) + random 15 - random 15, (getposATL _zombie select 1) + random 15 - random 15];
		if !(local _zombie) then 
		{
			[_zombie, _roamPos] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
		} else {
			_zombie domove _roamPos;
		};	
	};	

	RZ_fnc_zombie_gotoWaypoint = 
	{
		params ["_zombie","_waypointName"];
		_waypoint = call compile _waypointName;
		_waypointPos = [(getposATL _waypoint select 0) + random 15 - random 15, (getposATL _waypoint select 1) + random 15 - random 15, getposATL _waypoint select 2];
		if !(local _zombie) then 
		{
			[_zombie, _waypointPos] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
		} else {
			_zombie domove _waypointPos;
		};
	};	


	RZ_fnc_zombie_dropLoot =
	{
		private _zombie = _this;
		if (_zombie iskindof "RyanZombieB_Soldier_base_F") then
		{
			_loot = "GroundWeaponHolder" createvehicle getposATL _zombie;
			_loot setposATL getposATL _zombie;
			_loot setVariable ["RZ_Loot_TimeSpawned",time];
			RZ_AllLoot pushback _loot;
			if ((random 100 <= ryanzombiesitemschanceSoldier) && !(ryanzombiesitemsSoldier isEqualTo [])) then
			{
				_item = selectRandom ryanzombiesitemsSoldier;
				_itemAmount = (ryanzombiesitemsminSoldier + (round (random (ryanzombiesitemsmaxSoldier - ryanzombiesitemsminSoldier))));
				_loot additemcargoglobal [_item,_itemAmount];
			};
			if ((random 100 <= ryanzombiesmagazineschanceSoldier) && !(ryanzombiesmagazinesSoldier isEqualTo [])) then
			{
				_magazine = selectRandom ryanzombiesmagazinesSoldier;
				_magazineAmount = (ryanzombiesmagazinesminSoldier + (round (random (ryanzombiesmagazinesmaxSoldier - ryanzombiesmagazinesminSoldier))));
				_loot addmagazinecargoglobal [_magazine,_magazineAmount];
			};
			if ((random 100 <= ryanzombiesweaponschanceSoldier) && !(ryanzombiesweaponsSoldier isEqualTo [])) then
			{
				_weapon = selectRandom ryanzombiesweaponsSoldier;
				_weaponAmount = (ryanzombiesweaponsminSoldier + (round (random (ryanzombiesweaponsmaxSoldier - ryanzombiesweaponsminSoldier))));
				_loot addweaponcargoglobal [_weapon,_weaponAmount];
			};
		}
		else
		{
			_loot = "GroundWeaponHolder" createvehicle getposATL _zombie;
			_loot setposATL getposATL _zombie;
			_loot setVariable ["RZ_Loot_TimeSpawned",time];
			RZ_AllLoot pushback _loot;
			if ((random 100 <= ryanzombiesitemschance) && !(ryanzombiesitems isEqualTo [])) then
			{
				_item = selectRandom ryanzombiesitems;
				_itemAmount = (ryanzombiesitemsmin + (round (random (ryanzombiesitemsmax - ryanzombiesitemsmin))));
				_loot additemcargoglobal [_item,_itemAmount];
			};
			if ((random 100 <= ryanzombiesmagazineschance) && !(ryanzombiesmagazines isEqualTo [])) then
			{
				_magazine = selectRandom ryanzombiesmagazines;
				_magazineAmount = (ryanzombiesmagazinesmin + (round (random (ryanzombiesmagazinesmax - ryanzombiesmagazinesmin))));
				_loot addmagazinecargoglobal [_magazine,_magazineAmount];
			};
			if ((random 100 <= ryanzombiesweaponschance) && !(ryanzombiesweapons isEqualTo [])) then
			{
				_weapon = selectRandom ryanzombiesweapons;
				_weaponAmount = (ryanzombiesweaponsmin + (round (random (ryanzombiesweaponsmax - ryanzombiesweaponsmin))));
				_loot addweaponcargoglobal [_weapon,_weaponAmount];
			};
		};
	};

	RZ_fnc_zombie_onDeath_exec = { }; // allows users to add code here if they wish to add events upon zombie deaths (such as extra points, notifications, et cetera) - run in unscheduled environment.

	RZ_fnc_zombie_onDeath =
	{
		params ["_zombie","_killer"];
		
		if (isnull _zombie) exitwith
		{
			remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
		};
		_newgroup = creategroup civilian;
		[_zombie] join _newgroup;
		
		if !(isnull _killer && _killer != _zombie) then 
		{
			if ((!(vehicle _killer iskindof "man") && (speed _killer > 20)) && (_zombie distance _killer < 12.5)) then 
			{ 
				_vehicleSplat = selectRandom RZ_VehicleSplatArray; 
				playsound3d [_vehicleSplat, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
			};
		};
		
		_face = face _zombie;
		if (_face find "Glowing" != 0) then 
		{
			_ngface = (_face splitstring "_") select 0;
			[_zombie, _ngface] remoteExecCall ["setFace"];
		};
		
		if !(isnil "ryanzombiesAllLoot") then
		{
			_zombie call RZ_fnc_zombie_dropLoot;
		};
	
		
		_zombie spawn 
		{
			_zombie = _this;
			
			sleep 60;
			remoteExecCall ["fnc_RyanZombies_RemoveGroups", owner _zombie];
			if !(isnil "Ryanzombiesdelete") then 
			{
				deletevehicle _zombie;
			};
		};
		
		[_zombie,_killer] call RZ_fnc_zombie_onDeath_exec;		
	};

	RZ_fnc_zombie_getZombieSoundArray =
	{
		params ["_zombie","_soundtype"];
		
		_ret = [];
		if (!(_zombie getVariable "RZ_isDemon")) then // or demon
		{
			_zombieClass = _zombie getVariable "RZ_vehicleClass";
			
			_ret = switch (toLower _soundtype) do 
			{
				case "attack": 
				{ 
					if(_zombieClass == "Ryanzombiescrawler") then 
					{
						RZ_CrawlerAttackArray
					} else {
						RZ_NormalZombieAttackArray
					};
				};				
				case "hit": 
				{ 
					if(_zombieClass == "Ryanzombiescrawler") then 
					{
						RZ_CrawlerHitArray
					} else {
						RZ_ZombieHitArray
					};
				};
				case "jump":
				{
					RZ_ZombieJumpArray
				};
				case "moan":
				{
					RZ_NormalZombieMoanArray
				};	
				case "eat":
				{
					RZ_ZombieEatingArray
				};
				case "aggressive":
				{
					if(_zombieClass == "Ryanzombiescrawler") exitWith 
					{
						RZ_CrawlerAggressiveArray
					};
					if(_zombieClass == "Ryanzombiesspider") exitWith 
					{
						RZ_SpiderZombieAggressiveArray
					};
					if(!(_zombieClass in ["Ryanzombiesspider","Ryanzombiescrawler"])) exitWith 
					{				
						RZ_NormalZombieAggressiveArray
					};
				};
				default { [] };
			};
		} else {
			_ret = switch (toLower _soundtype) do 
			{  
				case "attack": 
				{ 
					RZ_DemonAttackArray
				};
				case "jump":
				{
					RZ_ZombieJumpArray
				};
				case "hit":
				{
					RZ_DemonDemonHitArray
				};
				case "moan":
				{
					RZ_DemonMoanArray
				};	
				case "eat":
				{
					RZ_ZombieEatingArray
				};
				case "aggressive":
				{
					RZ_DemonAggressiveArray
				};
				default { [] };
			};		
		};
		_ret
	};	

	
	RZ_fnc_NeutralizeVehicle =
	{
		private _veh = _this;
		
		_grp = createGroup civilian;
		_unit = _grp createUnit ["C_Man_1", [0,0,0], [], 0, "CAN_COLLIDE"];
		
		_unit hideObjectGlobal true;
		_unit disableAI "ANIM";
		_unit moveindriver _veh;
		sleep 0.5;
		deletevehicle _unit;
		deletegroup _grp;	
	};

	RZ_fnc_zombie_getMaxVehicleDamage =
	{
		params ["_zombie","_type"];
		
		_ret = 0;
		if(_zombie getVariable "RZ_isDemon") then
		{
			_ret = switch (_type) do 
			{
				case "car": 	{ 0.1 };
				case "tank": 	{ 0.03 };
				case "air": 	{ 0.075 };
				case "static": 	{ 0.15 };
				case "ship": 	{ 0.1 };
				default { 0 };
			};
		} else {
			_ret = switch (_type) do 
			{
				case "car": 	{ Ryanzombiesdamagecar };
				case "tank": 	{ Ryanzombiesdamagetank };
				case "air": 	{ Ryanzombiesdamageair };
				case "static": 	{ (Ryanzombiesdamage/2) };
				case "ship": 	{ Ryanzombiesdamagecar };
				default { 0 };
			};		
		};
		_ret
	};	

	RZ_fnc_zombie_getVehicleVelocityStrength =
	{
		params ["_zombie","_type"];
		
		_ret = 0;
		if(_zombie getVariable "RZ_isDemon") then
		{
			_ret = switch (_type) do 
			{
				case "car": 	{ 3 };
				case "tank": 	{ 2 };
				case "air": 	{ 2 };
				case "static": 	{ 2 };
				case "ship": 	{ 2 };
				default { 0 };
			};
		} else {
			_ret = switch (_type) do 
			{
				case "car": 	{ Ryanzombiesdamagecarstrenth };
				case "tank": 	{ Ryanzombiesdamagetankstrenth };
				case "air": 	{ Ryanzombiesdamageairstrenth };
				case "static": 	{ Ryanzombiesattackstrenth };
				case "ship": 	{ Ryanzombiesattackstrenth };
				default { 0 };
			};
		};		
		_ret
	};	

	RZ_fnc_zombie_maxAttackDistanceToVehicle =
	{
		params ["_zombie","_vehtype"];
		_ret = 0;
		if(_zombie getVariable "RZ_isDemon") then // identical, but separated for future customization perhaps
		{
			_ret = switch (_vehtype) do 
			{
				case "car": { 7 };
				case "tank": { 8 };
				case "air": { 10 };
				case "static": { 4.5 };
				case "ship": { 4.5 };
				default { 0 };
			};
		} else {
			_ret = switch (_vehtype) do 
			{
				case "car": { 7 };
				case "tank": { 8 };
				case "air": { 10 };
				case "static": { 4.5 };
				case "ship": { 4.5 };
				default { 0 };
			};		
		};
		_ret
	};	

	RZ_fnc_zombie_maxAttackDistanceToHuman =
	{
		private _zombie = _this;
		_ret = 0;
		if(_zombie getVariable "RZ_isDemon") then 
		{
			_ret = 4;
		} else {
			_ret = Ryanzombiesattackdistance;
		};
		_ret
	};	

	RZ_fnc_zombie_getHumanVelocityStrength =
	{
		private _zombie = _this;
		_ret = 0;
		if(_zombie getVariable "RZ_isDemon") then 
		{
			_ret = 2 + random 2;
		} else {
			_ret = Ryanzombiesattackstrenth;
		};
		_ret
	};	
	
	RZ_fnc_zombie_canAttackHuman = 
	{
		params ["_zombie","_target"];
		if(!alive _zombie || !alive _target || _target getvariable ["ace_medical_inReviveState",false]) exitWith { false };
		_maxAttackDistance = _zombie call RZ_fnc_zombie_maxAttackDistanceToHuman;
		((_zombie distance _target) < _maxAttackDistance && !(lineIntersects [eyepos _zombie, eyepos _target,_zombie,_target]))
	};
	
	RZ_fnc_zombie_canAttackVehicle = 
	{
		params ["_zombie","_vehicle","_vehType"];
		if(!alive _zombie) exitWith { false };
		_maxAttackDistance = [_zombie,_vehType] call RZ_fnc_zombie_maxAttackDistanceToVehicle;
		(_zombie distance _vehicle) < _maxAttackDistance
	};	

	RZ_fnc_zombie_attackHuman =
	{
		params ["_zombie","_target"]; 
		_dir = _zombie getDir _target;
		_zombie setdir _dir;
		[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

		_attackSound = selectRandom ([_zombie,"attack"] call RZ_fnc_zombie_getZombieSoundArray);
		playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
		
		
		_target allowfleeing 1;
		sleep 0.3;
		_attackSpeed = [Ryanzombiesattackspeed,0.3] select (_zombie getVariable "RZ_isDemon");
		if ([_zombie,_target] call RZ_fnc_zombie_canAttackHuman) then
		{
			_hitSound = selectRandom ([_zombie,"hit"] call RZ_fnc_zombie_getZombieSoundArray);
			playsound3d [_hitSound, _target, false, getPosASL _target, 1, pitch _zombie];	
			
			if (isnil "ryanzombiesdisablebleeding") then 
			{ 
				[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"]; 
			};

			_aceDamageType = ["manNormal","manDemon"] select (_zombie getVariable "RZ_isDemon");
			_normalDamage = [Ryanzombiesdamage,0.3] select (_zombie getVariable "RZ_isDemon");
			if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then 
			{
				[_target,_aceDamageType] execVM "\ryanzombies\acedamage.sqf";
			} else {
				_target setdamage (damage _target + _normalDamage);
			};
			
			if (!(alive _target) && !(isnil "Ryanzombiesinfection")) then 
			{
				[_target, side (group _zombie)] execVM "\ryanzombies\resurrection.sqf";
			};
			if ((alive _target) && !(isnil "ryanzombiesinfectedchance") && (_target getvariable ["ryanzombiesinfected",0] == 0)) then 
			{
				[_target,  side (group _zombie)] execVM "\ryanzombies\infected.sqf";
			};
			

			_scream = selectRandom RZ_HumanScreamArray;
			[_target, _scream] remoteExecCall ["say3d"];

			_vel = velocity _target;
			_dir = direction _zombie;
			_strength = _zombie call RZ_fnc_zombie_getHumanVelocityStrength;
			[_target, [(_vel select 0) + (sin _dir * _strength), (_vel select 1) + (cos _dir * _strength), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
		};
		sleep _attackSpeed;
	};	


	RZ_fnc_zombie_attackVehicle =
	{
		params ["_zombie","_target","_veh","_type"]; 

		_dir = _zombie getDir _veh;
		_zombie setdir (_zombie getDir _veh);
		[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

		_pos = getposATL _veh;
		if (speed _veh < 5) then {_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir]};

		_attackSound = selectRandom ([_zombie,"attack"] call RZ_fnc_zombie_getZombieSoundArray);
		playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];

		_target allowfleeing 1;
		
		_zombie setVariable ["RZ_TargetVehType",_type];
		
		sleep 0.3; // animation play
		
		if ([_zombie,_veh,_type] call RZ_fnc_zombie_canAttackVehicle) then
		{
			_maxDamage = [_zombie,_type] call RZ_fnc_zombie_getMaxVehicleDamage;
			
			if(_type in ["car","tank"]) then 
			{
				_allHitpointNames = (getAllHitPointsDamage _veh) select 0;
				_amounthitpoints = count _allHitpointNames;
				
				_exclude = "HitFuel";
				if(_type == "tank") then { _exclude = "HitHull" };
				
				for "_index" from 0 to (_amounthitpoints - 1) do 
				{
					if (_allHitpointNames select _index != _exclude) then 
					{
						[_veh, [_index, (_veh getHitIndex _index) + random _maxDamage]] remoteExecCall ["fnc_RyanZombies_SetHitIndex"];
					};
				};
			
			} else {
			
				_damage = [_zombie,_type] call RZ_fnc_zombie_getMaxVehicleDamage;
				_veh setDamage (damage _veh + _damage);

				if(_type in ["static","ship"]) then 
				{
					_hitSound = selectRandom ([_zombie,"hit"] call RZ_fnc_zombie_getZombieSoundArray);
					playsound3d [_hitSound, _veh, false, getPosASL _veh, 1, pitch _zombie];									
				};	
			
			};

			if ((getnumber (configfile >> "CfgVehicles" >> typeof _veh >> "armor")) < 90) then 
			{
				if (!canMove _veh) then 
				{
					_aceEnabled = isClass(configFile >> "CfgPatches" >> "ace_medical");
					_aceDamageType = ["vehNormal","vehDemon"] select (_zombie getVariable "RZ_isDemon");
					_normalDamage = [Ryanzombiesdamage/25,0.03] select (_zombie getVariable "RZ_isDemon");	
					
					{
						if (random 10 < 1) then 
						{
							_scream = selectRandom RZ_HumanScreamArray; 
							[_x, _scream] remoteExecCall ["say3d"];
						};						
						if (_aceEnabled) then 
						{
							[_x,_aceDamageType] execVM "\ryanzombies\acedamage.sqf";
						} else {	
							_x setdamage (damage _x + _normalDamage);
						};
					} foreach crew _veh; 
				};
			};

			_vehicleHit = selectRandom RZ_VehicleHitArray;
			playsound3d [_vehicleHit, _veh, false, getPosASL _veh, 1, 1];

			_vel = velocity _veh;
			_dir = direction _zombie;
			_strength = [_zombie,_type] call RZ_fnc_zombie_getVehicleVelocityStrength;
			_maxZ = [1,2] select (_zombie getVariable "RZ_isDemon");	
			[_veh, [(_vel select 0) + (sin _dir * _strength), (_vel select 1) + (cos _dir * _strength), (_vel select 2) + random _maxZ]] remoteExecCall ["fnc_RyanZombies_Velocity"];
		};
		sleep Ryanzombiesattackspeed;
	};
		
		
	RZ_fnc_zombie_AggressiveSound =
	{
		private _zombie = _this;
		_sound = _zombie getVariable "RZ_aggressiveSoundCount";
		if (_zombie getVariable "RZ_vehicleClass" != "Ryanzombiescrawler") then
		{
			if ((_sound == 0) && (isnil "ryanzombiesdisableaggressive")) then 
			{
				_aggressiveSound = selectRandom ([_zombie,"aggressive"] call RZ_fnc_zombie_getZombieSoundArray); 
				playsound3d [_aggressiveSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
			};
			_sound = _sound + 1;
			_zombie setVariable ["RZ_aggressiveSoundCount",_sound];
			if (_sound >= 5) then {_zombie setVariable ["RZ_aggressiveSoundCount",0];};
			
		} else {

			if (speed _zombie != 0) then
			{
				if (_sound == 0) then 
				{
					_aggressiveSound = selectRandom ([_zombie,"aggressive"] call RZ_fnc_zombie_getZombieSoundArray); 
					playsound3d [_aggressiveSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
				};
				_sound = _sound + 1;
				_zombie setVariable ["RZ_aggressiveSoundCount",_sound];
				if (_sound >= 2) then { _zombie setVariable ["RZ_aggressiveSoundCount",0]; };
			};
		};
	};

	RZ_fnc_zombie_feedOnTarget =
	{
		params ["_zombie","_target"];
		
		_eatingSeconds = 0;
		_maxEatingTime = 25 + random 25;
		
		if !(isnil "ryanzombiesinfectiontimer") then 
		{
			_maxEatingTime = ryanzombiesinfectiontimer - 3;
		};
		
		_moveAttemptsSeconds = 0;
		_feasted = false;
		
		while {(_zombie distance _target < 80) && (alive _zombie) && !_feasted} do
		{
			_newtarget = _zombie call RZ_fnc_zombie_checkForNewTarget;					
			if ((!(isnull _newtarget) && (_zombie distance _newtarget < _zombie distance _target))) exitWith {};
			if ((_zombie distance _newtarget < 20) OR (_eatingSeconds > _maxEatingTime)) exitWith {};
			_zombie setVariable ["RZ_Target",_target]; // reset target
			
			if !(isnil "ryanzombiesinfectiontimer") then {_eatingSeconds = _eatingSeconds + 1};

			
			if (_moveAttemptsSeconds in [0,5,10,15,20,25]) then 
			{
				if (!local _zombie) then 
				{
					[_zombie, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
				} else {
					_zombie domove getposATL _target;
				};
			};
			
			sleep 1;

			_moveAttemptsSeconds = _moveAttemptsSeconds + 1;
			if (_moveAttemptsSeconds > 30) exitWith {};
			_damage = damage _zombie;
			
			if ((_zombie distance _target < 3) && (_eatingSeconds < _maxEatingTime)) then // commence feasting, boisss
			{ 		
				_zombie disableAI "ANIM";
				_zombie setdir (_zombie getDir _target);
				[_zombie, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
				
				sleep 1;
				while {alive _zombie} do
				{
					if (random 2 < 1) then 
					{
						_eatingSound = selectRandom ([_zombie,"eat"] call RZ_fnc_zombie_getZombieSoundArray); 
						playsound3d [_eatingSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
					};
					
					_target = _zombie call RZ_fnc_zombie_checkForNewTarget;
					sleep 1;
					_eatingSeconds = _eatingSeconds + 1;
					if ((_eatingSeconds > _maxEatingTime) OR (!(isnull _target) && (_zombie distance _target < 20)) OR (_damage != damage _zombie)) exitwith
					{
						// stop eating
						_feasted = true;
						_zombie enableAI "ANIM";
						[_zombie, "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
					};
				};
				
			};
			
		};
	};	

	RZ_fnc_zombie_setAnimSpeedCoef =
	{
		params ["_zombie","_class"];
		if ((_class == "Ryanzombiesslow") && !(isnil "ryanzombiesmovementspeedslow")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedslow;};
		if ((_class == "Ryanzombiesmedium") && !(isnil "ryanzombiesmovementspeedmedium")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedmedium;};
		if ((_class == "Ryanzombiesfast") && !(isnil "ryanzombiesmovementspeedfast")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedfast;};
		if ((_class == "Ryanzombiesspider") && !(isnil "ryanzombiesmovementspeedspider")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedspider;};
		if ((_class == "Ryanzombiescrawler") && !(isnil "ryanzombiesmovementspeedcrawler")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedcrawler;};
		if ((_class == "Ryanzombieswalker") && !(isnil "ryanzombiesmovementspeedwalker")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeedwalker;};
		if ((_zombie getVariable "RZ_isDemon") && !(isnil "ryanzombiesmovementspeeddemon")) then {_zombie setAnimSpeedCoef ryanzombiesmovementspeeddemon;};
	};

	RZ_fnc_zombie_engageTarget =
	{
		params ["_zombie","_target"];
		_zombie setVariable ["RZ_TargetVehType",""];
		if (!isNull _target) then
		{
			if (((getPosATL _target select 2) > 20) AND (_target iskindof "AIR")) exitwith {sleep 2};
			if (animationState _zombie == "UNCONSCIOUS") exitwith {sleep 2};
			if (_zombie distance _target > Ryanzombieslimit) exitwith {sleep 2};
			
			if (!(vehicle _target iskindof "man") && (count crew (vehicle _target) == 0)) exitWith // if target is an empty vehicle
			{
				(vehicle _target) call RZ_fnc_NeutralizeVehicle;
			};

			if (local _zombie) then 
			{
				_zombie domove getposATL _target;
			} else {
				[_zombie, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
			};
			
			if (surfaceIsWater getposATL _target) then 
			{
				[_zombie, "AmovPercMwlkSnonWnonDf"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
			};
			_zombie dowatch _target;
			
			_feedModuleName = ["Ryanzombiesfeed","Ryanzombiesfeeddemon"] select (_zombie getVariable "RZ_isDemon");
			_jumpModuleName = ["Ryanzombiesjump","Ryanzombiesjumpdemon"] select (_zombie getVariable "RZ_isDemon");
			_throwCarModuleName = ["Ryanzombiescanthrow","Ryanzombiescanthrowdemon"] select (_zombie getVariable "RZ_isDemon");
			_throwTankModuleName = ["Ryanzombiescanthrowtank","Ryanzombiescanthrowtankdemon"] select (_zombie getVariable "RZ_isDemon");

			_exit = false;
			if ((vehicle _target iskindof "man") && [_zombie,_target] call RZ_fnc_zombie_canAttackHuman) then
			{
				[_zombie,_target] call RZ_fnc_zombie_attackHuman;
				
				if((alive _target) OR (isnil _feedModuleName)) then 
				{
					_exit = true;
				};	
			};
			
			if(_exit) exitWith {};
			
			if(isNull _target || !alive _zombie) exitWith {};	
			// although I don't like how messy these conditions look, they allow for rapid target re-acquirement if the old target becomes a null & also quick exit of script upon zombie death

			if ((vehicle _target iskindof "car") && _zombie distance _target < 7) exitWith
			{
				[_zombie,_target,vehicle _target,"car"] call RZ_fnc_zombie_attackVehicle;
			};

			if ((vehicle _target iskindof "tank") && _zombie distance _target < 8) exitWith
			{
				[_zombie,_target,vehicle _target,"tank"] call RZ_fnc_zombie_attackVehicle;
			};

			if ((vehicle _target iskindof "air") && (_zombie distance _target < 10) && ((getPosATL _target select 2) < 1.8)) exitWith
			{
				[_zombie,_target,vehicle _target,"air"] call RZ_fnc_zombie_attackVehicle;
			};

			if ((vehicle _target iskindof "staticweapon") && _zombie distance _target < 4.5) exitWith
			{
				[_zombie,_target,vehicle _target,"static"] call RZ_fnc_zombie_attackVehicle;
			};

			if ((vehicle _target iskindof "ship") && _zombie distance _target < 4.5) exitWith
			{
				[_zombie,_target,vehicle _target,"ship"] call RZ_fnc_zombie_attackVehicle;
			};
				
			_zombie call RZ_fnc_zombie_AggressiveSound;

			_interval = (0.5 + ((_zombie distance _target)/50)) min 4;
			sleep _interval;
			
			if(isNull _target || !alive _zombie) exitWith {};				
			
			
			if (!(isnil _jumpModuleName)) then // a 'then' instead of 'exitWith' means zombies can immediately do another below action after performing the last
			{		
				_minimumJumpingDistance = 45;
				if ((_zombie distance _target > _minimumJumpingDistance)  && (alive _target) && (!surfaceIsWater getposATL _zombie) && (random 15 < 1)) then
				{		
					[_zombie,_target] call RZ_fnc_zombie_jumpToTarget; // this function blocks until zombie has landed again
				};	
			};			

			if(isNull _target || !alive _zombie) exitWith {};	
			
			// meaning zombie can immediately throw a car after landing (combos!)
			if (!isnil _throwCarModuleName) then
			{
				_vehicle = nearestObject [_zombie, "car"]; 
				if ((_vehicle iskindof "car") && (random 7 < 1)) then
				{
					[_zombie,_target,_vehicle,"car"] call RZ_fnc_zombie_throwVehicleAtTarget;
				};
			};		
			
			if(isNull _target || !alive _zombie) exitWith {};	
			
			
			if (!isnil _throwTankModuleName) then
			{
				_vehicle = nearestObject [_zombie, "tank"]; 
				if ((_vehicle iskindof "tank") && (random 7 < 1)) then
				{
					[_zombie,_target,_vehicle,"tank"] call RZ_fnc_zombie_throwVehicleAtTarget;
				};
			};		
			
			if(isNull _target || !alive _zombie) exitWith {};		

			if (!alive _target && !(isnil _feedModuleName)) exitWith
			{
				[_zombie,_target] call RZ_fnc_zombie_feedOnTarget;
			};

		};
	};	

	RZ_fnc_zombie_throwVehicleAtTarget =
	{
		params ["_zombie","_target","_veh","_type"];
		
		_maxThrowingDistance = -1;
		_throwStrength = -1;
		_maxDistanceToCar = -1;
		
		_maxThrowingDistanceStr = "";
		_throwStrengthStr = "";
		
		if(_zombie getVariable "RZ_isDemon") then 
		{
			switch (_type) do
			{
				case "tank":
				{ 
					_maxThrowingDistanceStr = "Ryanzombiescanthrowtankdistancedemon"; 
					_throwStrengthStr = "Ryanzombiescanthrowtankdemonstrength";
					_maxDistanceToCar = 8;
				};
				case "car":
				{ 
					_maxThrowingDistanceStr = "Ryanzombiescanthrowdistancedemon"; 
					_throwStrengthStr = "Ryanzombiescanthrowdemonstrength";
					_maxDistanceToCar = 7;
				};
			};	
		} else {
			switch (_type) do
			{
				case "tank":
				{ 
					_maxThrowingDistanceStr = "Ryanzombiescanthrowtankdistance"; 
					_throwStrengthStr = "Ryanzombiescanthrowtankstrength";
					_maxDistanceToCar = 8;
				};
				case "car":
				{ 
					_maxThrowingDistanceStr = "Ryanzombiescanthrowdistance"; 
					_throwStrengthStr = "Ryanzombiescanthrowstrength";
					_maxDistanceToCar = 7;
				};
			};			
		};
		
		if(!isNil _maxThrowingDistanceStr) then { _maxThrowingDistance = call compile _maxThrowingDistanceStr; };
		if(!isNil _throwStrengthStr) then { _throwStrength = call compile _throwStrengthStr; };
		
		// Makes one variable have 4 different values based on 4 different conditions ezpz
		
		_exit = false;
		while {(_veh distance _target < _maxThrowingDistance) && (_zombie distance _veh < _zombie distance _target) && (_veh distance _target < _zombie distance _target) && !_exit} do
		{
			if (!alive _zombie) exitWith {};
			_target = _zombie call RZ_fnc_zombie_checkForNewTarget;
			if (isnull _target) exitWith {};

			if (_zombie distance _veh < _maxDistanceToCar) then
			{
				[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

				_pos = getposATL _veh;
				_dir = _zombie getDir _veh;
				_zombie setDir _dir;
				_zombie setpos [(_pos select 0) - 4*sin _dir, (_pos select 1) - 4*cos _dir];

				_attackSound = selectRandom ([_zombie,"attack"] call RZ_fnc_zombie_getZombieSoundArray);
				playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
				sleep 0.3;
				if (!alive _zombie) exitWith {};
				
				
				_speed = 20 + random 25;
				_dir = _veh getDir _target;
				_range = _veh distance _target;

				switch (_throwStrength) do 
				{
					case -1:	{ [_veh, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
					case 1: 	{ [_veh, [(_speed * (sin _dir))/1.5, (_speed * (cos _dir))/1.5, 3.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
					case 2: 	{ [_veh, [(_speed * (sin _dir))/2, (_speed * (cos _dir))/2, 2.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
					case 3: 	{ [_veh, [(_speed * (sin _dir))/2.5, (_speed * (cos _dir))/2.5, 1.5 * (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
					case 4: 	{ [_veh, [(_speed * (sin _dir))*5, (_speed * (cos _dir))*5, (_range / _speed)]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
				};

				_throwSound = selectRandom RZ_VehicleThrowArray;
				playsound3d [_throwSound, _veh, false, getPosASL _veh, 1, 1];

				_veh setfuel 0; 
				[_veh, _type] remoteExec ["RZ_fnc_vehicleLand"];
				sleep Ryanzombiesattackspeed;
				
				_exit = true;
			};
			if(_exit) exitWith {};
			
			if !(local _zombie) then 
			{
				[_zombie, getposATL _veh] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
			} 
			else		
			{
				_zombie domove getposATL _veh;
			};
			_x = (0.5 + ((_zombie distance _veh)/50)) min 4;
			sleep _x;
		};	
	};	

	
	RZ_fnc_vehicleLand = 
	{
		params ["_veh","_type"];
		
		sleep 0.25;
		if(_type == "car") then 
		{		
			if ((random 15 < 1) && (alive _veh) && RZ_VehicleAlarmsEnabled) then // added lil variable for force disabling
			{
				_veh spawn 
				{
					_veh = _this;
					for "_i" from 1 to 8 do 
					{
						_veh say3d "AlarmCar";
						sleep 1.95;
					};			
				};				
			};
		};
		if(local _veh) then 
		{
			waituntil {(getpos _veh select 2) < 1};
			_throwSound = selectRandom RZ_VehicleThrowArray;
			playsound3d [_throwSound, _veh];	
		};	
	};

	RZ_fnc_zombie_checkForNewTarget =
	{
		private _zombie = _this;
		private _civilians = [];
		if !(isnil "ryanzombiescivilianattacks") then 
		{
			_civilians = nearestobjects [_zombie, ["Civilian"], 100 min Ryanzombieslimit]; 
			_civsToDelete = [];
			{
				if (!alive _x || _x getvariable ["ace_medical_inReviveState",false]) then 
				{
					_civsToDelete pushback _x;
				};
			} foreach _civilians;
			_civilians = _civilians - _civsToDelete;
		};
		
		private _target = _zombie findNearestEnemy _zombie;
		if (count _civilians != 0) then
		{
			_civiliantarget = _civilians select 0;
			if (!isNull _target && ((_target distance _zombie) < (_civiliantarget distance _zombie))) exitwith {};
			if (_zombie knowsabout _civiliantarget > 0.5) then 
			{
				_target = _civiliantarget; 
			};
		};
		if(!isNull _target) then 
		{
			if(_zombie distance _target > Ryanzombieslimit) exitWith { _target = objNull; };	
		};
		_zombie setVariable ["RZ_Target",_target];
		_target
	};	

	RZ_fnc_zombie_findTargetLoop = 
	{
		private _zombie = _this;
		if (unitpos _zombie in ["MIDDLE","AUTO"]) then {_zombie setunitpos "UP";};
		
		private _oldTarget = _zombie getVariable "RZ_Target";
		if((vehicle _oldTarget iskindof "man") && [_zombie,_oldTarget] call RZ_fnc_zombie_canAttackHuman) exitWith // don't bother doing expensive checks for new target, keep slashing god damnit!
		{
			[_zombie,_oldTarget] call RZ_fnc_zombie_engageTarget;
		};
		if((count crew (vehicle _oldTarget) > 0) && [_zombie,vehicle _oldTarget,_zombie getVariable "RZ_TargetVehType"] call RZ_fnc_zombie_canAttackVehicle) exitWith // don't bother doing expensive checks for new target, keep wrecking that vehicle arr!
		{
			[_zombie,_oldTarget] call RZ_fnc_zombie_engageTarget;
		};	
		
		private _target = objNull;
		_maxAttempts = _zombie getVariable "RZ_maxAttempts";
		_attempts = 0;
		while {isNull _target && _attempts < _maxAttempts} do 
		{
			if (unitpos _zombie in ["MIDDLE","AUTO"]) then {_zombie setunitpos "UP";};
			if(!alive _zombie) exitWith {};

			_target = _zombie call RZ_fnc_zombie_checkForNewTarget;
			
			if(isNull _target) then 
			{
				_attempts = _attempts + 1;
				sleep 1;
			};
		};
		if(!isNull _target) then 
		{
			[_zombie,_target] call RZ_fnc_zombie_engageTarget;
		};	
	};	
		
	RZ_fnc_zombie_jumpToTarget =
	{
		params ["_zombie","_target"];
			
		_jumpStrength = -1;
		if(_zombie getVariable "RZ_isDemon") then 
		{
			if(!isNil "Ryanzombiesjumpdemonstrength") then 
			{
				_jumpStrength = Ryanzombiesjumpdemonstrength;
			};	
		} else {
			if(!isNil "Ryanzombiesjumpstrength") then 
			{
				_jumpStrength = Ryanzombiesjumpstrength;
			};		
		};		
		
		_heightzombie = getTerrainHeightASL (getposATL _zombie);
		_heighttarget = getTerrainHeightASL (getposATL _target);
		_highzombie = _heightzombie + 20;
		_hightarget = _heighttarget + 40;

		if (_highzombie < _heighttarget) exitWith {};
		if (_hightarget < _heightzombie) exitWith {};

		_zombie disableAI "MOVE";

		_basespeed = 8 + random 2;
		_extraspeed = (_zombie distance _target)/8 min 60;

		if (isnil "ryanzombiesdisablejumping") then
		{
			_jumpSound = selectRandom ([_zombie,"jump"] call RZ_fnc_zombie_getZombieSoundArray);
			playsound3d [_jumpSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie];
		};
		sleep 0.15;
		_dir = _zombie getDir _target;
		_zombie setDir _dir;
		
		_zombie setVariable ["RZ_isJumping",true];
		
		switch (_jumpStrength) do 
		{
			case -1:	{ [_zombie, [(_basespeed + _extraspeed) * (sin _dir), (_basespeed + _extraspeed) * (cos _dir), 12 + random 6]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
			case 1: 	{ [_zombie, [((_basespeed + _extraspeed) * (sin _dir))/1.5, ((_basespeed + _extraspeed) * (cos _dir))/1.5, 10 + random 4]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
			case 2: 	{ [_zombie, [((_basespeed + _extraspeed) * (sin _dir))/2, ((_basespeed + _extraspeed) * (cos _dir))/2, 7 + random 3]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
			case 3: 	{ [_zombie, [((_basespeed + _extraspeed) * (sin _dir))/2.5, ((_basespeed + _extraspeed) * (cos _dir))/2.5, 5 + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"]; };
		};

		sleep 1;
		waituntil {(getpos _zombie select 2) < 1 OR (speed _zombie < 1)};
		_zombie enableAI "MOVE";
		sleep 0.5;
		_zombie setVariable ["RZ_isJumping",false];
	};	
			

	
	RZ_fnc_GetDebugOutput =
	{
		_addonArray = activatedAddons select { !((["a3_", _x] call BIS_fnc_inString) || (["hsim", _x] call BIS_fnc_inString) || (["ca_", _x] call BIS_fnc_inString)) };
		_lineBreak = toString [0x0D, 0x0A];
		_countZombies = count (allUnits select { _x getVariable ["RZ_isZombie",false] });
		_clipBoard = format ["Z&D V%2%1Diag FPS: %3%1Tick time: %4%1Product Version: %5%1%1Mission name: %6%1IsMultiplayer: %7%1Server name: %8%1Amount of zombies: %9%1Map: %10%1Activated addons: %11",_lineBreak,ZnD_modVersion, diag_fps,diag_tickTime,productVersion,briefingName,isMultiplayer,serverName,_countZombies,worldName, _addonArray];
		copyToClipboard _clipBoard;
		hint "Copied debug output to clipboard!";
	};	
	
	RZ_ServerSided_AttackScriptsInfantry =
	{
		private _target = _this select 0;
		private _group = _this select 1;
		
		if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {[_target,'manNormal'] execVM "\ryanzombies\acedamage.sqf"} else {_target setdamage (damage _target + Ryanzombiesdamageplayer)};
		if (!(alive _target) && !(isnil "Ryanzombiesinfection")) then {[_target, side _group] execVM "\ryanzombies\resurrection.sqf"};
		if ((alive _target) && !(isnil "ryanzombiesinfectedchance") && (_target getvariable ["ryanzombiesinfected",0] == 0)) then {[_target, side _group] execVM "\ryanzombies\infected.sqf"};
	};		
	
	RZ_ServerSided_AttackScriptsVehicle =
	{
		private _crew = _this select 0;
		private _group = _this select 1;
		
		{
			_target = _x;
			if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then {[_target,'vehNormal'] execVM "\ryanzombies\acedamage.sqf"} else {_target setdamage (damage _target + Ryanzombiesdamageplayer)};
			if (!(alive _target) && !(isnil "Ryanzombiesinfection")) then {[_target, side _group] execVM "\ryanzombies\resurrection.sqf"};
			if ((alive _target) && !(isnil "ryanzombiesinfectedchance") && (_target getvariable ["ryanzombiesinfected",0] == 0)) then {[_target, side _group] execVM "\ryanzombies\infected.sqf"};
		} foreach _crew;
		
	};	
	
	RZ_fnc_headExplodeCheck = 
	{
		params ["_victim","_sel","_damage","_shooter","_projectile"];

		if(_sel == "head" && _damage >= 1) then 
		{
			if(face _victim != "RyanZombieNoFace") then 
			{
				_caliber = getNumber (configFile >> "CfgAmmo" >> _projectile >> "caliber");
				if(_caliber >= Ryanzombiesdamagecaliberneeded) then 
				{
					_victim setFace "RyanZombieNoFace";
					_victim remoteExecCall ["RZ_fnc_HeadParticles"];
					[_victim, "RyanZombieNoFace"] remoteExecCall ["setFace"];
					
					removeHeadgear _victim;
					removeGoggles _victim;
					
					_hmd = (hmd _victim);
					_victim unassignItem _hmd;
					_victim removeItem _hmd;
					
					
					_headExplodeSound = selectRandom RZ_HeadExplodeArray;
					playsound3d [_headExplodeSound, _victim,false, getPosASL _victim, 10, 1, 30];
				};
			};
		};	
	};	
		
	RZ_fnc_HeadParticles =
	{
		_object = _this;

		_pArray = [];

		for "_i" from 0 to 2 do
		{

			_meat = "#particlesource" createVehicleLocal (getposATL _object); 
			_meat setParticleClass "HeadMeat1"; 
			_meat setParticleParams
			[
				["\A3\data_f\ParticleEffects\Universal\Meat_ca", 1, 0, 1], //shape name
				"", //animation name
				"SpaceObject", //type
				1, 5, //timer period & life time
			   [0, 0, 0], //position
			   [0.2,0.2,2], //moveVelocity
			   2, 22, 1, 0.2, //rotation velocity, weight, volume, rubbing
			   [4], //size
			   [[0.9,0.01,0.01,1]], //color
			   [0.1], //animationPhase (animation speed in config)
			   0.00, //randomdirection period
			   0.0, //random direction intensity
				"", //onTimer
				"", //before destroy
				"", //object
				0, //angle
				false, //on surface
				0.0 //bounce on surface
			];

			_meat setParticleRandom [0, [0.1, 0.1, 0.0], [1.35, 1.35, 1.0], 0, 0.1, [0, 0, 0, 0], 0, 0];
			_meat setDropInterval 60;
			_meat attachTo [_object,[0,0,0.2],"head"]; 

			_pArray pushBack _meat;

		};

		_blood = "#particlesource" createVehicleLocal (getposATL _object); 
		_blood setParticleClass "HeadBlood1"; 

		_blood setParticleParams
		[
			["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 4, 1], //shape name
			"", //animation name
			"Billboard", //type
			1, 0.3, //timer period & life time
		   [0, 0, 0], //position
		   [0.00,0.0,2], //moveVelocity
		   1, 0.127, 0.1, 0.4, //rotation velocity, weight, volume, rubbing
		   [0.5,1], //size
		   [[1,0,0,0.9],[1,0,0,0.45]],
		   [0.1], //animationPhase (animation speed in config)
		   0.0, //randomdirection period
		   0.0, //random direction intensity
			"", //onTimer
			"", //before destroy
			"", //object
			0, //angle
			false, //on surface
			0.0 //bounce on surface
		];

		_blood setDropInterval 60;
		_blood attachTo [_object,[0,0,0.],"head"]; 

		_pArray pushback _blood;

		_pArray spawn 
		{
			_pArray = _this;
			sleep 5;
			{ deleteVehicle _x } foreach _pArray;
		};
	};
		

    RZ_fnc_inventory_DblClick = 
	{
		// Unscheduled environment, executed by LBDblClick eventhandler
		
    	_idc = ctrlIDC (_this select 0);

    	_selectedIndex = _this select 1;
		_itemName = lbText [_idc, _selectedIndex];

		switch (_itemName) do 
		{
			case "Antivirus Injector": 
			{
			
				playsound3d ["ryanzombies\sounds\antivirus_inject.ogg", player]; 
				player spawn 
				{
					player removeItem "RyanZombiesAntiVirusCure_Item";
					sleep 0.75; 
					player setVariable ["ryanzombiesinfected",0,true];
				};
			};	
			case "Antivirus Pills": 
			{
				playsound3d ["ryanzombies\sounds\antivirus_pills.ogg", player];
				player spawn
				{
					player removeItem "RyanZombiesAntiVirusTemporary_Item";
					sleep 0.75;
					waituntil {!(player getvariable ["ryanzombiesimmunity",false])};
					player setVariable ["ryanzombiesimmunity",true,true];
					sleep ryanzombiesantivirusduration;
					player setVariable ["ryanzombiesimmunity",false,true];
				};
			
			};
		};	
		
    	false

    };	
	
};