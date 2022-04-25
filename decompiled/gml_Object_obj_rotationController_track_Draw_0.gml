draw_self()
if (rotate == 1)
{
    image_index = 0
    if (left == 1)
        draw_sprite_ext(spr_rotationController_directions, 0, (x + 6), (y + 20), 2, 2, 0, c_white, 1)
    if (right == 1)
        draw_sprite_ext(spr_rotationController_directions, 2, (x + 6), (y + 20), 2, 2, 0, c_white, 1)
    if (down == 1)
        draw_sprite_ext(spr_rotationController_directions, 1, (x + 6), (y + 20), 2, 2, 0, c_white, 1)
}
else
    image_index = 1
