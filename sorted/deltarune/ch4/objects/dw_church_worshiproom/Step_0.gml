var version = 0;
if (room == room_dw_churchb_worshiproom)
    version = 1;
var notalking = false;
if (instance_exists(obj_dw_church_organikchaser) || global.fighting)
    notalking = true;
if (init == 0)
{
    with (obj_trigger_interact)
        strict = 1;
    init = 1;
}
var trigint = 0;
if (global.interact == 0)
{
    with (obj_trigger_interact)
    {
        if (extflag == "wafer")
        {
            if (notalking)
                myinteract = 0;
            if (myinteract == 3)
                trigint = 1;
        }
    }
}
if (tcon == 0)
{
    if (trigint == 1)
    {
        tcon = 1;
        global.interact = 1;
        scr_speaker("no_name");
        if (read == 0)
        {
            msgsetloc(0, "* Shh!/", "obj_dw_church_worshiproom_slash_Step_0_gml_33_0");
            msgnextloc("* This is a statue of our holy ancestor./", "obj_dw_church_worshiproom_slash_Step_0_gml_34_0");
            msgnextloc("* A shame we could not meet.../", "obj_dw_church_worshiproom_slash_Step_0_gml_35_0");
            msgnextloc("* What brilliant sermon of peace might we have heard?/%", "obj_dw_church_worshiproom_slash_Step_0_gml_36_0");
        }
        else
        {
            msgsetloc(0, "* Our holy ancestor...!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_41_0");
        }
        if (version == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* The statue stands in reverence./%", "obj_dw_church_worshiproom_slash_Step_0_gml_47_0");
        }
        if (global.plot >= 242)
        {
            if (global.flag[encounterflag] != 1)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Where is our great ancestor!?/", "obj_dw_church_worshiproom_slash_Step_0_gml_55_0");
                msgnextloc("* This babbling fool must have done something...!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_56_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Oh^1, what a tragedy. Our great ancestor has disappeared!/", "obj_dw_church_worshiproom_slash_Step_0_gml_61_0");
                msgnextloc("* The scourge that committed this crime should suffer!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_62_0");
            }
            if (read)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Begone^1! Begone!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_68_0");
            }
        }
        read++;
        d_make();
    }
}
if (tcon == 1 && !d_ex())
{
    global.interact = 0;
    tcon = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "wafer")
            myinteract = 0;
    }
}
if (organtriggerint.myinteract == 3 && econ == 0)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (It's some kind of statue.)/%", "obj_dw_church_worshiproom_slash_Step_0_gml_89_0");
    if (version == 1)
    {
        organicstatue.sprite_index = spr_npc_organik_0_talk_differentrobe;
        scr_speaker("no_name");
        msgsetloc(0, "* What are you doing?/", "obj_dw_church_worshiproom_slash_Step_0_gml_96_0");
        msgnextloc("* I'm trying to protect these statues of my ancestors!/", "obj_dw_church_worshiproom_slash_Step_0_gml_97_0");
        msgnextloc("* A shame I could not meet them./", "obj_dw_church_worshiproom_slash_Step_0_gml_98_0");
        msgnextloc("* They must've been brilliant.../", "obj_dw_church_worshiproom_slash_Step_0_gml_99_0");
        msgnextloc("* ..^1. unlike the rest of the brutes and barbarians around here./%", "obj_dw_church_worshiproom_slash_Step_0_gml_100_0");
        if (organtriggerint.talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* If only these brutes had more filial piety!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_105_0");
        }
    }
    if (global.plot >= 242)
    {
        scr_speaker("no_name");
        scr_speaker("no_name");
        msgsetloc(0, "* Oh^1, talking archaeology^1! It was easier to worship the placid stone./", "obj_dw_church_worshiproom_slash_Step_0_gml_113_0");
        msgnextloc("* Still^1, if my ancestors want to \"kick my ass\"^1, I must simply allow it./%", "obj_dw_church_worshiproom_slash_Step_0_gml_114_0");
        if (organtriggerint.talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* They said they know what an acorn is. That's no good./", "obj_dw_church_worshiproom_slash_Step_0_gml_118_0");
            msgnextloc("* If you know^1, it means you can't ask what it is!/%", "obj_dw_church_worshiproom_slash_Step_0_gml_119_0");
        }
    }
    organtriggerint.myinteract = 4;
    global.interact = 1;
    organtriggerint.talked++;
    d_make();
}
if (organtriggerint.myinteract == 4 && d_ex())
{
    var trig = 0;
    if (!i_ex(obj_writer))
        trig = 1;
    with (obj_writer)
    {
        if (halt)
            trig = 1;
    }
    if (!trig)
        organicstatue.image_index += 0.25;
}
if (organtriggerint.myinteract == 4 && !d_ex())
{
    organicstatue.image_index = 0;
    global.interact = 0;
    organtriggerint.myinteract = 0;
}
if (econ == 1)
{
    var trig = 0;
    with (obj_mainchara)
    {
        if (y <= 310)
            trig = 1;
    }
    if (trig)
    {
        econ = 2;
        enemy = instance_create(enemarker.x, enemarker.y, obj_dw_church_organikchaser);
        enemy.encounterflag = encounterflag;
        enemy.encounterno = encounterno;
        enemarker.visible = false;
    }
}
if (econ == 2)
{
    if (enemy.con == 2)
    {
        music.pause = 1;
        econ = 4;
    }
}
if (econ == 3)
{
    timer++;
    if (timer == 1)
    {
        music.pause = 1;
        snd_play(snd_tensionhorn);
        snd_play_delay(snd_tensionhorn, 10, undefined, 1.1);
    }
    if (timer == 25)
    {
        global.flag[54] = encounterflag;
        enemarker.depth = 5000;
        scr_battle(encounterno, 0, enemarker);
        econ = 4;
    }
}
if (econ == 4)
{
    if (global.fighting)
    {
        debug_print("econ=5");
        econ = 5;
    }
}
if (econ == 5)
{
    if (global.flag[encounterflag] != 0)
    {
        debug_print("econ=6");
        if (global.flag[encounterflag] != 1)
        {
            with (organicstatue)
            {
                sprite_index = spr_npc_organik_0_talk_differentrobe;
                setxy(xstart, ystart);
                scr_depth();
            }
            with (organtriggerint)
            {
                setxy(xstart, ystart);
                if (place_meeting(x, y, obj_mainchara))
                {
                    setxy(obj_mainchara.x, 246, 1049);
                    scr_caterpillar_interpolate("all");
                }
            }
            if (global.flag[encounterflag] == 1)
            {
                with (organicstatue)
                    setxy(room_width * 2, room_height);
                with (organtriggerint)
                    setxy(room_width * 2, room_height);
            }
        }
        econ = 6;
    }
}
if (econ == 6)
{
    if (!i_ex(obj_battleback))
    {
        debug_print("econ=7");
        music.resume = 1;
        econ = 0;
    }
}
