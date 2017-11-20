/// @description Deal Damage and Knockback

if(other != creator)
{
	if(other.invuln ==false)
	{
		other.health_ -= creator.damage;
		other.speed_[h] += creator.dir * knockback_x;
		other.speed_[v] -= knockback_y;
		audio_play_sound(snd_bite, 10,false);
		var hit = instance_create_depth(x + x_offset, y + y_offset, -1, o_bighit);
		hit.dir = creator.dir;
		
		other.dir = -creator.dir;
		other.state = states.hurt;
	}
}