scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (!i_ex(candy) && i_ex(pippins))
    {
        if (made == 0)
        {
            candy = instance_create_board(8, 4.5, obj_board_tvdinner);
            with (candy)
                setxy_board(3456, 448);
            made = 1;
        }
    }
    if (i_ex(candy))
        made = 1;
    if (obj_board_camera.con == 0 && suwalk == 0)
    {
        scr_pathfind_to_point("susie", choose(1, 2, 9, 10), 6, 0);
        suwalk = 6;
    }
    if (sndpause == 0 && obj_board_camera.con == 0)
    {
        sndpause = 1;
        snd_pause(global.currentsong[1]);
    }
    if (sndpause == 1 && obj_board_camera.con != 0)
    {
        sndpause = 0;
        snd_resume(global.currentsong[1]);
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visitinit == 0)
            visitinit = 1;
    }
    if (keycon == 1 && obj_board_camera.shift == "none")
    {
        with (candy)
            tempblock = true;
        noblock = instance_create(3360, 572, obj_board_solid);
        noblock.image_xscale = 2;
        with (noblock)
            setxy_board();
        kris.cantleave = true;
        keycon = 2;
        keytimer = 0;
        forcedraw = 1;
    }
    if (keycon == 2)
    {
        var tetalk = stringsetloc("Wait, there aren't any keys this time...", "obj_b2westshop_slash_Step_0_gml_66_0");
        scr_couchtalk(tetalk, "ralsei", 2, 80);
        keycon = 3;
    }
    if (keycon == 3 && !i_ex(obj_couchwriter))
    {
        timer = 0;
        texttimer = 0;
        textcomplete = false;
        shopstring = string2;
        keycon = 4;
        keytimer = 0;
    }
    if (keycon == 4 && textcomplete)
    {
        keytimer++;
        if (keytimer == 30)
        {
            with (pippins)
            {
                snd_play_x(snd_board_mantle_dash_fast, 1, 1.8);
                snd_play_x(snd_board_splash, 0.4, 1.8);
                scr_lerpvar("x", x, x - 480, 18, 2, "in");
                scr_doom(id, 40);
            }
        }
        if (keytimer > 30 && pippins.x <= board_tilex(-1))
        {
            with (candy)
            {
                tempblock = false;
                costfree = true;
            }
            kris.cantleave = false;
            safe_delete(noblock);
            shopstring = "";
            keycon = 5;
        }
    }
}
else
{
    suwalk = 0;
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
    made = 0;
    pocketcheck = 0;
}
