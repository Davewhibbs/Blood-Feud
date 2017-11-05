/// @description Deal Damage and Knockback
other.health_ -= creator.damage;
audio_play_sound(snd_hit2, 10,false);
//other.state = states.hurt;

instance_destroy();