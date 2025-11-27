if (!puzzle_ready)
{
    if (obj_mainchara.sliding == 1)
        exit;
    var sliding = false;
    with (obj_caterpillarchara)
        sliding = slided == 1;
    if (sliding)
        exit;
    if (obj_mainchara.y >= 2760)
    {
        if (obj_mainchara.x >= 1100)
        {
            puzzle_ready = true;
            stop_follow = true;
        }
    }
}
else
{
    if (set_puzzle)
    {
        set_puzzle = false;
        with (eyemarker[0])
            image_index = 1;
        with (eyemarker[2])
            image_index = 1;
        with (obj_caterpillarchara)
        {
            follow = 0;
            fun = 1;
            sprite_index = dsprite;
            if (name == "ralsei")
            {
                x = 1520;
                y = (2800 - sprite_get_height(sprite_index)) + 20;
            }
            else if (name == "susie")
            {
                x = 1240;
                y = (2800 - sprite_get_height(sprite_index)) + 20;
            }
        }
    }
    if (stop_follow)
    {
        stop_follow = false;
        global.pause_follow = true;
        with (obj_caterpillarchara)
        {
            follow = 0;
            fun = 1;
            image_index = 0;
        }
    }
    if (!susie_solve || !ralsei_solve)
    {
        var solve_susie = susie_solve;
        var solve_ralsei = ralsei_solve;
        with (obj_caterpillarchara)
        {
            if (name == "susie" && !solve_susie)
            {
                if (point_distance(x, y, 1240, (2800 - sprite_get_height(sprite_index)) + 16) < 5)
                {
                    image_speed = 0;
                    image_index = 0;
                    sprite_index = spr_susie_up_press;
                    solve_susie = true;
                }
                else
                {
                    sprite_index = rsprite;
                    image_speed = 0.3;
                }
                scr_obj_movetowards_point(1240, (2800 - sprite_get_height(sprite_index)) + 16, 16);
            }
            if (name == "ralsei" && !solve_ralsei)
            {
                if (point_distance(x, y, 1520, (2800 - sprite_get_height(sprite_index)) + 20) < 5)
                {
                    image_speed = 0;
                    image_index = 0;
                    sprite_index = spr_ralsei_up_press;
                    solve_ralsei = true;
                }
                else
                {
                    sprite_index = rsprite;
                    image_speed = 0.4;
                }
                scr_obj_movetowards_point(1520, (2800 - sprite_get_height(sprite_index)) + 20, 14);
            }
        }
        susie_solve = solve_susie;
        ralsei_solve = solve_ralsei;
    }
    if (susie_solve && !susie_press)
    {
        susie_press_timer++;
        if (susie_press_timer == 1)
            sound_play(snd_noise);
        if (susie_press_timer == 4)
        {
            with (eyemarker[0])
                image_index = 1;
        }
        if (susie_press_timer == 8)
        {
            susie_press = true;
            with (obj_caterpillarchara)
            {
                if (name == "susie")
                    sprite_index = dsprite;
            }
        }
    }
    if (ralsei_solve && !ralsei_press)
    {
        ralsei_press_timer++;
        if (ralsei_press_timer == 1)
            sound_play(snd_noise);
        if (ralsei_press_timer == 4)
        {
            with (eyemarker[2])
                image_index = 1;
        }
        if (ralsei_press_timer == 8)
        {
            ralsei_press = true;
            with (obj_caterpillarchara)
            {
                if (name == "ralsei")
                    sprite_index = dsprite;
            }
        }
    }
}
if (kris_press)
{
    kris_press_timer++;
    if (kris_press_timer == 1)
    {
        global.interact = 1;
        sound_play(snd_noise);
    }
    if (kris_press_timer == 4)
    {
        with (eyemarker[1])
            image_index = 1;
    }
    if (kris_press_timer == 20)
    {
        clean_up();
        sound_play(snd_impact);
        scr_shakescreen();
        layer_set_visible("ASSETS_Magical_Glass", true);
        for (var i = 0; i < array_length(eyesparkle); i++)
        {
            with (eyesparkle[i])
                visible = 0;
        }
        with (bridge_collider)
            instance_destroy();
    }
    if (kris_press_timer == 35)
    {
        kris_press = false;
        global.pause_follow = false;
        with (obj_ch3_PGS01B_eyepuzzle_switch)
            instance_destroy();
        global.interact = 0;
        global.facing = 0;
        with (obj_caterpillarchara)
        {
            fun = 0;
            follow = 1;
            scr_caterpillar_interpolate();
        }
        global.plot = 21;
    }
}
