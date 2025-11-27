if (up_h())
    y -= 12;
if (down_h())
    y += 12;
if (right_h())
    x += 12;
if (left_h())
    x -= 12;
if (y < cameray())
    y = cameray();
if (y > (cameray() + 300))
    y = cameray() + 300;
if (x < (camerax() + 320))
    x = camerax() + 320;
if (x > (camerax() + 600))
    x = camerax() + 600;
if (con == 0)
{
    var timermax = 12;
    timer++;
    image_alpha = lerp(0, 1, timer / timermax);
    image_xscale = lerp(image_xscale, 1, timer / timermax);
    image_yscale = lerp(image_yscale, 1, timer / timermax);
    image_angle = lerp(image_angle, 394, 0.08);
    var xx = lerp(300, 0, timer / timermax);
    x = lerp(xstart, xstart + 280 + xx, timer / timermax);
    if (timer >= timermax)
    {
        image_angle = 360;
        timer = 0;
        con = 1;
        savey = y;
    }
}
if (con == 1)
{
    shoottimer++;
    if (button3_h() == 1 && shoottimer > 0 && ammo > 0 && stopshooting == false)
    {
        shoottimer = -3;
        instance_create(obj_herokris.x + 27 + 34, obj_herokris.y + 33 + 12, obj_shadowman_sharpshoot_heart);
        ammo -= 1;
        if (i_ex(obj_herosusie))
        {
            instance_create(obj_herosusie.x + 27 + 49, obj_herosusie.y + 42, obj_shadowman_sharpshoot_heart);
            ammo -= 1;
        }
        if (i_ex(obj_heroralsei))
        {
            instance_create(obj_heroralsei.x + 47 + 32, (obj_heroralsei.y + 50) - 3, obj_shadowman_sharpshoot_heart);
            ammo -= 1;
        }
        snd_play_x(snd_noise, 0.8, 1.2);
    }
    if (ammo < 1 || !i_ex(obj_shadowman_sharpshoot_target))
    {
        ammo = 0;
        image_alpha -= 0.1;
        if (image_alpha <= 0)
            instance_destroy();
    }
}
