/// @description Player Control



// Get input from the player
GetPlayerInput(playerID);

if state == states.free
{
	#region Movement
		// Initialize on first step to change certain variables
		if initialize == false
		{
			initialize = true;
			InitPlayerVariables(evolution_rank);
		}
			
		// Remove invulnerability
		if alarm[5] <= 0 {invuln = false};
	
		var hinput = GetInput(max_speed_);
		
		// Check if we are NOT on the floor
		if !place_meeting(x, y+1, o_solid)
		{
			speed_[v] += gravity_;
			
			// Use Jump sprite while off the ground
			// index 0 while moving up
			if(speed_[v] < 0)
			{
				sprite_index = jump_sprite;
				image_index = 0;
			}
			// index 1 while moving down
			else if(speed_[v] > 0)
			{
				sprite_index = jump_sprite;
				image_index = 1;
			}
		}
		// If on the floor, reset jumps, use ground sprites
		else 
		{
			jumps_ = max_jumps_;
			
			// If moving, use Run Sprite
			if(hinput != 0 )
			{
				sprite_index = sprite;
			}
			// If not moving, use Run Sprite at image_index 0
			else
			{
				sprite_index = sprite;
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
		if health_ <= 0
		{
			state = states.die;	
		}
		
		if normal_key
		{
			// Check Attack Timer
			if alarm[0] <= 0{
				image_index = 0;
				state = states.normal_attack;
			}
		}
		
		if evolution >= max_evolution{
			if feed_key
			{
				evolving = true;
				state = states.evolve;
			}
		}
		
		
		
		
	#endregion
}

else if state == states.hurt
{
	#region Hurt
		if alarm[5] < 0 
		{
			// Invincibitity Frames
			invuln = true
			alarm[5] = invuln_length;
			
			
			sprite_index = hurt_sprite;
			
			// Knockback
			Move(speed_);
		}
		
		// STATE CHANGES
		else if alarm[5] == 0
		{
			state = states.free;
		}
	#endregion
}
else if state == states.die
{
	#region	Death
	
		PlayerDeath();
	
	#endregion
}
else if state == states.evolve
{
	#region Evolve
		if evolving == true
		{
			// Play evolution sound
			audio_play_sound(snd_evolve, 10, false);
			
			// Create Evolution Object
			var evolver = instance_create_depth(x, y, -1, o_evolution);
			evolving = false;
			sprite_index = s_nothing;
			alarm[6] = evolveTime;
		}
		
		if alarm[6] <= 0
		{
			initialize = false;
			evolution_rank++;
			state = states.free;
		}
	
	#endregion
}
else if state == states.normal_attack
{
	#region Normal Attack
		var hinput = GetInput(max_speed_);
		
		#region Falling
		// Check if we are NOT on the floor
		if !place_meeting(x, y+1, o_solid)
		{
			speed_[v] += gravity_;
		}
		// If on the floor, reset jumps, use ground sprites
		else 
		{
			jumps_ = max_jumps_;
		}
		#endregion
		
		if alarm[0] <= 0{
			
			// Play Normal Attack animation
			sprite_index = attack_sprite;
			alarm[1] = normal_animation_cd;
			
			// Reset Attack Timer
			alarm[0] = normal_attack_cd;
			
			// Reset object creation timer
			alarm[2] = attack_wait;
			
			
		}
		
		if alarm[2] <= 0 && attacking == false{
			// Play attack whoosh sound once
			audio_play_sound(snd_whoosh, 10, false);
			
			// Create Normal Attack object based on evolution rank
			if evolution_rank == 1{
				var attack = instance_create_layer(x+x_attack_offset*dir, y - y_attack_offset, "Instances", o_damage);
			}
			else
			{
				var attack = instance_create_layer(x+x_attack_offset*dir, y - y_attack_offset, "Instances", o_damage2);
			}
			attack.damage = damage;
			attack.creator = id;
			alarm[2] = 100;
			attacking = true;
		}
		
		if attacking == false
		{
			Move(speed_);
		}
		
		// STATE CHANGES
		// After the animation is done, change back to free
		if (alarm[1] <= 0)
		{
			speed_ = [0,0];
			attacking = false;
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


// Don't go over stat caps
if (evolution > max_evolution)
{
	evolution = max_evolution;
}
if (health_ < 0)
{
	health_ = 0;
}