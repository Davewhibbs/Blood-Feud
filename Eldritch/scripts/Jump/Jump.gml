// You can only jump if you have jumps
if(jumps_ > 0)
{
speed_[v] = jump_height_;
jumps_ -= 1;
audio_play_sound(snd_jump, 1, 0);
//instance_create_layer(x, y, "Instances", o_dust);
}
