scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 0;
        con = 0.5;
        teactive = 1;
    }
    if (teactive == 1)
    {
        tetimer++;
        if (tetimer == 200)
        {
            tetimer = 0;
            teactive = 2;
        }
    }
    if (con == 0.5)
    {
        timer++;
        if (timer == 5)
            scr_pathfind_to_point("kris", 304, 176, 0);
        if (timer == 30)
        {
            scr_pathfind_to_point("ralsei", 352, 176, 3);
            timer = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        var allaboard = 0;
        with (obj_mainchara_board)
        {
            if (y > 224)
                allaboard++;
        }
        if (allaboard == 0)
        {
            obj_board_b3b_elevatorbg.open = false;
            snd_play(snd_board_door_close);
            blocker = instance_create(1440, 1536, obj_board_solid);
            with (blocker)
            {
                setxy_board(x, y);
                image_xscale = 2;
            }
            con++;
        }
    }
    if (con == 2 && teactive == 2)
    {
        timer++;
        if (timer == 5)
        {
            obj_board_b3b_elevatorbg.drawlight = true;
            snd_play(snd_bell);
        }
        if (timer == 30)
        {
            snd_play_x(snd_impact_bc, 0.8, 0.6);
            scr_shakeobj_ext(342, 4, 0);
            obj_board_b3b_elevatorbg.rising = true;
            var elesnd = snd_init("elevator.ogg");
            elevatorsound = snd_loop(elesnd);
            snd_volume(elevatorsound, 0, 0);
            snd_volume(elevatorsound, 1, 30);
            snd_pitch(elevatorsound, 0.6);
            timer = 0;
            con++;
        }
    }
    if (con == 3)
    {
        timer++;
        var linepause = 35;
        var talklength = 65;
        var prefire = 19;
        var _myspeed = obj_board_b3b_elevatorbg.myspeed;
        var _doomtime = obj_board_b3b_elevatorbg.doomtime;
        if (timer == ((5 + ((talklength + linepause) * 3)) - prefire))
        {
            var decor = scr_board_marker(board_tilex(1), board_tiley(-2) + 30, spr_board_b3b_vhs);
            decor.vspeed = _myspeed;
            scr_doom(decor, _doomtime);
        }
        if (timer == ((5 + ((talklength + linepause) * 4)) - prefire))
        {
            var decor = scr_board_marker(board_tilex(9.5), board_tiley(-2) - 36, spr_board_b3b_woodpanelcar);
            decor.vspeed = _myspeed;
            scr_doom(decor, _doomtime);
        }
        if (timer == (5 + ((talklength + linepause) * 6) + 30))
        {
            timer = 0;
            con++;
            obj_board_b3b_elevatorbg.finishrising = 1;
        }
    }
    if (con == 4)
    {
        if (obj_board_b3b_elevatorbg.rising == 10)
        {
            timer++;
            if (timer == 1)
                snd_volume(elevatorsound, 0, 30);
            if (timer == 30)
            {
                snd_stop(elevatorsound);
                snd_play(snd_board_torch_high);
                snd_play_delay(snd_board_torch, 5, 1, 1.6);
                snd_play_delay(snd_noise, 6, 1, 1);
                safe_delete(block);
                scr_board_gridreset();
                with (ld)
                    scr_lerpvar("x", x, x - 26, 6, -1, "out");
                with (rd)
                    scr_lerpvar("x", x, x + 28, 6, -1, "out");
                obj_board_b3b_elevatorbg.drawlight = false;
            }
            if (timer == 45)
            {
                con = 15;
                timer = 0;
            }
        }
    }
    if (con == 15)
    {
        timer++;
        if (timer == 1)
        {
        }
        if (timer == 15)
        {
            scr_play_recording("kris", "0U0U0U0U0U0U0U0U0U0U0U0U0U");
            timer = 0;
            con = 16;
        }
    }
    if (con == 16)
    {
        if (scr_board_checklocation("kris", 304, 160, 2))
        {
            timer++;
            if (timer == 1)
            {
                snd_play(snd_board_escaped);
                scr_quickwarp(2432, 1856, 2608, 2080);
                con++;
            }
        }
    }
}
else
{
}
