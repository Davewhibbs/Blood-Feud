/// @description Insert description here
// You can write your code in this editor

other.health_ -= damage;
other.killer = creator;
other.dir = -creator.dir
audio_play_sound(snd_bite,10,false);
var hit = instance_create_depth(x + x_offset, y + y_offset, -1, o_hit);
hit.dir = creator.dir;
creator.evolution += 1;

