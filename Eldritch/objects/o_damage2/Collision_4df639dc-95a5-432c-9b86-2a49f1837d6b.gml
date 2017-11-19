/// @description Insert description here
// You can write your code in this editor

other.health_ -= damage;
other.killer = creator;
audio_play_sound(snd_hit,10,false);
creator.evolution += 1;
instance_destroy();