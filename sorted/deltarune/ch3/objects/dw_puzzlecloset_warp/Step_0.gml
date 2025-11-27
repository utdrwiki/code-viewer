if (con == 0)
{
    if (place_meeting(x, y, obj_mainchara_board))
    {
        obj_mainchara_board.facing = 2;
        timer = 39;
        global.interact = 1;
        con = 1;
    }
}
if (con == 1)
{
    timer++;
    if (timer == 40)
    {
        snd_play(snd_board_escaped);
        fade = scr_board_marker(3008, 192, spr_pxwhite);
        with (fade)
        {
            image_blend = c_black;
            image_alpha = 0;
            image_xscale = 640;
            image_yscale = 980;
            var fadecount = 3;
            var fadestep = 5;
            for (var i = 1; i < (fadecount + 1); i++)
                scr_delay_var("image_alpha", i / fadecount, fadestep * i);
        }
    }
    if (timer == 70)
        con++;
}
if (con == 2)
    timer = 0;
if (con == 3)
{
    timer++;
    if (timer == 30)
    {
        with (obj_mainchara_board)
            facing = 0;
        with (fade)
        {
            var fadecount = 3;
            var fadestep = 5;
            for (var i = 1; i < (fadecount + 1); i++)
                scr_delay_var("image_alpha", 1 - (i / fadecount), fadestep * i);
        }
    }
    if (timer > 30 && fade.image_alpha == 0)
    {
        safe_delete(fade);
        global.interact = 0;
        instance_destroy();
    }
}
