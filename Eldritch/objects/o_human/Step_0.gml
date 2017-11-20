/// @description Movement

#region	Roaming
	if state == humanStates.roam
	{
		// Switch directions when hitting a wall or at a ledge
		speed_[h] = dir * moveSpeed;
		speed_[v] += gravity_;
		image_xscale = dir;
		EnemyMove(speed_);
		
		// STATE CHANGES
		if (health_ <=0)
		{
			state = humanStates.death;
		}
		
		// The human is hit by a feed attack, set its state to dead
		//if (place_meeting(x, y, o_imp_normal_attack))
		//{
		//	
		//}

	}
#endregion

#region	Dying
	if state == humanStates.death
	{
		audio_play_sound(snd_human_death, 10, false);
		var blood = instance_create_layer(x,y,"Instances",o_human_death);
		blood.dir = dir;
		instance_destroy();
	}
#endregion


