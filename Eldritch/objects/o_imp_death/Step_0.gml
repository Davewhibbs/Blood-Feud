/// @description Insert description here
// You can write your code in this editor
image_xscale = dir;

if dir = 1
{
	speed_[h] = -5;
}
else
{
	speed_[h] = 5;
}

// If in the air
if !place_meeting(x, y+1, o_solid)
{
	speed_[v] += gravity_;
	
	// Moving Upwards, hold first frame
	if(speed_[v] < 0)
	{
		image_speed = 0;
		image_index = 0;
	}
	// Moving Downwards, hold second frame
	else if(speed_[v] > 0)
	{
		image_speed = 0;
		image_index = 1;
	}
}
else// If on the ground, continue the animation, stop moving
{
	image_speed = 1;
	speed_[h] = 0;
}

// Move the object
Move(speed_);