if (friendly)
    exit;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (x < (camerax() - 32))
{
    draw_sprite_ext(spr_susiezilla_harm_indicator, 0, camerax() + 48, y, -0.5, 0.5, 0, c_black, 0.5);
    draw_sprite_ext(sprite_index, 0, camerax() + 48, y, image_xscale * 0.75 * 0.75, image_yscale * 0.75 * 0.75, image_angle, image_blend, 1);
}
if (x > (camerax() + camerawidth() + 32))
{
    draw_sprite_ext(spr_susiezilla_harm_indicator, 0, (camerax() + camerawidth()) - 48, y, 0.5, 0.5, 0, c_black, 0.5);
    draw_sprite_ext(sprite_index, 0, (camerax() + camerawidth()) - 48, y, image_xscale * 0.75 * 0.75, image_yscale * 0.75 * 0.75, image_angle, image_blend, 1);
}
