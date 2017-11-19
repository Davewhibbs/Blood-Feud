///@param max_speed
		
		// hinput = 1-0 or 0-1 or 0
		var hinput = xaxis;
		if hinput == 1 // Moving Right
		{
			speed_[h] = Approach(speed_[h], argument0, acceleration_);
		}
		else if hinput == -1 // Moving Left
		{
			speed_[h] = Approach(speed_[h], -argument0, acceleration_);
		}
		else // Stopping
		{
			speed_[h] = 0;
		}
		
		// Apply change to dir
		if(speed_[h] != 0)
		{
			dir = sign(speed_[h]);	// dir is positive or negative 1
		}
		
		// Switch sprite direction based on the dir
		image_xscale = dir;
		
		return hinput;