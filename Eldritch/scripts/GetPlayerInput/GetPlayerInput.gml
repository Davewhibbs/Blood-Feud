///@param playerID

if(argument0 == 1)
{
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
jump_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
normal_key = keyboard_check(vk_control);
special_key = keyboard_check(vk_shift);
feed_key = keyboard_check(vk_enter);
}
else if(argument0 == 2)
{
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
jump_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
normal_key = keyboard_check(ord("T"));
special_key = keyboard_check(ord("Y"));
feed_key = keyboard_check(ord("U"));
}

// Get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// Check for gamepad input
//if (gamepad_is_connected(0))
//{
//	gamepad_set_axis_deadzone(0, .35);
//	xaxis = gamepad_axis_value(0, gp_axislh);
//	yaxis = gamepad_axis_value(0, gp_axislv);
//	jump_key = gamepad_button_check_pressed(0, gp_face1);
//	normal_key = gamepad_button_check_pressed(0, gp_face3);
//	special_key = gamepad_button_check_pressed(0, gp_face4);
//	feed_key = gamepad_button_check_pressed(0, gp_face2);
//}


