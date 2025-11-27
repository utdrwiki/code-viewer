scr_board_populatevars();
scr_gameshow_populatevars();
if (myinteract < 3.2)
    scr_depth_board();
if (init == 0)
{
    sprite_index = idle;
    init = 1;
}
if (myinteract == 3)
{
    myinteract = 4;
    if (global.flag[1017] == 1)
    {
        scr_speaker("no_name");
        msgsetloc(0, "WITHOUT THE SHINE OF LOVE TO GUIDE ME.../", "obj_board_sadfriendo_slash_Step_0_gml_14_0");
        msgnextloc("MY LIFE IS LOST AT SEA^1, WITH THE RAIN^1, LIKE TEARS^1,/", "obj_board_sadfriendo_slash_Step_0_gml_15_0");
        msgnextloc("AS SALTY AS THE OCEAN.../", "obj_board_sadfriendo_slash_Step_0_gml_16_0");
        msgnextloc("WHAT? YOU HAVE SOMEONE TO SHOW ME...?/%", "obj_board_sadfriendo_slash_Step_0_gml_25_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "WITHOUT THE RAIN OF LOVE TO NOURISH ME.../", "obj_board_sadfriendo_slash_Step_0_gml_21_0");
        msgnextloc("MY LIFE IS LOST AT SEA^1, BURNING IN THE HOT SUN./", "obj_board_sadfriendo_slash_Step_0_gml_22_0");
        msgnextloc("OH^1, WOE..^1. NO SPF CAN SAVE ME FROM MYSELF.../", "obj_board_sadfriendo_slash_Step_0_gml_23_0");
        msgnextloc("WHAT? YOU HAVE SOMEONE TO SHOW ME...?/%", "obj_board_sadfriendo_slash_Step_0_gml_28_0");
    }
    var d = bw_make();
    d.side = 1;
    myinteract = 3.1;
    d.stay = 85;
}
if (myinteract == 3.1 && !bw_ex())
{
    tenna.bounce = 1;
    var tetalk = stringsetloc("Yes! Close your eyes!", "obj_board_sadfriendo_slash_Step_0_gml_35_0");
    scr_couchtalk(tetalk, "tenna", 2, 70);
    myinteract = 3.2;
    buff = 0;
}
if (myinteract == 3.2)
{
    buff++;
    if (button3_h())
        c_held++;
    if (c_held > 5 || (button1_p() && buff > 2))
    {
        safe_delete(obj_couchwriter);
        scr_doom(191, 15);
    }
}
if (myinteract == 3.2 && !i_ex(obj_couchwriter))
{
    if (global.flag[1017] == 0)
    {
        scr_speaker("lanino");
        msgsetloc(0, "OKAY^1, I'LL TRY ANYTHING ONCE./%", "obj_board_sadfriendo_slash_Step_0_gml_72_0");
    }
    else
    {
        scr_speaker("elnina");
        msgsetloc(0, "OKAY^1, I'LL TRY ANYTHING ONCE./%", "obj_board_sadfriendo_slash_Step_0_gml_59_0");
    }
    var d = bw_make();
    d.side = 1;
    d.skip = 1;
    myinteract = 4;
    if (global.flag[1017] == 1)
        idle = 4193;
    else
        idle = 1544;
}
var transitiontime = 12;
var spintime = 1;
var spindelay = 3;
var player = kris;
if (myinteract == 4 && !bw_ex())
{
    timer++;
    if (timer == 5)
    {
        myinteract = 5;
        con = 3;
        timer = 0;
    }
}
if (con == 3)
{
    scr_depth_board();
    global.interact = 1;
    if (i_ex(player))
    {
        with (player)
        {
            fun = 1;
            sprite_index = dsprite;
            if (other.playerspin)
            {
                scr_delay_var("sprite_index", lsprite, spintime * 3);
                scr_delay_var("facing", 3, spintime * 3);
                scr_delay_var("sprite_index", usprite, spintime * 4);
                scr_delay_var("facing", 2, spintime * 4);
                scr_delay_var("sprite_index", rsprite, spintime * 5);
                scr_delay_var("facing", 1, spintime * 5);
                scr_delay_var("sprite_index", dsprite, spintime * 6);
                scr_delay_var("facing", 0, spintime * 6);
                scr_delay_var("sprite_index", lsprite, spintime * 7);
                scr_delay_var("facing", 3, spintime * 7);
                scr_delay_var("sprite_index", usprite, spintime * 8);
                scr_delay_var("facing", 2, spintime * 8);
                scr_delay_var("sprite_index", rsprite, spintime * 9);
                scr_delay_var("facing", 1, spintime * 9);
            }
            scr_delay_var("sprite_index", dsprite_item, spintime * 10);
            scr_delay_var("facing", 0, spintime * 10);
        }
        scr_lerpvar("x", x, player.x, transitiontime, 2, "in");
        scr_lerpvar("y", y, player.y - 32, transitiontime, 2, "out");
    }
    timer = 0;
    con = 4;
}
if (con == 4)
{
    scr_depth_board();
    timer++;
    if (timer == 12)
    {
        snd_play(snd_link_sfx_itemget);
        substring = stringsetloc("LANINO", "obj_board_sadfriendo_slash_Step_0_gml_138_0");
        if (global.flag[1017] == 1)
            substring = stringsetloc("ELNINA", "obj_board_sadfriendo_slash_Step_0_gml_139_0");
        var yougot = stringsetsubloc("YOU GOT \\cY~1\\cW/%", substring, "obj_board_sadfriendo_slash_Step_0_gml_141_0");
        msgset(0, yougot);
        bw_make();
        con = 4.5;
        makestars = true;
    }
}
if (con == 4.5 && !bw_ex())
{
    makestars = false;
    depth = 5000;
    var slot = 3;
    desigx = obj_board_inventory.x + 8;
    desigy = ((obj_board_inventory.y + 10 + (48 * slot)) - 10 - 4) + 32;
    scr_lerpvar("x", x, desigx, 20, 2, "in");
    scr_lerpvar("y", y, desigy, 20, 2, "out");
    con = 5;
}
if (con == 5)
{
    if (x == desigx && y == desigy)
    {
        obj_board_inventory.ninfriendo = 1;
        visible = false;
        player.fun = 0;
        snd_play(snd_item);
        global.interact = 0;
        timer = 0;
        con = 6;
    }
}
if (con == 6)
{
    timer++;
    instance_destroy();
}
if (con > 2 && con < 5)
    depth = player.depth;
if (makestars == true)
{
    var stardepth = player.depth + 1;
    makestarstimer++;
    if ((makestarstimer % 2) == 0)
    {
        var star = scr_board_marker(x, y, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = other.makestarstimer * 20;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
        star = scr_board_marker(x, y, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = (other.makestarstimer * 20) + 180;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
    }
    if (makestarstimer >= 16)
        makestars = false;
}
if (dopose > 0)
{
    sprite_index = pose;
    dopose--;
}
else
{
    sprite_index = idle;
}
