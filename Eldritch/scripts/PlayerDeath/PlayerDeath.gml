// Depending on the player, subtract a certain life

// Only do once (during death timer)
if alarm[7] <= 0
{
	// Reset death timer
	alarm[7] = death_timer;
	
	// Set death animation alarm
	alarm[8] = death_anim_timer;
	
	// Switch to death sprite
	image_index = 0;
	//sprite_index = death_sprite;
	
	if playerID == 1
	{
		// Decrease the player's lives by 1
		global.player1_lives--;
		
		// Destroy a heart
		if global.player1_lives == 2
		{
			instance_destroy(o_heart1_3);
		}
		else if global.player1_lives == 1
		{
			instance_destroy(o_heart1_2);
		}
		else if global.player1_lives == 0
		{
			instance_destroy(o_heart1_1);
		}	
	}
	else
	{
		// Decrease the player's lives by 1
		global.player2_lives--;
		
		// Destroy a heart
		if global.player2_lives == 2
		{
			instance_destroy(o_heart2_3);
		}
		else if global.player2_lives == 1
		{
			instance_destroy(o_heart2_2);
		}
		else if global.player2_lives == 0
		{
			instance_destroy(o_heart2_1);
		}	
	}
}

else if alarm[8] <= 0
{
	// Spawn victory banner
	if global.player1_victory == true
	{
		instance_create_depth(o_game.x, o_game.y, -5, o_victory1);
		o_menu_button.visible = true;
		instance_destroy();
	}
	else if global.player2_victory == true
	{
		instance_create_depth(o_game.x, o_game.y, -5, o_victory2);
		o_menu_button.visible = true;
		instance_destroy();
	}
	
	// Otherwise respawn
	else
	{	
		// Respawn at spawner
		if playerID == 1
		{
			x = o_player1_spawner.x;
			y = o_player1_spawner.y;
		}
		else
		{
			x = o_player2_spawner.x;
			y = o_player2_spawner.y;
		}
		
		InitPlayerVariables(1);
		state = states.free;
	}
}