if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
if (susie == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.susie = id;
    }
}
if (ralsei == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
            other.ralsei = id;
    }
}
if (init == 0)
{
    if (i_ex(obj_board_tree_static))
    {
        var image_ind = obj_board_tree_static.image_index;
        tree[0] = instance_create(x + 128, y + 192, obj_board_tree_static);
        tree[1] = instance_create(x + 160, y + 192, obj_board_tree_static);
        tree[2] = instance_create(x + 128, y + -32, obj_board_tree_static);
        tree[3] = instance_create(x + 160, y + -32, obj_board_tree_static);
        tree[4] = instance_create(x - 32, y + 64, obj_board_tree_static);
        tree[5] = instance_create(x - 32, y + 96, obj_board_tree_static);
        for (var i = 0; i < array_length(tree); i++)
            tree[i].image_index = image_ind;
        init = 1;
    }
}
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        con = 1;
        if (visitcon == 0)
            visitcon = 1;
    }
    if (susiewalkcon == 0 && obj_board_camera.con == 0)
    {
        scr_pathfind_end("ralsei");
        scr_pathfind_end("susie");
        ralsei.follow = true;
        var enemcount = 0;
        with (obj_chaseenemy_board)
        {
            if (scr_board_onscreen())
                enemcount++;
        }
        if (enemcount == 0)
        {
            susiewalkcon = 1;
            susietime = 0;
        }
    }
    if (susiewalkcon == 1)
    {
        var weedcount = 0;
        with (obj_board_grabbablegrass)
        {
            if (active)
            {
                weedcount++;
                show_debug_message_concat(weedcount, ": ", xstart, " , ", ystart);
            }
        }
        if (global.flag[1020] == 0)
            weedcount = 0;
        if (weedcount != 0)
        {
            susiewalkcon = 10;
        }
        else
        {
            scr_pathfind_to_point("susie", 5.5, 4, 0);
            susiewalkcon = 2;
        }
    }
    if (susiewalkcon == 2)
    {
        if (abs(susie.x - board_tilex(5.5)) < 4 && abs(susie.y - board_tiley(4)) < 4)
        {
            with (susie)
                setxy(board_tilex(5.5), board_tiley(4));
            scr_pathfind_end("susie");
            susie.facing = 0;
            susiewalkcon = 3;
        }
    }
    if (susiewalkcon == 3)
    {
        susiewalkcon++;
        susie.sleepy = true;
        scr_play_susie_recording("0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0RU0RU0RU0U0U0U0U0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0R0R0R0RU0RU0RU0U0U0U0U0U0U0U0U0U0U0U0LU0LU0L0L0L0L0L0L0L0L0L0L0L0LD0D0D0D0D0D0D0D0D0D0D0RD0R0R0R0R0R0R0R0R0RU0RU0RU0U0U0U0U0U0U0U0U0LU0L0L0L0L0L0L0L0L0LD0LD0LD0D0D0D0D0D0RD0RD0R0R0R0R0R0R0R0R0RU0RU0U0U0U0U0U0U0LU0LU0LU0L0L0L0L0L0L0LD0LD0D0D0D0D0D0RD0RD0RD0R0R0R0R0RU0RU0RU0U0U0LU0LU0L0L0LD0D0D0");
    }
    if (susiewalkcon == 10)
    {
        targ = instance_nearest(susie.x, susie.y, obj_board_grabbablegrass);
        if (i_ex(targ))
        {
            if (point_in_rectangle(targ.x, targ.y, board_tilex(0), board_tiley(0), board_tilex(11), board_tiley(7)))
            {
                scr_pathfind_to_point("susie", targ.x, targ.y, 0);
            }
            else
            {
                scr_pathfind_end("susie");
                targ = -4;
                debug_print("no target");
                susiewalkcon = 99;
                susie.sleepy = true;
                scr_play_susie_recording("0W");
            }
        }
        susietime = 0;
        susiewalkcon = 11;
    }
    if (susiewalkcon == 11)
    {
        if (instance_exists(targ))
        {
            if (abs(susie.x - targ.x) < 2 && abs(susie.y - targ.y) < 2)
            {
                scr_pathfind_end("susie");
                susiewalkcon = 12;
            }
        }
    }
    if (susiewalkcon == 12)
    {
        susietime++;
        if (susietime == 5)
            scr_play_susie_recording("0101");
        if (susietime == 30)
            susie.facing = 0;
        if (susietime == 60)
            susiewalkcon = 0;
    }
}
else
{
    con = 0;
    timer = 0;
    susiewalkcon = 0;
}
if (visitcon == 1)
{
    if (talkcon == 0)
    {
        talktimer++;
        if (talktimer >= 8)
            talkcon++;
    }
    if (talkcon == 1 && active)
    {
        with (obj_actor_tenna)
            bounce = 1;
        var tetalk = stringsetloc("Enemy!! Careful, brave heroes!!", "obj_b1enemy_slash_Step_0_gml_145_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
        talkcon++;
    }
    if (talkcon == 2)
    {
        if (obj_board_camera.con != 0)
        {
            if (obj_board_camera.shift == "right")
                debug_message("right");
            if (obj_board_camera.shift == "left")
                debug_message("left");
            visitcon = 200;
        }
    }
}
if (visitcon == 200)
{
    with (obj_actor_tenna)
        bounce = 1;
    var tetalk = stringsetloc("Wow, absolutely spineless, folks!!", "obj_b1enemy_slash_Step_0_gml_167_0");
    scr_couchtalk(tetalk, "tenna", 2);
    snd_play_delay(snd_laughtrack_short_temp, 15);
    visitcon = 201;
}
if (visitcon == 1 || visitcon == 201)
{
    if (i_ex(obj_battleback))
        visitcon = 300;
}
if (visitcon == 300)
{
    scr_delay_var("visitcon", visitcon + 1, 120);
    visitcon = -1;
}
if (visitcon == 301)
{
    if (!i_ex(obj_battleback) && global.boardbattleresult == "won" && !i_ex(obj_gameshow_battlemanager))
    {
        var tetalk = stringsetloc("A rousing battle! Mike! Give them a free tube yogurt!", "obj_b1enemy_slash_Step_0_gml_191_0");
        scr_couchtalk(tetalk, "tenna", 2, 120);
        snd_play_delay(snd_applause, 10);
        scr_delay_var("visitcon", visitcon + 1, 30);
        visitcon = -1;
    }
}
if (visitcon == 302)
{
    snd_play(snd_wing);
    var throwtime = 24;
    var yogurt = scr_dark_marker(-20, 380, spr_gameshow_yogurttube);
    with (yogurt)
    {
        depth = obj_caterpillarchara.depth + 100;
        vspeed = -24;
        gravity = 2;
        hspeed = 10;
        friction = 0.24;
        scr_doom(id, throwtime);
    }
    snd_play_delay(snd_item, throwtime);
    scr_var_delay("visitcon", 303, throwtime + 4);
    visitcon = -1;
}
if (visitcon == 303)
{
    var sutalk = stringsetloc("Sweet.", "obj_b1enemy_slash_Step_0_gml_222_0");
    scr_couchtalk(sutalk, "susie", 2, 60);
    visitcon++;
}
if (batcon == 0)
{
    if (x == 160 && y == 96)
    {
        if (global.fighting == true)
            batcon = 1;
    }
}
if (batcon == 1)
{
    if (global.fighting == false)
    {
        if (global.boardbattleresult == "won")
        {
            for (var i = 0; i < array_length(tree); i++)
                safe_delete(tree[i]);
            scr_board_gridreset();
            batcon = 2;
        }
        else
        {
            batcon = 0;
            printval("batcon");
        }
    }
}
