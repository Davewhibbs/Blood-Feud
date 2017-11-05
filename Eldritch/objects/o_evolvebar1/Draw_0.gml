draw_self();

if !instance_exists(player) exit;

draw_evolve = lerp(draw_evolve, player.evolution, .2);

if (player.evolution < player.max_evolution){
draw_set_color(c_yellow);
}
else if (player.evolution >= player.max_evolution){
draw_set_color(c_green);
}

draw_rectangle(x+4, y+4, x+123 * draw_evolve/player.max_evolution, y+11, false);

draw_set_color(c_white);