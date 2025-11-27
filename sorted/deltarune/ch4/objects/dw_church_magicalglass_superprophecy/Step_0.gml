if (con == 0)
{
    if (destroy)
    {
        con = 1;
        timer = 0;
    }
}
var clientlist = [];
array_push(clientlist, 1049);
array_push(clientlist, 1235);
array_push(clientlist, 1409);
with (obj_dw_churchb_darkclimb)
{
    if (i_ex(sujumpoff))
        array_push(clientlist, sujumpoff);
}
var targalpha = 0.2;
for (var i = 0; i < array_length(clientlist); i++)
{
    if (place_meeting(x, y, clientlist[i]))
        targalpha = 0.8;
}
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
            var snd = snd_play_complex(0, 0, undefined);
            snd_add_complex(snd, 0, 236, 0.6, 0.4, (delaytime - 1) + 2, -1, 0);
            snd_add_complex(snd, 1, 390, 0.8, 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 2, 390, 0.71, 0.5, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 3, 269, 0.7, 0.95, (delaytime - 1) + 0, -1, 0);
            snd_add_complex(snd, 4, 321, 1, 0.95, 0, -1, 0);
        }
    }
    else
    {
    }
    instance_destroy();
}
