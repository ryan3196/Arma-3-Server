if((time - (player getVariable ["RZ_TimeLastTaunt",0])) > 1) then 
{	
	_aggroSound = selectRandom RZ_NormalZombieAggressiveArray; 
	playsound3d [_aggroSound, player];
	player setVariable ["RZ_TimeLastTaunt",time];	
};	