
"; if(_BlockHoldActions)then{ _asd = _asd + "
if(!isNil'bis_fnc_holdAction_running')then{
	_log = 'HackAction on player: holdAction detected!';
	[_name,_puid,'HLOG_SKICK',toArray(_log)] call _AHKickLog;
	[] call _AHKickOFF;
};
"; }; _asd = _asd + "
