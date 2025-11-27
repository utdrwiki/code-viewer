if (myinteract == 3)
{
    keystouse = obj_board_inventory.keycount;
    if (keystouse > 4)
        keystouse = 4;
    holecount = array_length(key);
    debug_message("holecount=" + string(holecount));
    if (nokeyholes == false)
    {
        if (keystouse > 0)
            con = 10;
        else
            con = 2;
    }
    else
    {
        con = 90;
    }
    if (nokeyholes && !obj_board_inventory.sunmoonstone)
    {
        con = 90;
        keytimer = 14;
    }
    myinteract = 4;
}
if (con == 2)
{
    if (read == 0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "IT'S LOCKED./%", "obj_board_event_bigdoor_slash_Step_0_gml_34_0");
        read++;
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "IT'S STILL LOCKED./%", "obj_board_event_bigdoor_slash_Step_0_gml_40_0");
    }
    bw_make();
    con++;
}
if (con == 3 && !bw_ex())
{
    con = 0;
    myinteract = 0;
    global.interact = 0;
}
if (con == 10)
{
    var whichkey = 0;
    for (var i = 0; i < array_length(key); i++)
    {
        if (key[whichkey].x > key[i].x)
            whichkey = i;
    }
    instance_create(key[whichkey].x, key[whichkey].y, obj_board_smokepuff);
    with (key[whichkey])
        instance_destroy();
    array_delete(key, whichkey, 1);
    snd_play(snd_impact);
    keystouse--;
    holecount--;
    with (obj_board_inventory)
        keycount--;
    con++;
}
if (con == 11)
{
    if (keystouse <= 0)
    {
        con = 3;
    }
    else
    {
        keytimer = 0;
        con = 12;
    }
    if (holecount == 0)
    {
        keytimer = 0;
        nokeyholes = true;
        con = 90;
    }
}
if (con == 12)
{
    keytimer++;
    if (keytimer == 15)
        con = 10;
}
if (con == 90)
{
    if (obj_board_inventory.sunmoonstone == 0)
    {
        keytimer++;
        if (keytimer == 15)
        {
            scr_speaker("no_name");
            msgsetloc(0, "ONLY THE \\cYMOONCLOUD STONE\\cW REMAINS./%", "obj_board_event_bigdoor_slash_Step_0_gml_94_0");
            bw_make();
            con = 3;
        }
    }
    else
    {
        con = 90.5;
    }
}
if (con == 90.5)
{
    global.interact = 0;
    with (obj_mainchara_board)
    {
        controlled = false;
        follow = false;
        sleepy = false;
    }
    scr_pathfind_end("ralsei");
    scr_pathfind_end("susie");
    scr_play_recording("ralsei", "0W0W");
    scr_play_recording("susie", "0W0W");
    scr_pathfind_to_point("kris", 5.5, 4, 2);
    scr_pathfind_to_point("ralsei", 5, 5, 2);
    scr_pathfind_to_point("susie", 6, 5, 2);
    con = 90.6;
    timer = 0;
    failsafe = 0;
}
if (con == 90.6)
{
    var trig = 0;
    var krtrig = 0;
    if (scr_board_checklocation("kris", 5.5, 4, 2))
        krtrig = 1;
    if (scr_board_checklocation("ralsei", 5, 5, 2))
        trig++;
    if (scr_board_checklocation("susie", 6, 5, 2))
        trig++;
    if (krtrig)
    {
        var movecheck = 0;
        with (obj_mainchara_board)
        {
            if (!is_moving)
                movecheck++;
        }
        if (movecheck == 3)
            failsafe++;
        if (failsafe > 5 && trig < 2)
            trig = 2;
    }
    if (krtrig && trig == 2)
    {
        timer = 0;
        con = 90.7;
    }
}
if (con == 90.7)
{
    timer++;
    if (timer == 5)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                setxy(304, 192);
        }
        con = 91;
        timer = 0;
    }
}
if (con == 91)
{
    snd_play(snd_item);
    obj_board_inventory.sunmoonstone = 0;
    var kris = 0;
    with (obj_mainchara_board)
    {
        if (name == "kris")
            kris = id;
    }
    kris.fun = 1;
    kris.sprite_index = kris.usprite_carry;
    sunmoonstone = instance_create(kris.x, kris.y, obj_board_marker);
    sunmoonstone.sprite_index = spr_board_sunmoonstone;
    sunmoonstone.depth = kris.depth;
    scr_darksize(sunmoonstone);
    with (sunmoonstone)
        scr_lerpvar("y", y, 120, 30, 1, "out");
    with (sunmoonstone)
        scr_lerpvar("x", x, 304, 30, 1, "out");
    snd_play_delay(snd_link_secret, 30);
    keytimer = 0;
    con++;
}
if (con == 92)
{
    keytimer++;
    if (keytimer == 70)
    {
        instance_create(sunmoonstone.x, sunmoonstone.y, obj_board_smokepuff);
        safe_delete(sunmoonstone);
        keytimer = 0;
        snd_play(snd_impact);
        dooropened = true;
        con++;
        with (obj_mainchara_board)
        {
            if (name == "kris")
            {
                controlled = true;
                fun = 0;
            }
            if (name == "ralsei")
            {
            }
        }
    }
}
if (dooropened == true)
{
    image_index = 1;
    mysolid.image_yscale = 0.1;
}
