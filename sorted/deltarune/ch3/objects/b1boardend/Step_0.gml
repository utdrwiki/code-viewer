scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visit == 0)
        {
            kris.cantleave = true;
            ralsei.follow = false;
            scr_pathfind_to_point("susie", 4, 6, 2);
            scr_pathfind_to_point("ralsei", 7, 6, 2);
            visit = 1;
        }
        if (kris.y < 256)
        {
            with (obj_mainchara_board)
                controlled = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        var proceed = true;
        with (obj_mainchara_board)
        {
            if (y > 256)
                proceed = false;
        }
        if (proceed)
        {
            timer++;
            if (timer >= 15)
            {
                con = 2;
                for (var i = 1; i < 6; i++)
                    scr_delay_var("blackalpha", i / 5, i * 8);
                snd_volume(global.currentsong[1], 0, 48);
                scr_speaker("no_name");
                msgsetloc(0, "* Time for a physical challenge!!!/%", "obj_b1boardend_slash_Step_0_gml_45_0");
                bw_make();
                timer = 0;
            }
        }
    }
    if (con == 2 && !bw_ex())
    {
        timer++;
        if (timer == 30)
            instance_create(x, y, obj_fadeout);
        if (timer == 60)
        {
            global.plot = 110;
            global.interact = 1;
            room_goto(room_ch3_gameshowroom);
        }
    }
}
else
{
    blackalpha = 0;
}
