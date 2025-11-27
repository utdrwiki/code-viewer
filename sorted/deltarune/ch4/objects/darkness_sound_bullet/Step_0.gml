if (init == 0)
{
    destroyonhit = false;
    init = 1;
    image_xscale = 15;
    image_yscale = 15;
    if (dir == 8)
    {
        y_change = -1;
        sound = 542;
    }
    else if (dir == 6)
    {
        x_change = 1;
        sound = 10;
    }
    else if (dir == 2)
    {
        y_change = 1;
        sound = 503;
    }
    else if (dir == 4)
    {
        x_change = -1;
        sound = 59;
    }
}
timer++;
if (timer == delay && con < 3)
{
    con++;
    if (con <= 3)
    {
        timer = 0;
        var _dist = (3 - con) * 75;
        if (con == 3)
        {
            lightsource = instance_create(x + (x_change * 30), y + (y_change * 30), obj_lightsource_static);
            x += (x_change * 70);
            y += (y_change * 70);
            var _snd = snd_play(sound);
            lightsource.visible = false;
            lightsource.radius = 60;
            active = true;
        }
        else if (y_change != 0)
        {
            var _snd = snd_play(sound);
            snd_pitch(_snd, 1 - ((3 - con) * y_change * 0.1));
        }
        else
        {
            audio_play_sound_at(sound, x + (_dist * x_change), y + (_dist * y_change), 0, 100, 300, 1, false, 1);
        }
    }
}
if (con == 3)
{
    if (timer == 1)
        lightsource.radius = 70;
    else if (timer == 2)
        lightsource.radius = 75;
    else if (timer > 2)
        lightsource.radius = lerp(75, 0, scr_ease_in((timer - 2) / 20, 1));
    if (timer == 4)
        active = false;
    if (timer == 30)
        instance_destroy();
}
