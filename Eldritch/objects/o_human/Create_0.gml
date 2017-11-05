/// @description Initialize variables

dir = -1;
health_ = 1;
speed_ = [0,0];
moveSpeed = 2;
fearOfHeights = true;
state = humanStates.roam;

enum humanStates
{
	roam,
	death
}