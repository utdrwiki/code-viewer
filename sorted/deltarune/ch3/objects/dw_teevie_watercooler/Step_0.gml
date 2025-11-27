if (curcon == 0)
{
    if (curtain.myinteract == 3)
    {
        var contogoto = 1;
        scr_speaker("no_name");
        if (global.flag[1144] == 0)
        {
            msgsetloc(0, "* (Someone is behind the curtain..^1. silently.)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_16_0");
            d_make();
        }
        else
        {
            contogoto = 2;
        }
        curcon = contogoto;
        global.interact = 1;
    }
}
if (curcon == 1 && !d_ex())
{
    curcon = 0;
    curtain.myinteract = 0;
    with (obj_writer_stay)
        instance_destroy();
    global.interact = 0;
}
if (curcon == 2)
    curcon = 3;
if (curcon == 3)
{
    global.flag[1146] = 1;
    scr_speaker("no_name");
    if (global.flag[1144] == 1)
    {
        msgsetloc(0, "* (Someone was watching you flirt with the watercooler.)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_49_0");
        msgnextloc("* How nice..^1. her water..^1. was always so nourishing..^1. wasn't it.../", "obj_dw_teevie_watercooler_slash_Step_0_gml_50_0");
        msgnextloc("* She..^1. was so brave..^1. to put herself out there like that./", "obj_dw_teevie_watercooler_slash_Step_0_gml_51_0");
        msgnextloc("* I'm sure you two..^1. will be..^1. very happy together.../", "obj_dw_teevie_watercooler_slash_Step_0_gml_52_0");
        msgnextloc("* (But^1, something about the words sounded sad.)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_53_0");
        global.flag[1144] = 3;
    }
    else if (global.flag[1144] == 2)
    {
        msgsetloc(0, "* (Someone was watching you fight the watercooler...)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_59_0");
        msgnextloc("* (They seem relieved you didn't flirt with it.)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_60_0");
    }
    else if (global.flag[1144] == 3)
    {
        msgsetloc(0, "* (...)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_64_0");
    }
    d_make();
    curcon = 4;
}
if (curcon == 4 && !d_ex())
{
    curcon = 0;
    with (obj_writer_stay)
        instance_destroy();
    global.interact = 0;
    curtain.myinteract = 999;
}
if (watercon == 0)
{
    var trig = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "watercooler")
        {
            if (place_meeting(x, y, obj_mainchara) || myinteract == 3)
            {
                other.des = id;
                trig = true;
            }
        }
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
        with (des)
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
        des.depth = -1;
        global.flag[54] = encounterflag;
        scr_battle(139, 0, des);
        global.flag[1143] = 50;
        watercon = 2;
        watertimer = 0;
        treasure2 = instance_create(treasure.x, treasure.y, obj_trigger_interact);
        treasure2.sprite_index = spr_treasurebox;
        treasure2.visible = true;
        treasure2.issolid = true;
        scr_darksize(treasure2);
        scr_depth(treasure2);
        trcon2 = 0;
        trtimer2 = 0;
        watermarker = 0;
        treasure.x = -9999;
        watercon = 999;
        trcon = 3;
        scr_delay_var("cleanup", 1, 120);
    }
}
if (cleanup == 1)
{
    cleanup = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "watercooler")
            instance_destroy();
    }
}
if (spikecon == 0 && fakespikes.myinteract == 3)
{
    global.interact = 1;
    spikecon = 1;
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a cardboard prop of spikes.)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_166_0");
    msgnextloc("* (It's not blocking the way at all.)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_167_0");
    d_make();
}
if (spikecon == 1 && !d_ex())
{
    spikecon = 0;
    fakespikes.myinteract = 0;
    with (obj_writer_stay)
        instance_destroy();
    global.interact = 0;
}
var youopened = stringsetloc("* (You opened the treasure chest.)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_181_0");
if (trcon == 0 && treasure.myinteract == 3)
{
    global.interact = 1;
    trcon = 1;
    treasure.image_index = 1;
    snd_play(snd_locker);
    scr_speaker("no_name");
    msgset(0, youopened);
    msgnextloc("* (Inside the treasure chest^1, there was a WATERCOOLER!)", "obj_dw_teevie_watercooler_slash_Step_0_gml_192_0");
    d_make();
}
if (trcon == 1)
{
    if (scr_getmsgno() == 1)
    {
        if (obj_writer.reachedend == 1)
        {
            trtimer = 0;
            trcon = 2;
        }
    }
}
if (trcon == 2)
{
    trtimer++;
    if (trtimer == 1)
    {
        snd_play(snd_item);
        watermarker = scr_dark_marker(80, 220, spr_watercooler);
    }
    if (trtimer == 60)
    {
        watermarker.depth = -1;
        global.flag[54] = encounterflag;
        scr_battle(139, 0, watermarker);
        global.flag[1143] = 50;
        watercon = 2;
        watertimer = 0;
        k_d();
    }
    if (trtimer == 120)
    {
        watercon = 999;
        with (obj_trigger_interact)
        {
            if (extflag == "watercooler")
                instance_destroy();
        }
        treasure.myinteract = 0;
        treasure2 = instance_create(320, 294, obj_trigger_interact);
        treasure2.sprite_index = spr_treasurebox;
        treasure2.visible = true;
        treasure2.issolid = true;
        scr_darksize(treasure2);
        scr_depth(treasure2);
        trcon2 = 0;
        trtimer2 = 0;
        watermarker = 0;
        trcon = 3;
    }
}
if (trcon == 3)
{
    var treasureline = stringsetloc("* (The chest is empty.)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_249_0");
    if (treasure.myinteract == 3)
    {
        msgset(0, treasureline);
        d_make();
        trcon = 4;
        global.interact = 1;
    }
    if (treasure2.myinteract == 3)
    {
        treasure2.image_index = 1;
        if (global.flag[1145] == 0)
        {
            snd_play(snd_impact);
            global.interact = 1;
            trcon = 8;
        }
        else if (global.flag[1145] == 1)
        {
            snd_play(snd_impact);
            global.interact = 1;
            trcon = 8.1;
        }
        else
        {
            global.interact = 1;
            msgset(0, treasureline);
            d_make();
            trcon = 4;
        }
    }
}
if (trcon == 8)
{
    snd_play(snd_impact);
    scr_speaker("no_name");
    msgsetloc(0, "* (Inside the treasure chest...)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_288_0");
    msgnextloc("* (.. there was another \\cBWATERCOOLER\\cW!)/", "obj_dw_teevie_watercooler_slash_Step_0_gml_289_0");
    msgnextloc("* (But^1, there was also \\cY500 POINTs\\cW)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_290_0");
    with (d_make())
        stay = 30;
    trcon = 9;
}
if (trcon == 8.1)
{
    msgset(0, youopened);
    msgnextloc("* (inside was \\cY500 POINTs\\cW!)/%", "obj_dw_teevie_watercooler_slash_Step_0_gml_298_0");
    with (d_make())
        stay = 30;
    trcon = 11;
}
if (trcon == 9)
{
    if (scr_getmsgno() == 1)
    {
        trcon = 10;
        watermarker = scr_marker(treasure2.x, treasure2.y - 60, spr_watercooler);
        scr_darksize(watermarker);
        watermarker.depth = treasure2.depth - 1;
    }
}
if (trcon == 10)
{
    if (scr_getmsgno() == 2)
    {
        trcon = 11;
        safe_delete(watermarker);
    }
}
if (trcon == 11 && !d_ex())
{
    var itemgetstring = scr_itemget_anytype_text(500, "points");
    msgset(0, itemgetstring);
    trcon = 4;
    d_make();
    if (noroom == 1)
    {
        close = true;
        global.flag[1145] = 1;
    }
    else
    {
        global.flag[1145] = 2;
    }
}
if (trcon == 4 && !d_ex())
{
    if (close == true)
    {
        with (treasure2)
            image_index = 0;
        close = false;
    }
    trcon = 3;
    treasure.myinteract = 0;
    treasure2.myinteract = 0;
    with (obj_writer_stay)
        instance_destroy();
    global.interact = 0;
}
