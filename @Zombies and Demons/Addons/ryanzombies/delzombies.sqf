params ["_zombie","_isDemon"];

if ((!isServer) and hasInterface) exitwith {};

_deletionRadius = ryanzombiesdeletionradius;
_deletionSetting1 = ryanzombiesdeletion;
_deletionSetting2 = ryanzombiesdeletion2;

if(_isDemon) then 
{
	_deletionRadius = ryanzombiesdeletionradiusdemons;
	_deletionSetting1 = ryanzombiesdeletiondemons;
	_deletionSetting2 = ryanzombiesdeletiondemons2;	
};	

while {alive _zombie} do
{
	sleep RZ_DeletionCheckTime;
	_trg = createTrigger ["EmptyDetector", getposATL _zombie];
	_trg setTriggerArea [_deletionRadius, _deletionRadius, 0, false];
	_trg setTriggerStatements ["this", "", ""];
	
	if (_deletionSetting1 == 0.7) then {_trg setTriggerActivation ["WEST", "NOT PRESENT", false];};
	if (_deletionSetting1 == 0.5) then {_trg setTriggerActivation ["EAST", "NOT PRESENT", false];};
	if (_deletionSetting1 == 0.3) then {_trg setTriggerActivation ["GUER", "NOT PRESENT", false];};
	if (_deletionSetting1 == 0.1) then {_trg setTriggerActivation ["CIV", "NOT PRESENT", false];};

	sleep 1;
	if (triggeractivated _trg) then
	{
		deletevehicle _trg;
		_trg = createTrigger ["EmptyDetector", getposATL _zombie];
		_trg setTriggerArea [_deletionRadius, _deletionRadius, 0, false];
		_trg setTriggerStatements ["this", "", ""];
		
		if (_deletionSetting2 == 0.7) then {_trg setTriggerActivation ["WEST", "NOT PRESENT", false];};
		if (_deletionSetting2 == 0.5) then {_trg setTriggerActivation ["EAST", "NOT PRESENT", false];};
		if (_deletionSetting2 == 0.3) then {_trg setTriggerActivation ["GUER", "NOT PRESENT", false];};
		if (_deletionSetting2 == 0.1) then {_trg setTriggerActivation ["CIV", "NOT PRESENT", false];};

		sleep 1;
		if ((triggeractivated _trg) OR (_deletionSetting2 == 0.9)) exitwith
		{
			deletevehicle _zombie;
		};
	};
	deletevehicle _trg;
};