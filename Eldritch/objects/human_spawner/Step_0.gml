/// @description Spawn
if alarm[0] <= 0
{
	var roll = random_range(1,100);
	if(roll >= spawnChance)
	{
		instance_create_layer(x, y, "Instances", o_human);
	}
	
	// reset cooldown
	alarm[0] = spawn_cooldown;
}
