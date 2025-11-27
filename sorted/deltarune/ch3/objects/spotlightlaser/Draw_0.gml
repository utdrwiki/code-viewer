if (con == 0)
{
    if (image_alpha < 1)
    {
        image_alpha += 0.16666666666666666;
    }
    else
    {
        timer++;
        if (timer == 30)
        {
            timer = 0;
            con = 1;
            snd_stop(snd_sneo_overpower);
            snd_play_x(snd_sneo_overpower, 0.7, 1.1);
            snd_loop(snd_sneo_overpower);
        }
    }
}
if (con == 1)
{
    siner++;
    laser_xscale = 0.4 + (sin(siner / 2) * 0.2);
    laser_yscale += (1/3);
    timer++;
    if (timer == 34)
    {
        timer = 0;
        con = 2;
        snd_volume(snd_sneo_overpower, 0, 10);
    }
}
if (con == 2)
{
    laser_xscale = lerp(laser_xscale, 0, 0.3);
    image_alpha -= 0.1;
    if (image_alpha < 0)
        instance_destroy();
}
gpu_set_blendmode(bm_add);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, image_alpha);
gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index, image_index, x, y, laser_xscale, laser_yscale, image_angle, image_blend, image_alpha);
