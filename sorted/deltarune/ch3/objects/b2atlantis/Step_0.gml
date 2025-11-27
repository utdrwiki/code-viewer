scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (invisify == 0)
    {
        scr_delay_var("invisify", 1, 10);
        invisify = -1;
    }
    if (invisify == 1)
    {
        with (obj_mainchara_board)
        {
            canfreemove = false;
            stink = false;
            visible = false;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        with (obj_b2loverbridge)
            talkstop = 1;
        if (!i_ex(obj_couchwriter))
            con = 1;
    }
    if (con == 1)
    {
        timer++;
        if (timer == 1)
        {
        }
        if (timer == 10)
            mus_fade(global.currentsong[1], 30);
        if (timer == 60)
        {
            ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
            var ratalk = stringsetloc("Huh? It seems pretty dark--", "obj_b2atlantis_slash_Step_0_gml_28_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (timer == 80)
        {
            snd_play(snd_impact);
            snd_play_x(snd_impact, 0.5, 0.8);
            snd_play_x(snd_impact, 0.5, 0.6);
            blackout = scr_marker(camerax() - 10, cameray() - 10, spr_pxwhite);
            blackout.image_blend = c_black;
            blackout.image_xscale = 700;
            blackout.image_yscale = 700;
            blackout.depth = -999;
            with (obj_border_controller)
                hide_border();
        }
        if (timer == 100)
        {
            global.plot = 99;
            global.flag[6] = 0;
            global.flag[7] = 0;
            global.hp[1] = global.maxhp[1];
            global.hp[2] = global.maxhp[2];
            global.hp[3] = global.maxhp[3];
            if (global.plot < 131)
                global.plot = 131;
            room_goto(room_dw_rhythm);
        }
    }
}
else
{
}
