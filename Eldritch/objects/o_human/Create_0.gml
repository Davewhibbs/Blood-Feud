/// @description Initialize variables

var directional = random_range(1,100);

if directional >= 50
{
	dir = -1;
}
else
{
	dir = 1;
}

health_ = 1;
killer = noone;
speed_ = [0,0];
moveSpeed = 2;
fearOfHeights = false;
state = humanStates.roam;

enum humanStates
{
	roam,
	death
}