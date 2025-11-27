if (delay > 0)
{
    delay--;
    exit;
}
timer++;
if (timer >= 20)
{
    draw_sprite_ext(spr_gerson_progress_star2, 2, x, y + 3, 0.17, image_yscale - 0.4, image_angle, c_white, image_alpha);
    image_yscale += 0.5;
}
else
{
    draw_self();
}
if (timer < 3)
{
    d3d_set_fog(true, c_white, 0, 1);
    draw_self();
    d3d_set_fog(false, c_black, 0, 0);
    vspeed = 1;
    gravity_direction = 270;
    gravity = -0.4;
}
if (timer > 10 && image_xscale > 0.5)
    image_xscale -= 0.2;
if (timer > 19)
    image_alpha -= 0.1;
if (timer == 29)
    instance_destroy();
if (timer == 1)
    x = xstart + 2;
if (timer == 2)
    x = xstart - 1;
if (timer == 3)
    x = xstart;
