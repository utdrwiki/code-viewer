if (i_ex(obj_mainchara) && i_ex(watercooler))
{
    if (obj_mainchara.x > 1080 && obj_mainchara.y > 840)
        watercooler.visible = true;
    else
        watercooler.visible = false;
}
if (doorcon == 0)
{
    if (global.flag[1103] != 0 && !d_ex())
    {
        safe_delete(block);
        safe_delete(black);
        snd_play(snd_locker);
        scr_shakescreen();
        doorcon = 99;
    }
}
if (con == 0)
{
    if (stealth.alert == 2)
    {
        con = 1;
        timer = 0;
    }
}
if (con == 1)
{
    headct[0] = 0;
    var headrange = 50;
    var tag = "";
    with (obj_mainchara)
    {
        var region = instance_place(x, y, obj_b3bs_stealthSolid);
        if (i_ex(region))
        {
            tag = region.extflag;
            debug_print("tag=" + tag);
        }
    }
    zone = tag;
    with (obj_dw_ch3_b3bs_zapperhead)
    {
        if (extflag == tag)
        {
            if (x > (camerax() + headrange) && x < ((camerax() + 640) - headrange))
                array_push(other.headct, id);
        }
    }
    array_delete(headct, 0, 1);
    show_debug_message(string(headct));
    head = headct[irandom_range(0, array_length(headct) - 1)];
    zapper = scr_dark_marker(head.x + 64, head.y - 36, spr_zapper_jump_noshadow);
    with (zapper)
        scr_lerpvar("image_index", 0, 4, 7);
    zapper.vspeed = -36;
    zapper.gravity = 2;
    zapper.image_xscale = -2;
    zapper.image_blend = c_black;
    scr_lerp_imageblend(zapper, c_black, c_white, 8, 2, "out");
    snd_play(snd_jump);
    var desxloc = obj_mainchara.x - 48;
    if (head.x > (obj_mainchara.x + 17))
    {
        desxloc = obj_mainchara.x + 90;
        zapper.image_xscale = 2;
        zapper.x -= 92;
    }
    with (zapper)
        scr_lerpvar("x", x, desxloc, 30, 2, "out");
    safe_delete(head);
    con = 2;
}
var groundpos = scr_even(obj_mainchara.y - 60);
if (con == 2)
{
    if (zapper.y < groundpos)
        con = 3;
}
if (con == 3)
{
    if (zapper.y >= groundpos)
    {
        zapper.y = groundpos;
        zapper.image_index = 7;
        with (zapper)
            scr_delay_var("image_index", 8, 4);
        zapper.gravity = 0;
        zapper.vspeed = 0;
        zapper.depth = obj_mainchara.depth;
        snd_play(snd_wing);
        con = 4;
    }
}
if (con == 4)
{
    scr_speaker("zapper");
    msgsetloc(0, "* What the -- you's ain't allowed in here!/%", "obj_b3bs_watercooler_slash_Step_0_gml_25_0");
    d_make();
    con = 5;
}
if (con == 5 && !d_ex())
{
    switch (zone)
    {
        case "topleft":
            global.flag[1126]++;
            break;
        case "topright":
            global.flag[1127]++;
            break;
        case "botleft":
            global.flag[1128]++;
            break;
        case "hard1":
            global.flag[1129]++;
            break;
        case "hard2":
            global.flag[1130]++;
            break;
    }
    change = instance_create(x, y, obj_tvturnoff_manager);
    change.kind = 1;
    change.roomtarg = 180;
    change.entrance = 8;
    con = 6;
}
if (watercon == 0)
{
    var trig = 0;
    with (watertrig)
    {
        if (place_meeting(x, y, obj_mainchara) || myinteract == 3)
            trig = true;
    }
    if (trig)
        watercon = 1;
}
if (watercon == 1)
{
    watertimer++;
    if (watertimer == 1)
    {
        snd_play_x(snd_b, 1, 0.8);
        with (watercooler)
        {
            excl = instance_create(x + (sprite_width / 2), y - 20, obj_excblcon);
            scr_doom(excl, 20);
        }
        global.interact = 1;
    }
    if (watertimer == 35)
    {
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 8, 1, 1.1);
    }
    if (watertimer == 65)
    {
        watercooler.depth = -1;
        scr_battle(139, 0, watercooler);
        watercon = 2;
        watertimer = 0;
    }
}
if (stealthend == 0)
{
    if (global.flag[1138] == 1 && !d_ex())
        stealthend = 1;
}
if (stealthend == 1)
{
    with (obj_b3bs_stealtharea)
        instance_destroy();
    with (obj_b3bs_stealthSolid)
        instance_destroy();
    with (obj_dw__backstagelight)
        instance_destroy();
    stealthend = 2;
}
