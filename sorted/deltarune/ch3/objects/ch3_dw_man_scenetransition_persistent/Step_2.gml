var kris = 1185;
var proc = 0;
if (i_ex(kris))
{
    var ver = 1;
    if (ver == 0)
    {
        if (kris.image_index == 1 && stepped == 0)
        {
            proc = 1;
            stepped = 1;
        }
        if (kris.image_index == 0 || kris.image_index == 2)
            stepped = 0;
        if (kris.image_index == 3 && stepped == 0)
        {
            proc = 1;
            stepped = 1;
        }
    }
    if (ver == 1)
    {
        if (point_distance(kris.x, kris.y, kris.xprevious, kris.yprevious) > 1)
            proc = 1;
    }
}
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        mus_fade(global.currentsong[1], 60);
        with (obj_border_controller)
            show_border(0.017);
    }
    if (timer == 1)
    {
        whitenoise = snd_loop(snd_whitenoise);
        snd_volume(whitenoise, 0, 0);
        snd_volume(whitenoise, 0.2, 60);
        var steps = 12;
        for (var i = 1; i < (steps + 1); i++)
        {
            scr_delay_var("image_blend", merge_color(#D8EEC2, c_white, (1 / steps) * i), round(60 / steps) * i);
            scr_delay_var("fadeamt", (1 / steps) * i, round(60 / steps) * i);
        }
    }
    if (timer == 92)
    {
        room_goto(room_dw_green_room);
        setinplace = 1;
    }
    if (timer > 136 && room == room_dw_green_room)
    {
        timer = 0;
        con = 2;
        with (obj_border_controller)
            stop_custom_effect();
    }
}
if (con == 2)
{
    timer++;
    if (timer == 15)
    {
        scr_lerpvar("fadeamt", 1, 0, 60);
        snd_volume(whitenoise, 0, 60);
    }
    if (timer == 30)
    {
        global.interact = 0;
        con = 3;
    }
}
if (con == 3)
{
    if (fadeamt == 0)
        instance_destroy();
}
if (setinplace == 1)
{
    var xloc = 700;
    var yloc = 170;
    if (room == room_dw_green_room)
    {
        with (obj_mainchara)
            setxy(xloc, yloc);
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                setxy(xloc - 54, yloc - valign);
            if (name == "ralsei")
                setxy(xloc - 98, (yloc - valign) + 4);
            scr_caterpillar_interpolate();
        }
        setinplace = 0;
    }
}
