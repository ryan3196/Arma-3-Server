_target = _this select 0;
_typeDamage = _this select 1;


_damage = switch _typeDamage do 
{	
	case 'manNormal': 	{ 	Ryanzombiesdamage 		};
	case 'vehNormal': 	{	(Ryanzombiesdamage/15) 	};
	case 'manDemon': 	{ 	0.3 					};
	case 'vehDemon': 	{	0.03; 					};
	default { 0 };
};	

_damage = _damage * RZ_ACEDamageMultiplier;

_selection = selectRandom ace_medical_selections;

if(isPlayer _target) then 
{
	[-2,
	{
		params ["_target","_damage","_selection"];
		if(player == _target) then 
		{
			[_target, _damage, _selection, "bullet"] call ace_medical_fnc_addDamageToUnit;
		};
	},[_target,_damage,_selection]] call CBA_fnc_globalExecute; // CBA is required by ACE3 anyway, so let's not complicate things.
	 
} else { // note that this damage won't be applied to AI group members of a player-led team on a server (because AIs are local to group leader) - low priority...
	[_target, _damage, _selection, "bullet"] call ace_medical_fnc_addDamageToUnit;
};