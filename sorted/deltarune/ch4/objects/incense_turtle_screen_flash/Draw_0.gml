draw_sprite_ext(spr_whitepx_10, 0, camerax(), cameray(), 99, 99, 0, c_white, image_alpha);
if (con == 0)
{
    image_alpha += 0.05;
    if (image_alpha == 1.1)
        con = 1;
}
if (con == 1)
{
    with (obj_turtle_toriel_fire)
        instance_destroy();
    image_alpha -= 0.02;
    if (image_alpha < 0)
        instance_destroy();
}
