scr_board_populatevars();
scr_gameshow_populatevars();
if (active)
{
    if (firstvisitfix == 0 && obj_board_camera.con == 0)
    {
        firstvisitfix = 1;
        kris.controlled = 0;
        susie.controlled = 1;
        ralsei.follow = 1;
        battlecon = 0;
    }
    if (battlecon == 0 && obj_board_camera.con == 0)
    {
        timer++;
        if (timer == 5)
        {
            var sutalk = stringsetloc("Look out, Kris! Enemy!", "obj_b2enemysquabble_slash_Step_0_gml_26_0");
            scr_couchtalk(sutalk, "susie", 2, 70);
            scr_pathfind_to_point("kris", 5.5, 4, 1);
            battlecon = 1;
            timer = 0;
        }
    }
}
if (battlecon == 2)
{
    if (global.fighting == true)
        battlecon = 3.1;
}
if (battlecon == 3.1)
{
    if (global.fighting == false)
    {
        if (global.boardbattleresult == "won")
        {
            if (!i_ex(obj_gameshow_battlemanager))
                battlecon = 3.9;
        }
        else if (!i_ex(obj_gameover_board) && !i_ex(obj_gameshow_battlemanager) && !i_ex(obj_gameover_minigame))
        {
            battlecon = 3.9;
        }
    }
}
if (battlecon == 3.9)
{
    with (susie)
    {
        if (grabbed != -4)
        {
            grab = 0;
            fun = 0;
        }
    }
    battlecon = 4;
    timer = 0;
}
if (battlecon == 4)
{
    timer++;
    var delay = 40;
    if (timer == 5)
    {
        global.flag[1020] = 0;
        var sutalk = stringsetloc("FINE. I'll fix the controllers.", "obj_b2enemysquabble_slash_Step_0_gml_59_0");
        subub = scr_couchtalk(sutalk, "susie", 2, 90);
    }
    if (timer == (65 + delay))
    {
        su_real.fun = 1;
        su_real.sprite_index = spr_susie_walk_up_dw;
        kr_real.sprite_index = kr_real.usprite;
        ra_real.sprite_index = ra_real.usprite;
        with (su_real)
        {
            image_speed = 0.25;
            scr_move_to_point_over_time(294, 288, 16);
        }
    }
    if (timer == (81 + delay))
        su_real.sprite_index = spr_susieu_dark_benddown;
    if (timer == (87 + delay))
    {
        susie.canfreemove = 0;
        scr_board_forcethrow();
        susie.facing = 0;
        scr_shakeobj(su_real, 8);
        snd_play(snd_wing);
        global.flag[1020] = 1;
    }
    if (timer == (93 + delay))
    {
        susie.canfreemove = 1;
        scr_shakeobj(su_real, 8);
        snd_play(snd_equip);
    }
    if (timer == (99 + delay))
    {
        with (su_real)
        {
            sprite_index = usprite;
            image_index = 0;
            image_speed = 0;
            snd_play(snd_wing);
        }
        obj_ch3_gameshow.wires.sprite_index = spr_controllerwires_rks;
    }
    if (timer == (105 + delay))
    {
        with (su_real)
        {
            image_speed = 0.25;
            sprite_index = dsprite;
            scr_move_to_point_over_time(140, 392, 16);
        }
    }
    if (timer == (122 + delay))
    {
        with (su_real)
        {
            image_speed = 0;
            sprite_index = usprite;
            scr_shakeobj(id, 4);
        }
        battlecon = 5;
        timer = 0;
        with (obj_mainchara_board)
            controlled = 0;
        with (obj_mainchara_board)
            canfreemove = true;
        ralsei.follow = false;
        scr_pathfind_end("ralsei");
        scr_pathfind_end("susie");
        scr_pathfind_end("kris");
        susie.controlled = 1;
    }
}
if (battlecon == 5)
{
    timer++;
    if (timer == 5)
        scr_pathfind_to_point("kris", 5.5, 5, 2);
    if (timer == 15)
    {
        var ratalk = stringsetloc("Thank you very...", "obj_b2enemysquabble_slash_Step_0_gml_142_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
    }
    if (timer == 25)
        scr_play_recording("kris", "0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0R0R0R0R0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0R0R0W0W0W0W0W0W0W0W0W0W0W0W0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0W0W0W0W0W0W0D0D0D0D0D0D0D");
    if (timer == 80)
    {
        var ratalk = stringsetloc("W... wait a second..", "obj_b2enemysquabble_slash_Step_0_gml_151_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
    }
    if (timer == 120)
        scr_play_recording("kris", "0W0W0W0W0W0W0W0W0L0L0L0LDU0LDU0DU0DU0RD0R0R0R0R0RU0U0LU0L0L0LD0D0RD0RD0LR0LR0LR0R0RD0RD0LD0L0L0R0R0LR0L0L0LR0RU0RU0LRU0LU0LU0LU0L0L0LD0D0D0D0LRD0LR0LR0R0LR0LR0L0LRU0RU0RU0LRU0LU0LU0LRU0RU0LR0LR0LR0LRDU0RD0RD0RD0LD0LD0L0L0RDU0RDU0LRDU0L0L0LR0R0R0W0W0W0W");
    if (timer == 140)
    {
        var ratalk = stringsetloc("S-Susie! Change me back!!", "obj_b2enemysquabble_slash_Step_0_gml_161_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
    }
    if (timer == 170)
    {
        su_real.sprite_index = spr_susie_laugh_dw;
        su_real.image_xscale = -2;
        su_real.x += 44;
        su_real.image_speed = 0.25;
        snd_play(snd_suslaugh);
    }
    if (timer == 235)
    {
        su_real.image_speed = 0;
        timer = 0;
        battlecon = 6;
    }
}
if (battlecon == 6)
{
    timer++;
    if (timer == 5)
    {
        scr_resetgameshowcharacter("susie");
        var sutalk = stringsetloc("C'mon, just for a bit. It'll be fun.", "obj_b2enemysquabble_slash_Step_0_gml_185_0");
        scr_couchtalk(sutalk, "susie", 2, 80);
    }
    if (timer == 15)
        scr_pathfind_to_point("kris", 6, 0, 0);
    if (timer == 85)
    {
        var ratalk = stringsetloc("...", "obj_b2enemysquabble_slash_Step_0_gml_194_0");
        scr_couchtalk(ratalk, "ralsei", 2, 60);
        battlecon = 7;
        timer = 0;
    }
}
if (battlecon == 7)
{
    if (scr_board_checklocation("kris", 6, 0, 4))
    {
        timer = 0;
        battlecon = 8;
    }
}
if (battlecon == 8)
{
    timer++;
    if (timer == 15)
    {
        var ratalk = stringsetloc("Umm, Kris, don't you want your controller back?", "obj_b2enemysquabble_slash_Step_0_gml_218_0");
        scr_couchtalk(ratalk, "ralsei", 2, 9999);
    }
    if (timer == 75)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("You can#have a#turn", "obj_b2enemysquabble_slash_Step_0_gml_228_0");
        global.choicemsg[1] = stringsetloc("Let's all#go back#to normal", "obj_b2enemysquabble_slash_Step_0_gml_229_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgset(0, "\\C2");
        d_make();
        battlecon = 9;
    }
}
if (battlecon == 9 && global.choice != -1)
{
    k_d();
    safe_delete(obj_couchwriter);
    global.interact = 0;
    timer = 0;
    if (global.choice == 0)
    {
        battlecon = 10;
        global.flag[1190] = 0;
    }
    if (global.choice == 1)
    {
        battlecon = 11;
        global.flag[1190] = 1;
    }
}
if (battlecon == 10)
{
    timer++;
    if (timer == 10)
    {
        var ratalk = stringsetloc("Well, if Kris says it's okay...", "obj_b2enemysquabble_slash_Step_0_gml_210_0");
        scr_couchtalk(ratalk, "ralsei", 2, 70);
    }
    if (timer == 60)
    {
        with (obj_mainchara_board)
            controlled = false;
        kris.facing = 2;
        kris.controlled = true;
        global.interact = 1;
        obj_board_camera.shift = "up";
        battlecon = 15;
        timer = 0;
    }
}
if (battlecon == 11)
{
    timer++;
    if (timer == 1)
    {
        su_real.sprite_index = spr_susie_walk_right_dw_unhappy;
        var sutalk = stringsetloc("Seriously? You guys are no fun.", "obj_b2enemysquabble_slash_Step_0_gml_283_0");
        scr_couchtalk(sutalk, "susie", 2, 70);
    }
    if (timer == 70)
    {
        with (obj_couchwriter)
            instance_destroy();
        timer = 0;
        battlecon = 12;
    }
}
if (battlecon == 12)
{
    timer++;
    var delay = 1;
    if (timer == 6)
    {
        global.flag[1020] = 0;
        su_real.fun = 1;
        su_real.sprite_index = spr_susie_walk_up_dw;
        kr_real.sprite_index = kr_real.usprite;
        ra_real.sprite_index = ra_real.usprite;
        kris.cantleave = true;
        with (su_real)
        {
            image_speed = 0.25;
            scr_move_to_point_over_time(294, 288, 16);
        }
    }
    if (timer == 22)
        su_real.sprite_index = spr_susieu_dark_benddown;
    if (timer == 28)
    {
        susie.canfreemove = 0;
        scr_board_forcethrow();
        susie.facing = 0;
        scr_shakeobj(su_real, 8);
        snd_play(snd_wing);
        global.flag[1020] = 1;
    }
    if (timer == 34)
    {
        susie.canfreemove = 1;
        scr_shakeobj(su_real, 8);
        snd_play(snd_equip);
    }
    if (timer == 40)
    {
        with (su_real)
        {
            sprite_index = usprite;
            image_index = 0;
            image_speed = 0;
            snd_play(snd_wing);
        }
        obj_ch3_gameshow.wires.sprite_index = spr_controllerwires_ksr_tangle;
    }
    if (timer == 46)
    {
        with (su_real)
        {
            image_speed = 0.25;
            sprite_index = dsprite;
            scr_move_to_point_over_time(140, 392, 16);
        }
    }
    if (timer == 63)
    {
        with (su_real)
        {
            image_speed = 0;
            sprite_index = usprite;
            scr_shakeobj(id, 4);
        }
        battlecon = 13;
        timer = 0;
        with (obj_mainchara_board)
            controlled = 0;
        with (obj_mainchara_board)
            canfreemove = true;
        ralsei.follow = false;
        scr_pathfind_end("ralsei");
        scr_pathfind_end("susie");
        scr_pathfind_end("kris");
        kris.controlled = 1;
    }
}
if (battlecon == 13)
{
    kris.cantleave = false;
    battlecon = 14;
}
if (con == 72)
{
    if (suwalk == 0 && obj_board_camera.con == 0 && active)
    {
        suwalktimer++;
        susie.sleepy = true;
        if (suwalktimer == 1)
        {
            ralsei.follow = true;
            debug_print("follow");
        }
        if (suwalktimer == 16)
            scr_pathfind_to_point("susie", 5, 4, 0);
    }
}
if (!active)
{
    suwalk = 0;
    suwalktimer = 0;
}
if (battlecon == 1)
{
    if (global.fighting == true)
    {
        scr_pathfind_end("kris");
        ralsei.follow = false;
        battlecon = 2;
    }
}
if (battlecon == 2 && global.fighting == false)
{
    battlecon = 3;
    with (obj_mainchara_board)
        controlled = 0;
}
if (battlecon == 14 && active)
{
    timer++;
    if (timer == 1)
    {
        susie.sleepy = true;
        scr_pathfind_to_point("ralsei", 6, 1, 2);
        var ratalk = stringsetloc("There! Now everything's the right way!", "obj_b2enemysquabble_slash_Step_0_gml_429_0");
        scr_couchtalk(ratalk, "ralsei", 2, 70);
        obj_b2enemysquabble.makePathBlockers = 1;
    }
    if (timer == 70)
    {
        var ratalk = stringsetloc("... right, Kris...?", "obj_b2enemysquabble_slash_Step_0_gml_434_0");
        scr_couchtalk(ratalk, "ralsei", 2, 70);
        battlecon = 15;
    }
}
if (active && battlecon == 15 && obj_board_camera.con == 0)
{
    if (!ralsei.follow)
    {
        if (point_distance(ralsei.x, ralsei.y, kris.x, kris.y) < 32)
        {
            scr_pathfind_end("ralsei");
            ralsei.follow = true;
            with (ralsei)
                scr_board_caterpillar_interpolate();
        }
    }
}
if (!active)
{
    if (battlecon >= 14)
    {
        timer = 0;
        battlecon = 15;
        con = 72;
        suwalktimer = 0;
        suwalk = 0;
    }
}
if (makePathBlockers == 1)
{
    makePathBlockers = 2;
    with (obj_b2d_centertrigger)
    {
        instance_create(x, y, obj_board_blockpath);
        instance_destroy();
    }
}
