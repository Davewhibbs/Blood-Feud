/// @description Player variables

#region Initialize Variables
initialize = false;

playerID = 1;
evolution_rank = 1;

dir = 1;
speed_ = [0, 0];
max_speed_ = 10;
acceleration_ = 3;
friction_ = .3;
jump_height_ = -20;
max_jumps_ = 1
jumps_ = max_jumps_;


max_health_ = 50;
health_ = max_health_;
damage = 1;
evolution = 0;		// Current Evolve amount
max_evolution = 10;	// Evolution points to evolve

// Sprites Used
sprite = noone;
attack_sprite = noone;
jump_sprite = noone;


x_attack_offset = 10;
y_attack_offset = 13;

// Cooldowns
normal_attack_cd = 10;				// Normal attack every second
normal_animation_cd = 8;			// X frames in attack animation
attack_wait = 2;
alarm[0] = normal_attack_cd;		// Alarm[0] attack cooldown
alarm[1] = normal_animation_cd;		// Alarm[1] attack animation cooldown
alarm[2] = attack_wait;				// Alarm[2] wait for attack object to be created

special_attack_cd = room_speed / 6;
alarm[3] = special_attack_cd;

feed_attack_cd = room_speed / 6;
alarm[4] = feed_attack_cd;

invuln = false;
invuln_length = 20;					// When Hurt, player is invulnerable for a few seconds
alarm[5] = invuln_length;

evolving = false;
evolveTime = room_speed / 20 * 20;
alarm[6] = 0;

state = states.free;
#endregion

#region States
enum states
{
	free,
	hurt,
	normal_attack,
	special_attack,
	feed_attack,
	evolve,
	die
}
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