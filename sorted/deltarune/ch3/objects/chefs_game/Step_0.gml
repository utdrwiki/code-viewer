global.flag[1118] = scorepoints;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
    if (scr_debug() && keyboard_check_pressed(vk_f5))
    {
        snd_play(snd_lancerwhistle);
        win = 1;
        gameover = 1;
    }
    if (scr_debug() && keyboard_check_pressed(vk_f6))
    {
        snd_play(snd_lancerwhistle);
        win = -1;
        gameover = true;
    }
    if (scr_debug() && keyboard_check_pressed(vk_f7))
    {
        snd_play(snd_lancerwhistle);
        win = 1;
        gameover = 1;
        scorepoints = 999;
        global.flag[1118] = scorepoints;
    }
}
if (keyboard_check_pressed(ord("W")) && gamestart && !gameover && introtimer >= 121 && lasereasteregg_con == 0 && global.flag[1265] == 0 && room == room_dw_chef)
{
    lasereasteregg_timer = 0;
    lasereasteregg_con = 1;
}
if (lasereasteregg_con == 1 && gamestart && !gameover)
{
    global.flag[1265] = 1;
    lasereasteregg_timer++;
    if (lasereasteregg_timer % 5 && lasereasteregg_timer < 91)
        instance_create_depth(0, 54 + irandom(100), depth - 1, obj_chef_laser_easteregg1);
}
if (microgame == 0 && gameover && rank_set == false)
{
    rank_set = true;
    if (win > 0)
        rank = "D";
    if (scorepoints >= 210)
        rank = "C";
    if (scorepoints >= 300)
        rank = "B";
    if (scorepoints >= 380)
        rank = "A";
    if (scorepoints >= 450)
        rank = "S";
    if (replayversion && scorepoints >= 640)
        rank = "T";
    if (scorepoints >= scorepoints_goal)
    {
        if (timer >= 10)
            rank = "T";
    }
}
if (gamestart && !gameover)
{
    switch (microgame)
    {
        default:
            if (!i_ex(obj_tenna_enemy))
                min_pts -= depletionrate;
            popularity = max(0, (scorepoints + 200 + min_pts) / scorepoints_goal);
            if (win == 0)
            {
                var _wait = 0;
                if (obj_chefs_kris.throwing)
                    _wait = 1;
                if (instance_exists(obj_chefs_customer))
                {
                    with (obj_chefs_customer)
                    {
                        if (eating)
                            _wait = 1;
                    }
                }
                if (instance_exists(obj_chefs_stackbox))
                {
                    with (obj_chefs_stackbox)
                    {
                        if (bbox_top < room_height)
                            _wait = 1;
                    }
                }
                if (instance_exists(obj_chefs_coinvfx))
                    _wait = 1;
                if (popularity <= 0 && _wait == 0)
                {
                    with (obj_chef_controls_ui)
                        instance_destroy();
                    snd_play(snd_lancerwhistle);
                    win = -1;
                    gameover = true;
                    exit;
                }
                if (popularity >= 1 && !replayversion)
                {
                    snd_play(snd_lancerwhistle);
                    win = 1;
                    gameover = true;
                    t_rank = true;
                    with (obj_chef_controls_ui)
                        con = 2;
                }
            }
            break;
        case 2:
        case 3:
            if (win == 0)
            {
                if (instance_number(obj_chefs_evilguest) == 0)
                {
                    snd_play(snd_lancerwhistle);
                    win = 1;
                    gameover = true;
                }
            }
            break;
        case 4:
        case 5:
            if (win == 0)
            {
                var _ok = 0;
                if (instance_exists(obj_chefs_customer))
                {
                    with (obj_chefs_customer)
                    {
                        if (leaving)
                            _ok++;
                    }
                }
                if (!instance_exists(obj_chefs_customer) || _ok > 0)
                {
                    snd_play(snd_lancerwhistle);
                    win = 1;
                    gameover = 1;
                }
            }
            break;
    }
}
if (gameover)
{
    if (!gameover_done && !i_ex(obj_minigame_quit_ui))
    {
        gameover_done = true;
        with (obj_chefs_food)
        {
            if (!on_fire)
                vspeed = 0;
        }
        with (obj_chefs_fire)
            vspeed = 0;
        if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -1;
            }
        }
        else
        {
            if (i_ex(obj_tenna_zoom) || i_ex(obj_tenna_enemy))
            {
                with (obj_tenna_zoom)
                {
                    con = 2;
                    timer = -1;
                }
                exit;
            }
            snd_free_all();
            scr_flag_set(7, 0);
            if (replayversion)
            {
                inst = instance_create_depth(0, 0, 0, obj_gameover_minigame);
                inst.replayversion = replayversion;
                if (win < 1)
                    scr_flag_set(1089, scr_flag_get(1089) + 1);
                else
                    inst.replaywin = true;
            }
            else if (win < 1)
            {
                scr_flag_set(1089, scr_flag_get(1089) + 1);
                instance_create_depth(0, 0, 0, obj_gameover_minigame);
            }
            else
            {
                instance_create(0, 0, obj_victory_minigame);
            }
        }
    }
    if (scr_debug() && button3_p() && room == room_CHEFS)
        room_restart();
    with (obj_minigame_quit_ui)
        instance_destroy();
    exit;
}
