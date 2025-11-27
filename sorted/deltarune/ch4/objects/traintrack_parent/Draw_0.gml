draw_self();
if (scr_debug() && train_occupied)
{
    d3d_set_fog(true, c_yellow, 0, 0);
    draw_set_alpha(0.2);
    draw_sprite(sprite_index, image_index, x, y);
    d3d_set_fog(false, c_white, 0, 0);
    draw_set_alpha(1);
}
