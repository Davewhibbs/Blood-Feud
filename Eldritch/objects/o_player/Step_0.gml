/// @description Player Control

// Get input from the player
GetPlayer1Input();

if state == states.free
{
	#region Movement
		// hinput = 1-0 or 0-1 or 0
		var hinput = xaxis;
		if hinput == 1 // Moving Right
		{
			speed_[h] = Approach(speed_[h], max_speed_, acceleration_);
		}
		else if hinput == -1 // Moving Left
		{
			speed_[h] = Approach(speed_[h], -max_speed_, acceleration_);
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
		
		// Check if we are NOT on the floor
		if !place_meeting(x, y+1, o_solid)
		{
			speed_[v] += gravity_;
			
			// Use Jump sprite while off the ground
			// index 0 while moving up
			if(speed_[v] < 0)
			{
				sprite_index = s_imp_jump;
				image_index = 1;
			}
			// index 1 while moving down
			else if(speed_[v] > 0)
			{
				sprite_index = s_imp_jump;
				image_index = 2;
			}
		}
		// If on the floor, reset jumps, use ground sprites
		else 
		{
			jumps_ = max_jumps_;
			
			// If moving, use Run Sprite
			if(hinput != 0 )
			{
				sprite_index = s_imp;
			}
			// If not moving, use Run Sprite at image_index 0
			else
			{
				sprite_index = s_imp;
				image_index = 0;
			}
			
			//// if pressing down, set to Duck state
			//if(keyboard_check(vk_down))
			//{
			//	state = states.duck;
			//}
		}
		
		// Jump!
		if jump_key
		{
			Jump();
		}
		
		// Move the player based on the current x and y speed for this frame
		Move(speed_);
		
		
		// SWITCH TO OTHER STATES
		if normal_key
		{
			state = states.normal_attack;
		}
		
		
	#endregion
}

else if state == states.hurt
{
	#region Hurt
	
		// Invincibitity Frames
		
		// Knockback
		
		// Flash white
	
	#endregion
}
else if state == states.die
{
	#region	Death
	
		// Play death animation
		
		// Reduce the player's evolution by 1
		
		// Respawn at spawner
	
	#endregion
}
else if state == states.evolve
{
	#region Evolve
	
		// Play Evolution animation
		
		// Increase player's animation
		
		// Invincibility frames?
	
	#endregion
}
else if state == states.normal_attack
{
	#region Normal Attack
		// Check Attack Timer
		if alarm[0] <= 0{
			// Play Normal Attack animation
			sprite_index = s_imp_attack;
			alarm[1] = normal_animation_cd;
			
			// Reset Attack Timer
			alarm[0] = normal_attack_cd;
			
			// Reset object creation timer
			alarm[2] = attack_wait;
		}
		
		if alarm[2] <= 0{
			// Create Normal Attack object
			var attack = instance_create_layer(x+x_attack_offset*dir, y - y_attack_offset, "Instances", o_damage1);
			attack.damage = damage;
			attack.creator = id;
		}
		
		// STATE CHANGES
		// After the animation is done, change back to free
		if (alarm[1] <= 0)
		{
			state = states.free;
		}
	#endregion
}
else if state == states.special_attack
{
	#region Special Attack
	
		// Create Special Attack object
		
		// Play Special Attack animation
		
	#endregion
}
else if state == states.feed_attack
{
	#region Feed Attack
		
		// Create Feed Attack object
		
		// Play Feed Attack animation
		
		// Gain Evolution Points
		
		// Gain Health
	
	#endregion
}

if (evolution > max_evolution)
{
	evolution = max_evolution;
}
if (health_ < 0)
{
	health_ = 0;
}