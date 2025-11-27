scr_board_populatevars();
scr_gameshow_populatevars();
buffer--;
if (myinteract == 3)
{
    global.interact = 1;
    if (obj_board_inventory.qcount >= 2)
    {
        myinteract = 20;
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "TV TOWER^1! THE BEST DUNGEON!/", "obj_board_b3topdoor_slash_Step_0_gml_19_0");
        msgnextloc("NO SHOES^1,\nNO Q'S^1,\nNO SERVICE!/%", "obj_board_b3topdoor_slash_Step_0_gml_20_0");
        bw_make();
        myinteract = 4;
    }
}
if (myinteract == 4 && bw_ex() && i_ex(obj_writer) && laugh == 0)
{
    if (obj_writer.msgno == 1 && obj_writer.reachedend == true)
    {
        laugh = 1;
        tenna.bounce = 1;
        var tetalk = stringsetloc("Haha, that's a good one!", "obj_board_b3topdoor_slash_Step_0_gml_36_0");
        scr_couchtalk(tetalk, "tenna", 2, 90);
    }
}
if (myinteract == 4 && !bw_ex())
{
    myinteract = 0;
    global.interact = 0;
    buffer = 3;
}
if (myinteract == 20)
{
    global.interact = 0;
    with (obj_mainchara_board)
        controlled = 0;
    scr_pathfind_to_point("kris", 5.5, 4.5, 2);
    scr_pathfind_to_point("susie", 6.5, 5, 2);
    scr_pathfind_to_point("ralsei", 4.5, 5, 2);
    myinteract++;
}
if (myinteract == 21 && scr_board_checklocation("kris", board_tilex(5.5), board_tiley(4.5), 1) && scr_board_checklocation("susie", board_tilex(6.5), board_tiley(5), 1) && scr_board_checklocation("ralsei", board_tilex(4.5), board_tiley(5), 1))
{
    timer = 0;
    myinteract = 22;
}
if (myinteract == 22)
{
    timer++;
    if (timer == 10)
    {
        kris.fun = 1;
        kris.sprite_index = spr_board_kris_walk_up_armsup;
    }
    var basetime = 40;
    if (timer == 20)
    {
        obj_board_inventory.qcount = 1;
        snd_play_x(snd_item, 1, 0.9);
        q1 = scr_board_marker(88, 74, spr_board_inventory_q, 0, 5000, 2);
        with (q1)
        {
            scr_lerpvar("x", x, 340, basetime + 10, 2, "out");
            scr_lerpvar("y", y, 262, basetime + 10, -1, "out");
            scr_delay_var("depth", 900000, 5);
        }
    }
    if (timer == 30)
    {
        obj_board_inventory.qcount = 0;
        snd_play_x(snd_item, 1, 1);
        q2 = scr_board_marker(88, 74, spr_board_inventory_q, 0, 5000, 2);
        with (q2)
        {
            scr_lerpvar("x", x, 270, basetime, 2, "out");
            scr_lerpvar("y", y, 262, basetime, -1, "out");
            scr_delay_var("depth", 900000, 5);
        }
    }
    if (timer == (basetime + 60))
    {
        snd_play_x(snd_board_mantle_dash, 0.8, 1.2);
        snd_play_x(snd_board_mantle_dash, 0.4, 1.4);
        with (q2)
        {
            scr_lerpvar("x", x, 320, 10, 2, "out");
            scr_lerpvar("y", y, 150, 10, 2, "in");
        }
        with (q1)
        {
            scr_lerpvar("x", x, 288, 10, 2, "out");
            scr_lerpvar("y", y, 150, 10, 2, "in");
        }
    }
    if (timer == (basetime + 60 + 10))
    {
        snd_play_x(snd_board_damage, 1, 1.2);
        snd_play_x(snd_board_splash, 0.8, 1.4);
        snd_play_x(snd_board_splash, 0.8, 0.8);
        snd_play_x(snd_board_mantle_dash, 0.5, 1.6);
        safe_delete(q1);
        safe_delete(q2);
        with (scr_board_marker(1440, 384, spr_board_b3brokenwindows, 0, 999998, 2))
            setxy_board(x, y);
        instance_create(320, 148, obj_board_smokepuff);
        instance_create(288, 148, obj_board_smokepuff);
        kris.fun = 0;
        kris.facing = 2;
        myinteract = 99;
        kris.controlled = 1;
        ralsei.follow = 0;
        with (obj_board_npc)
        {
            if (extflag == "b3tenna")
            {
                read = 0;
                extflag = "b3doorsdone";
            }
        }
    }
}
if (myinteract == 99)
{
    if (place_meeting(x, y + 1, obj_mainchara_board))
    {
        mus_volume(global.currentsong[1], 0, 30);
        myinteract++;
        global.interact = 1;
        scr_quickwarp(896, 1600, 1072, 1824);
        snd_play(snd_board_escaped);
    }
}
if (i_ex(q1))
{
    with (q1)
    {
        if (depth == 900000)
        {
            if ((other.timer % 4) == 0)
            {
                var star = scr_board_marker(x + irandom_range(-8, 8), y + 14, spr_board_star_8px, 0, depth, 2);
                star.image_index = choose(0, 1, 2);
                scr_doom(star, 12);
                star.gravity = 0.35;
                star.hspeed = random_range(1, -1);
            }
        }
    }
}
if (i_ex(q2))
{
    with (q2)
    {
        if (depth == 900000)
        {
            if ((other.timer % 4) == 0)
            {
                var star = scr_board_marker(x + irandom_range(-8, 8), y + 14, spr_board_star_8px, 0, depth, 2);
                star.image_index = choose(0, 1, 2);
                scr_doom(star, 12);
                star.gravity = 0.35;
                star.hspeed = random_range(1, -1);
            }
        }
    }
}
