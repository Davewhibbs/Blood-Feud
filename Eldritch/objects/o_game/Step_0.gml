// If esc is pressed, end the game
if keyboard_check_pressed(vk_escape) game_end();

if global.player1_lives <= 0
{
	global.player2_victory = true;
}
else if global.player2_lives <= 0
{
	global.player1_victory = true;
}