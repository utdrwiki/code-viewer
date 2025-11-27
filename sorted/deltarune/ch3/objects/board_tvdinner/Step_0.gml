scr_gameshow_populatevars();
scr_board_populatevars();
if (active)
{
    if (con == 0)
        scr_depth_board();
    buyable = false;
    if (tvdinnerqty == -1)
    {
        scr_itemcheck_inventory_and_pocket(34);
        tvdinnerqty = itemcount;
    }
    cost = 20;
    if (tvdinnerqty == 1)
        cost = 50;
    if (tvdinnerqty == 2)
        cost = 100;
    if (tvdinnerqty >= 3)
        cost = 200;
    if (room == room_board_2)
        cost = 400;
    if (costfree)
        cost = 0;
    if (room == room_board_1)
    {
        if (obj_b1store.pointcount <= 10)
            cost = 10;
    }
    if (result == -1)
        result = scr_inventoryspace() + scr_pocketspace();
    if (result)
    {
        haveroom = true;
        freestring = stringsetloc("FREE", "obj_board_tvdinner_slash_Step_0_gml_30_0");
        mystring = stringsetloc("TVDINNER", "obj_board_tvdinner_slash_Step_0_gml_31_0");
        if (cost != 0)
            mystring += ("#" + string(cost));
        else
            mystring += ("#" + freestring);
    }
    else
    {
        haveroom = false;
        mystring = stringsetloc("REAL ITEMS#FULL", "obj_board_tvdinner_slash_Step_0_gml_38_0");
    }
    if (global.flag[1044] >= cost && haveroom)
        buyable = true;
    if (myinteract == 3)
    {
        if (buyable)
        {
            scr_board_score(-cost);
            global.interact = 1;
            myinteract = 4;
            con = 1;
        }
        else
        {
            myinteract = 0;
        }
    }
    if (myinteract > 3)
        mystring = "";
}
if (con == 1)
{
    var transitiontime = 12;
    var spintime = 1;
    var spindelay = 3;
    timer++;
    if (timer == 1)
    {
        depth = kris.depth - 1;
        with (kris)
        {
            fun = 1;
            sprite_index = dsprite;
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
            scr_delay_var("sprite_index", dsprite_item, spintime * 10);
            scr_delay_var("facing", 0, spintime * 10);
        }
        scr_lerpvar("x", x, kris.x + xoff, transitiontime, 2, "in");
        scr_lerpvar("y", y, (kris.y + yoff) - 40, transitiontime, 2, "out");
    }
    if (timer == (1 + transitiontime))
    {
        snd_play(snd_link_sfx_itemget);
        makestars = true;
        scr_itemget(34);
        scr_speaker("no_name");
        msgsetloc(0, "YOU BOUGHT \\cYTVDINNER\\cW^1! FEEL FREE TO USE IT IN BATTLE!!/%", "obj_board_tvdinner_slash_Step_0_gml_114_0");
        bw_make();
        timer = 0;
        con = 2;
    }
}
if (con == 2 && !bw_ex())
{
    var flytime1 = 15;
    var flytime2 = 25;
    timer++;
    if (timer == 1)
    {
        scr_lerpvar("y", y, board_tiley(-1), flytime1, 2, "in");
        scr_delay_var("image_alpha", 0, flytime1 + 1);
    }
    if (timer == (1 + flytime1))
    {
        kris.facing = 0;
        kris.fun = 0;
        snd_play(snd_wing);
        item = scr_marker_ext(camerax() + 640, cameray() + 240, spr_itemBag, 2, 2, 0, 2, c_white, obj_mainchara.depth + 1);
        with (item)
        {
            scr_jump_to_point(obj_mainchara.x + 8, obj_mainchara.y + 8, 20, flytime2, true);
            snd_play_delay(snd_item, flytime2, 1, 1);
            scr_doom(id, flytime2 + 1);
        }
    }
    if (timer == (1 + flytime1 + flytime2))
    {
        global.interact = 0;
        instance_destroy();
    }
}
if (makestars == true)
{
    var stardepth = kris.depth + 1;
    makestarstimer++;
    if ((makestarstimer % 2) == 0)
    {
        var star = scr_board_marker(x - xoff, y - yoff, spr_board_star_8px, 0, stardepth);
        with (star)
        {
            direction = other.makestarstimer * 20;
            speed = 5;
            friction = 0.25;
            image_index = irandom(3);
            scr_doom(id, random_range(13, 16));
        }
        star = scr_board_marker(x - xoff, y - yoff, spr_board_star_8px, 0, stardepth);
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
if (!active)
{
    result = -1;
    tvdinnerqty = -1;
}
