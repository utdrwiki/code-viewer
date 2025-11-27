if (sign_action == 0)
{
    sign_y = scr_approach(sign_y, sign_ystart, 12);
    if (instance_number(obj_mike_crowd) > 0 || instance_number(obj_mike_pipe) > 0)
        sign_action = 1;
}
if (sign_action == 1)
{
    sign_vspeed += 0.25;
    sign_y += sign_vspeed;
    if (sign_y > -1)
    {
        sign_vspeed *= -0.4;
        sign_bounce += 1;
    }
    if (sign_bounce >= 3)
    {
        sign_vspeed = 0;
        sign_bounce = 0;
        sign_y = 0;
        sign_action = 2;
        if (sign_col == 65280 || sign_col == 65535)
            sign_sound = snd_play_x(snd_crowd, 1, 1);
        if (sign_col == 255)
        {
            sign_sound = snd_play(snd_shh);
            mus_volume(global.batmusic[1], 0, 0);
        }
    }
}
if (sign_action == 2)
{
    if (instance_number(obj_mike_crowd) == 0 && instance_number(obj_mike_pipe) == 0)
    {
        sign_action = 0;
        sign_col = 8421504;
        snd_stop(sign_sound);
        sign_sound = -1;
    }
}
if (sign_action2 == 0)
    sign_y2 = scr_approach(sign_y2, sign_ystart, 12);
if (sign_action2 == 1)
{
    sign_y2 = scr_approach(sign_y2, 0, 4);
    if (sign_y2 == 0)
    {
        sign_action2 = 2;
        snd_play(snd_shh);
        snd_stop(sign_sound);
        sign_sound = -1;
        mus_volume(global.batmusic[1], 0, 0);
    }
}
if (sign_action2 == 2)
{
    if (instance_number(obj_mike_quiet) == 0)
    {
        sign_action2 = 0;
        mus_volume(global.batmusic[1], 1, 50);
    }
}
