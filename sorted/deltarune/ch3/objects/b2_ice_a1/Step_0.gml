scr_board_populatevars();
scr_gameshow_populatevars();
truactive = obj_b2_ice_a1.active + obj_b2_ice_b1.active + obj_b2_ice_c1.active + obj_b2_ice_d1.active + obj_b2_ice_e1.active + obj_b2_ice_a2.active + obj_b2_ice_b2.active + obj_b2_ice_c2.active + obj_b2_ice_d2.active + obj_b2_ice_e2.active;
if (truactive)
{
    if (con == 0 && kris.boat == false)
        con = 1;
    if (con == 1)
    {
        if (obj_b2_ice_e1.active && obj_board_camera.con == 0)
        {
            timer++;
            if (timer == 1)
            {
                var sutalk = stringsetloc("...a tree?", "obj_b2_ice_a1_slash_Step_0_gml_56_0");
                scr_couchtalk(sutalk, "susie", 2, 120);
                con = 2;
                timer = 0;
            }
        }
    }
}
if (con == 1.5 && obj_board_camera.shift != "none")
    con = 2;
if (con == 2)
{
    var trig = 0;
    with (obj_board_trigger)
    {
        if (extflag == "b2leaveice")
        {
            if (place_meeting(x, y, obj_mainchara_board))
                trig = 1;
        }
    }
    if (trig == 1)
        con = 4;
}
if (con == 4)
{
    var dialoguetime = 90;
    timer++;
    if (timer == 15)
    {
        with (obj_b2ferntalk)
            convocon = 99999;
        global.flag[1024] = 1;
        var sutalk = stringsetloc("Damn, wish something#was there.", "obj_b2_ice_a1_slash_Step_0_gml_90_0");
        scr_couchtalk(sutalk, "susie", 2, 90);
    }
    if (timer == 105)
    {
        var ratalk = stringsetloc("... I don't#know...", "obj_b2_ice_a1_slash_Step_0_gml_98_0");
        scr_couchtalk(ratalk, "ralsei", 2, 90);
    }
    if (timer == 195)
    {
        con = 5;
        timer = 0;
    }
}
if (con == 5)
{
    var trig = 0;
    with (obj_board_boat)
    {
        if (engaged)
            trig++;
    }
    if (trig > 0)
        con = 6;
}
if (con == 6)
{
    timer++;
    if (timer == 80)
    {
        var ratalk = stringsetloc("I feel kind#of... glad we're#going back.", "obj_b2_ice_a1_slash_Step_0_gml_107_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
    }
    if (timer == 160)
    {
        su_real.sprite_index = spr_susie_walk_right_dw;
        var sutalk = stringsetloc("What, don't#like the cold?", "obj_b2_ice_a1_slash_Step_0_gml_115_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (timer == 240)
    {
        ra_real.sprite_index = spr_ralsei_walk_left;
        var ratalk = stringsetloc("... I guess...#not. Haha.", "obj_b2_ice_a1_slash_Step_0_gml_123_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
    }
    if (timer == 320)
    {
        su_real.sprite_index = spr_susie_walk_up_dw;
        var sutalk = stringsetloc("Just cool thinking#what might've#been there.", "obj_b2_ice_a1_slash_Step_0_gml_131_0");
        scr_couchtalk(sutalk, "susie", 2, 100);
    }
    if (timer == 420)
    {
        su_real.sprite_index = spr_susie_walk_right_dw;
        var sutalk = stringsetloc("A little past... what would we could see.", "obj_b2_ice_a1_slash_Step_0_gml_139_0");
        scr_couchtalk(sutalk, "susie", 2, 100);
    }
    if (timer == 480)
    {
        scr_couchtalk("...", "ralsei", 2, 40);
        ra_real.sprite_index = spr_ralsei_head_down_sad_left;
    }
    if (timer == 560)
    {
        su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
        var sutalk = stringsetloc("... were you#scared?", "obj_b2_ice_a1_slash_Step_0_gml_155_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (timer == 640)
    {
        ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
        var ratalk = stringsetloc("I just didn't know... what was over there.", "obj_b2_ice_a1_slash_Step_0_gml_163_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
    }
    if (timer == 720)
    {
        ra_real.sprite_index = spr_ralsei_walk_left_sad;
        var ratalk = stringsetloc("It could've been... trouble.", "obj_b2_ice_a1_slash_Step_0_gml_171_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
    }
    if (timer == 800)
    {
        su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
        var sutalk = stringsetloc("Like, if Tenna#caught us?", "obj_b2_ice_a1_slash_Step_0_gml_179_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (timer == 880)
    {
        scr_couchtalk("...", "ralsei", 2, 40);
        ra_real.sprite_index = spr_ralsei_walk_up_sad;
    }
    if (timer == 920)
    {
        su_real.sprite_index = spr_susie_walk_right_dw;
        var sutalk = stringsetloc("Well, we're headed back now, 'k?", "obj_b2_ice_a1_slash_Step_0_gml_195_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (timer == 1000)
    {
        ra_real.sprite_index = spr_ralsei_left;
        var ratalk = stringsetloc("... right! Let's finish the game!", "obj_b2_ice_a1_slash_Step_0_gml_203_0");
        scr_couchtalk(ratalk, "ralsei", 2, 80);
        global.flag[1024] = 0;
    }
    if (killthis || timer == 1080)
    {
        con++;
        global.flag[1024] = 0;
        scr_resetgameshowcharacter("ralsei");
        scr_resetgameshowcharacter("susie");
        debug_print("cut this off!");
        debug_message("this is timer: " + string(timer));
        timer = 0;
    }
}
if (active == 1)
{
    if (boated == false && kris.boat == true)
        boated = true;
    if (boated == true && kris.boat == false)
    {
        suwalk = 0;
        suwalktimer = 0;
        boated = false;
    }
    if (suwalk == 0 && obj_board_camera.con == 0 && kris.boat == false)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer == 15)
        {
            if (susie.x > 320)
                scr_pathfind_to_point("susie", 160, 272, 1);
            else
                scr_pathfind_to_point("susie", 384, 192, 0);
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
