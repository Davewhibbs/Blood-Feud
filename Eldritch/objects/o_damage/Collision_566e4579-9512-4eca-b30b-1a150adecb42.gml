/// @description Deal Damage and Knockback

if(other != creator)
{
	if(other.invuln ==false)
	{
		other.health_ -= creator.damage;
		other.speed_[h] += creator.dir * knockback_x;
		other.speed_[v] -= knockback_y;
		audio_play_sound(snd_hit2, 10,false);
		other.state = states.hurt;
		instance_destroy();
	}
}