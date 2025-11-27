i = max_old - 1;
while (i > 0)
{
    draw_sprite_ext(sprite_index, 0, old_x[i], old_y[i], image_xscale, image_yscale - (0.2 * i), old_angle[i], c_white, image_alpha - (0.3 * i));
    i--;
}
draw_self();
