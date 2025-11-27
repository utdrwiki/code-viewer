y = cameray() + ypos;
if (image_alpha < 1)
{
    ypos -= 1;
    image_alpha += 0.1;
}
if ((timer < 18 && obj_mainchara.y > 3660) || vanish)
{
    vanish = true;
    image_alpha -= 0.25;
    if (image_alpha <= 0)
        instance_destroy();
    exit;
}
timer += 1;
if (timer == 1)
{
    snd_stop(snd_knight_jump_quick);
    snd_play_x(snd_knight_jump_quick, 0.5, 1.3);
}
if (timer >= 10 && timer < 16)
{
    image_blend = merge_color(c_white, c_red, (timer - 10) / 6);
    ypos = lerp(ypos, 38, (timer - 10) / 6);
}
if (timer == 16)
{
    con = y;
    ypos += 600;
    snd_stop(snd_knight_cut2);
    snd_play_x(snd_knight_cut2, 0.5, 1.3);
}
if (timer == 18)
{
    if (global.inv < 0 && i_ex(obj_mainchara) && x > (obj_mainchara.x + 6) && x < (obj_mainchara.x + 34))
        event_user(5);
}
if (timer == 18)
    instance_destroy();
