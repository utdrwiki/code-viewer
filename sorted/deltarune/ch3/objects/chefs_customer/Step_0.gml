if (specinit == 0)
{
    if (special)
    {
        snd_play(snd_shineselect);
        var makenote = false;
        if (makenote)
        {
            var specialnote = scr_marker_ext(4, 476, spr_ch3_chef_specialguestText, 2, 2);
            with (specialnote)
            {
                extflag = "specialnote";
                if (global.lang == "ja")
                    sprite_index = spr_ch3_chef_specialguestText_jpPLACEHOLDER;
                var timeamt = 2;
                scr_delay_var("visible", 0, timeamt * 1);
                scr_delay_var("visible", 1, timeamt * 2);
                scr_delay_var("visible", 0, timeamt * 3);
                scr_delay_var("visible", 4, timeamt * 4);
                scr_doom(id, timeamt * 30);
            }
        }
    }
    specinit = 1;
}
if (tenna)
    mask_index = spr_tenna_grasp_chef;
if (obj_chefs_game.gameover)
    exit;
if (!leaving)
{
    if (eating)
    {
        speed = 0;
        exit;
    }
    if (alarm[0] >= 0)
        sprite_index = sprEat;
    else
        sprite_index = sprWalk;
    switch (movetype)
    {
        case 1:
            t++;
            x = xstart + (cos(t * f) * a);
            if (x < xprevious)
                image_xscale = 2;
            else
                image_xscale = -2;
            image_speed = 1;
            break;
        default:
            if (!special)
            {
                if (x <= -24)
                    instance_destroy();
                hspeed = -2;
            }
            else
            {
                if (moves > 0)
                {
                    if (x > ((room_width / 4) * 3) && hspeed > 0)
                    {
                        moves--;
                        side = -1;
                    }
                    if (x < ((room_width / 4) * 1) && hspeed < 0)
                    {
                        moves--;
                        side = 1;
                    }
                }
                if (spriteset == 0)
                    image_xscale = side * -2;
                else
                    image_xscale = side * 2;
                hspeed = side * movespeed;
            }
            break;
    }
}
if (y > (room_height + 40) && leaving)
    instance_destroy();
