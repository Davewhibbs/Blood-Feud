draw_self();

if !instance_exists(player) exit;

draw_health = lerp(draw_health, player.health_, .2);

draw_set_color(c_red);
draw_rectangle(x+4, y+4, x+123 * draw_health/player.max_health_, y+11, false);
draw_set_color(c_white);