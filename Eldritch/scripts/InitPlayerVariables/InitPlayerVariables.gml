///@param evolution_rank

#region Initialize Variables

// Change for different evolutions

#region Imp Variables
if argument0 == 1
{
	max_speed_ = 10;
	max_speed_attack = 5;
	max_health_ = 5;
	jump_height_ = -20;
	damage = 1;
	max_evolution = 10;	// Evolution points to evolve
	
	normal_attack_cd = 20;				// Normal attack every second
	normal_animation_cd = room_speed/15 * 7;			// X frames in attack animation
	attack_wait = 2;
	
	death_object = o_imp_death;
	death_sound = snd_death;
	
	#region Sprites Used (determined by player ID)
	if playerID == 1
	{
		sprite = s_imp1;
		attack_sprite = s_imp_attack1;
		jump_sprite = s_imp_jump1;
		hurt_sprite = s_imp_hurt;
	}
	else if playerID == 2
	{
		sprite = s_imp2;
		attack_sprite = s_imp_attack2;
		jump_sprite = s_imp_jump2;
		hurt_sprite = s_imp_hurt;
		
	}
	#endregion
	
	x_attack_offset = 10;
	y_attack_offset = 13;

}
#endregion

#region Vamp variables
else if argument0 >= 2
{
	max_speed_ = 12;
	max_speed_attack = 8;
	max_health_ = 7;
	jump_height_ = -30;
	damage = 3;
	max_evolution = 20;	// Evolution points to evolve
	
	normal_attack_cd = (room_speed/20 * 14) + 7;				// Normal attack every second
	normal_animation_cd = room_speed/20 * 14;			// X frames in attack animation
	attack_wait = 7;
	
	death_object = o_vampire_death;
	death_sound = snd_death;
	
	#region Sprites Used (determined by player ID)
	if playerID == 1
	{
		sprite = s_vampire1;
		attack_sprite = s_vampire_attack1;
		jump_sprite = s_vampire_jump1;
		hurt_sprite = s_vampire_hurt;
	}
	else if playerID == 2
	{
		sprite = s_vampire2;
		attack_sprite = s_vampire_attack2;
		jump_sprite = s_vampire_jump2;
		hurt_sprite = s_imp_hurt;
	}
	#endregion
	
	x_attack_offset = 30;
	y_attack_offset = 13;
}
#endregion

#region  Vamplord variables
//else if argument0 == 3
//{
//	max_speed_ = 20;
//	max_health_ = 70;
//	jump_height_ = -40;
//	damage = 3;
//	max_evolution = 30;	// Evolution points to evolve
//	
//	normal_attack_cd = 20;				// Normal attack every second
//	normal_animation_cd = 8;			// X frames in attack animation
//	attack_wait = 2;
//	
//	#region Sprites Used (determined by player ID)
//	if playerID == 1
//	{
//		sprite = s_imp1;
//		attack_sprite = s_imp_attack1;
//		jump_sprite = s_imp_jump1;
//		hurt_sprite = s_imp_hurt;
//	}
//	else if playerID == 2
//	{
//		sprite = s_imp2;
//		attack_sprite = s_imp_attack2;
//		jump_sprite = s_imp_jump2;
//		hurt_sprite = s_imp_hurt;
//	}
//	#endregion
//	
//	x_attack_offset = 10;
//	y_attack_offset = 13;
//}
#endregion

evolution = 0;		// Current Evolve amount

dir = 1;
speed_ = [0, 0];
acceleration_ = 3;
friction_ = .3;
max_jumps_ = 1;
jumps_ = max_jumps_;
health_ = max_health_;
attacking = false;


// Cooldowns
alarm[0] = normal_attack_cd;		// Alarm[0] attack cooldown
alarm[1] = normal_animation_cd;		// Alarm[1] attack animation cooldown
alarm[2] = attack_wait;				// Alarm[2] wait for attack object to be created

special_attack_cd = room_speed / 6;
alarm[3] = special_attack_cd;

feed_attack_cd = room_speed / 6;
alarm[4] = feed_attack_cd;

invuln = false;
invuln_length = 2;					// When Hurt, player is invulnerable for a few seconds
alarm[5] = invuln_length;

evolving = false;
evolveTime = 19;
alarm[6] = 0;

// Death alarms
alarm[7] = 0;
alarm[8] = 0;
death_timer = 61;
death_anim_timer = 60; 

state = states.free;
#endregion
#region Input Config
right_key = 0;
left_key = 0;
up_key = 0;
down_key = 0;
normal_key = 0;
special_key = 0;
feed_key = 0;
#endregion