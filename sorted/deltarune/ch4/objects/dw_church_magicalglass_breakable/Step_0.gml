if (con == 0)
{
    if (destroy)
    {
        con = 1;
        timer = 0;
    }
}
var targalpha = idlealpha;
if (scr_onscreen(self))
{
    with (obj_dw_churchb_darkclimb)
    {
        if (i_ex(sujumpoff))
        {
            if (place_meeting(x, y, sujumpoff))
            {
                targalpha = 0.8;
                break;
            }
        }
    }
    var specialcase = false;
    with (obj_dw_church_staircase)
    {
        if (con >= 10)
            specialcase = true;
    }
    if (specialcase)
    {
        clientlist = [1409];
        clientlist_length = 1;
    }
    if (targalpha == idlealpha)
    {
        for (var i = 0; i < clientlist_length; i++)
        {
            if (place_meeting(x, y, clientlist[i]))
            {
                targalpha = 0.8;
                break;
            }
        }
    }
}
if (targalpha == 0.8 && i_ex(obj_dw_churchc_dodge))
    idlealpha = 0.2;
image_alpha = lerp(image_alpha, targalpha, 0.125);
if (con == 1)
{
    var delaytime = delay;
    if (delay)
    {
        spr = 1252;
        for (var j = 0; j < sprite_get_number(spr); j++)
        {
            with (scr_marker_ext(x + choose(2, -2), y + choose(2, -2), spr, 2, 2, undefined, j, undefined, depth))
            {
                direction = random(360);
                scr_delay_var("gravity", 0.5 + random(0.1), delaytime);
                scr_delay_var("friction", 0, delaytime);
                scr_delay_var("speed", 2, delaytime);
                scr_doom(id, 120);
            }
        }
        if (!nosound)
        {
            var volmod = 0.6;
            var snd = snd_play_complex(0, 0, undefined);
            snd_add_complex(snd, 0, 236, 0.6, volmod * 0.4, (delaytime - 1) + 2, -1, 0);
            snd_add_complex(snd, 1, 390, 0.8, volmod * 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 2, 390, 0.71, volmod * 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, volmod * 1, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 4, 321, 1, volmod * 0.85, 0, -1, 0);
        }
    }
    else
    {
    }
    instance_destroy();
}
