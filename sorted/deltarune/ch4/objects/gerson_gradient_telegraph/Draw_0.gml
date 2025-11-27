if (side == "left")
{
    draw_sprite_ext(spr_whitegradientdown_40, 9, camerax() + 40, cameray(), 20, 1, -90, image_blend, image_alpha);
    image_alpha -= 0.1;
}
if (side == "right")
{
    draw_sprite_ext(spr_whitegradientdown_40, 9, (camerax() + camerawidth()) - 40, cameray() + cameraheight() + 40, 20, 1, 90, image_blend, image_alpha);
    image_alpha -= 0.1;
}
if (side == "up")
{
    draw_sprite_ext(spr_whitegradientdown_40, 9, camerax() + camerawidth(), cameray() + 40, 20, 1, 180, image_blend, image_alpha);
    image_alpha -= 0.1;
}
if (side == "down")
{
    depth = obj_battlecontroller.depth - 2;
    draw_sprite_ext(spr_whitegradientdown_40, 9, camerax(), (cameray() + cameraheight()) - 40, 20, 1, 0, image_blend, image_alpha);
    image_alpha -= 0.1;
}
if (image_alpha < 0)
    instance_destroy();
