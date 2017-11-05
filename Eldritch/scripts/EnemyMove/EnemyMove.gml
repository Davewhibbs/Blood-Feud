///@param speed
var speed_ = argument0;

// Horizontal Collision
if place_meeting(x+speed_[h], y, o_solid)
{
	while !place_meeting(x+sign(speed_[h]), y, o_solid)
	{
		x += sign(speed_[h]);
	}
	x -= sign(speed_[h]);
	speed_[@ h] = 0;
	
	dir *= -1;
}

// Vertical Collision
if place_meeting(x, y + speed_[v], o_solid)
{
	while !place_meeting(x, y+sign(speed_[v]), o_solid)
	{
		y += sign(speed_[v]);
	}
	speed_[@ v] = 0;
}
	
if (fearOfHeights && !position_meeting(x+4*dir, y+(sprite_height/2)+4, o_solid))
{
	dir *= -1;
}
x += speed_[h];
y += speed_[v];

