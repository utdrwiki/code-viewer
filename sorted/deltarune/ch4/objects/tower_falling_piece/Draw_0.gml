var xx = 0;
delay--;
if (delay <= 0)
{
    timer++;
    if (timer >= 1)
    {
        _yspeed += 0.6;
        y += _yspeed;
    }
    if (timer == 80)
        instance_destroy();
}
draw_sprite_ext(sprite_index, image_index, x + xx, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (y > (cameray() + cameraheight() + 40))
    instance_destroy();
