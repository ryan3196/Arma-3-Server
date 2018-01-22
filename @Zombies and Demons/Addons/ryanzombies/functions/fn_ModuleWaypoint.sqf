_logic = _this select 0;

if ((!isServer) and hasInterface) exitwith {};
_Waypoint = _logic getVariable ["Waypoint",1];

if ((_Waypoint == 1) OR (_Waypoint == 2)) then
{
	Ryanzombieswaypoint = 1;
	ryanzombieslogicwaypoint = createTrigger ["EmptyDetector", getposATL _logic];
	ryanzombieslogicwaypoint setTriggerStatements ["this", "", ""];
	
};

if ((_Waypoint == 1) OR (_Waypoint == 3)) then
{
	Ryanzombieswaypointdemon = 1;
	ryanzombieslogicwaypointdemon = createTrigger ["EmptyDetector", getposATL _logic];
	ryanzombieslogicwaypointdemon setTriggerStatements ["this", "", ""];
};