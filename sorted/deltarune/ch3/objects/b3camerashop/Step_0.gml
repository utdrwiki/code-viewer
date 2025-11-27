scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (obj_board_camera.con == 0 && suwalk == 0)
    {
        scr_pathfind_to_point("susie", 7.5, 6, 2);
        ralsei.follow = false;
        scr_pathfind_to_point("ralsei", 3.5, 6, 2);
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
    if (goodtalk == 0 && obj_board_camera.con == 0)
    {
        goodtimer++;
        if (goodtimer == 30)
        {
            var sutalk = stringsetloc("Now THIS is good.", "obj_b3camerashop_slash_Step_0_gml_44_0");
            scr_couchtalk(sutalk, "susie", 2, 80);
            goodtalk = 1;
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visitinit == 0)
        {
            shopstring = string1;
            if (!i_ex(lancer1))
            {
                shopstring = "";
                textcomplete = true;
            }
            visitinit = 1;
        }
    }
    if (!i_ex(lancer2))
    {
        if (shopstring == string1 && string2said == 0)
        {
            string2said = 1;
            debug_print("lancer2 get");
            shopstring = string2;
            if (pipstring == pipstring2)
                pipstring = "";
            textcomplete = 0;
            texttimer = 0;
        }
    }
    if (obj_board_inventory.lancer == 2 && susietalk == 0)
    {
        susietalk = 1;
        var sutalk = stringsetloc("Hell yeah, 2 Lancers!", "obj_b3camerashop_slash_Step_0_gml_82_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
    if (pipstring == pipstring2 && piptalk == 0)
    {
        piptalk = 1;
        var sutalk = stringsetloc("Least Lancer's here.", "obj_b3camerashop_slash_Step_0_gml_90_0");
        scr_couchtalk(sutalk, "susie", 2, 60);
    }
}
else
{
    if (pipstring == pipstring2)
        pipstring = "";
    suwalk = 0;
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
}
