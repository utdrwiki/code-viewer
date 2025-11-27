scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (obj_board_camera.con == 0 && suwalk == 0)
    {
        if (i_ex(lancer))
        {
            ralsei.follow = false;
            scr_pathfind_to_point("susie", 3.5, 6, 2);
            scr_pathfind_to_point("ralsei", 2.5, 6, 2);
        }
        else
        {
            ralsei.follow = true;
            scr_pathfind_to_point("susie", choose(1, 2, 9, 10), 6, 2);
        }
        suwalk = 1;
    }
    if (pippins.grabbed)
    {
        textcomplete = true;
        texttimer = 999;
        drawtext = false;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (visitinit == 0)
        {
            visitinit = 1;
            shopstring = string1;
            if (!i_ex(lancer))
                shopstring = string4;
        }
    }
    if (shopcon == 0 && sutalk == 0)
    {
        if (i_ex(lancer))
        {
            if (textcomplete)
            {
                sutalk = 1;
                var _sutalk = stringsetloc("Lancer!!!", "obj_b2savelancer_slash_Step_0_gml_70_0");
                scr_couchtalk(_sutalk, "susie", 2, 80);
            }
        }
    }
    if (sutalk < 6 && shopstring == string4 && textcomplete)
    {
        sutalk = 7;
        sutalktimer = 0;
    }
    if (sutalk == 7)
    {
        sutalktimer++;
        if (sutalktimer == 1)
        {
            su_real.sprite_index = su_real.rsprite;
            scr_resetgameshowcharacter_delay("susie", 80);
            var _sutalk = stringsetloc("Damn, I wanted to get two Lancers.", "obj_b2savelancer_slash_Step_0_gml_91_0");
            scr_couchtalk(_sutalk, "susie", 2, 70);
        }
        if (sutalktimer == 70 && global.flag[1022] == 0)
        {
            tenna.bounce = 1;
            var tetalk = stringsetloc("Two!? Not with this union breathing down my neck!", "obj_b2savelancer_slash_Step_0_gml_98_0");
            scr_couchtalk(tetalk, "tenna", 2, 100);
            snd_play_delay(snd_laughtrack_short_temp, 20);
        }
    }
    if (shopcon == 0 && !i_ex(lancer) && !bw_ex())
        shopcon = 1;
    if (shopcon == 1 && obj_board_inventory.lancer == true)
    {
        shopstring = "";
        shopcon = 2;
        scr_speaker("lancer");
        if (global.flag[1048] < 999)
        {
            msgsetloc(0, "HO HO^1! FRIENDSHIP SHOULDN'T BE BOUGHT.../", "obj_b2savelancer_slash_Step_0_gml_119_0");
            msgnextloc("BUT IF YOU HAVE TO^1, GOOD YOU DID IT DIRT CHEAP!/", "obj_b2savelancer_slash_Step_0_gml_120_0");
            msgnextloc("I'LL BE WAITING IN YOUR ITEMS FOR SOME CHEAP DIRT OF MY OWN./", "obj_b2savelancer_slash_Step_0_gml_121_0");
            msgnextloc("DIG^1, DIG!/%", "obj_b2savelancer_slash_Step_0_gml_122_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "HO HO^1! YOU BOUGHT ME WITHOUT EVEN WAITING FOR A SALE!!/", "obj_b2savelancer_slash_Step_0_gml_127_0");
            msgnextloc("THAT'S TRUE FRIENDSHIP!^1!/", "obj_b2savelancer_slash_Step_0_gml_128_0");
            msgnextloc("IF YOU EVER FIND YOURSELF STUCK IN THE MUD^1,/", "obj_b2savelancer_slash_Step_0_gml_129_0");
            msgnextloc("LET ME DIG YOU OUT!/%", "obj_b2savelancer_slash_Step_0_gml_130_0");
        }
        safe_delete(obj_board_grayregion);
        bw_make();
    }
    if (shopcon == 2)
        global.interact = 1;
    if (shopcon == 2 && !bw_ex())
    {
        shopcon = -1;
        scr_delay_var("shopcon", 3, 15);
    }
    if (shopcon == 3)
    {
        shopcon = 4;
        global.interact = 0;
        texttimer = 0;
        shopstring = string2;
        if (global.flag[1048] < 999)
            shopstring = string3;
    }
    if (i_ex(lancer))
    {
        var _cost = 999;
        var leftnine = false;
        var rightnine = false;
        with (obj_board_trigger)
        {
            if (extflag == "9-1")
            {
                if (place_meeting(x, y, obj_board_grayregion))
                    leftnine = true;
            }
            if (extflag == "9-2")
            {
                if (place_meeting(x, y, obj_board_grayregion))
                    rightnine = true;
            }
        }
        if (leftnine && rightnine)
            _cost = 9;
        if ((leftnine && !rightnine) || (!leftnine && rightnine))
            _cost = 99;
        lancer.cost = _cost;
    }
}
else
{
    suwalk = 0;
    timer = 0;
    texttimer = 0;
    visitinit = 0;
    textcomplete = false;
    if (sutalk == 7)
        sutalk = 999;
}
