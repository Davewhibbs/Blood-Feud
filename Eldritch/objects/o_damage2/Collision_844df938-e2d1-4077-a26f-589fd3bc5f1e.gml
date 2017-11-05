/// @description Deal Damage and Knockback

if(other != creator)
{
	other.health_ -= creator.damage;
	audio_play_sound(snd_hit2, 10,false);
	instance_destroy();
}