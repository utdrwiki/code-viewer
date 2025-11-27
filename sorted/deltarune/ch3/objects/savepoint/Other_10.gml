global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;
if (room == room_dw_castle_town)
{
    if (global.plot < 200)
    {
        if (talked == 0)
        {
            nodialogue = 0;
            scr_speaker("no_name");
            msgsetloc(0, "* The castle town has transformed from the power of friendship./", "obj_savepoint_slash_Other_10_gml_41_0");
            msgnextloc("* You are filled with the power of friendship-based architecture./%", "obj_savepoint_slash_Other_10_gml_42_0");
        }
        else
        {
            nodialogue = 1;
        }
    }
    else
    {
        nodialogue = 0;
        if (global.flag[469] == 0)
        {
            global.flag[469] = 1;
            scr_speaker("no_name");
            msgsetloc(0, "* (You touched the light...)/", "obj_savepoint_slash_Other_10_gml_59_0");
            msgnextloc("* (You thought about how you \\cRcan't go back to the Cyber World\\cW anymore.)/", "obj_savepoint_slash_Other_10_gml_60_0_b");
            msgnextloc("* (You considered this carefully!)/%", "obj_savepoint_slash_Other_10_gml_61_0_b");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* After a long day^1, the town has grown once again./", "obj_savepoint_slash_Other_10_gml_50_0");
            msgnextloc("* You are filled with a certain power.../%", "obj_savepoint_slash_Other_10_gml_51_0");
        }
    }
}
if (scr_sideb_get_phase() > 0)
    nodialogue = 1;
if (scr_sideb_get_phase() == 2 && scr_havechar(4))
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* You and Noelle were filled with power./%", "obj_savepoint_slash_Other_10_gml_177_0");
}
if (scr_sideb_get_phase() == 4)
{
    if (room == room_dw_castle_town)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* After a long day^1, you have returned to the castle town./", "obj_savepoint_slash_Other_10_gml_187_0");
        msgnextloc("* But^1, you still feel the power in your hands.../%", "obj_savepoint_slash_Other_10_gml_188_0");
    }
}
if (global.chapter == 3)
{
    if (room == room_dw_couch_overworld_intro)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (A stale wind..^1. you stifle a sneeze.)/", "obj_savepoint_slash_Other_10_gml_82_0");
        msgnextloc("* (You are filled with the power of not sneezing.)/%", "obj_savepoint_slash_Other_10_gml_83_0");
    }
    else if (room == room_dw_tv_curtain)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (You hear the audience whispering in awe at your presence.)/", "obj_savepoint_slash_Other_10_gml_88_0");
        msgnextloc("* (You are filled with the power of undeserved fame.)/%", "obj_savepoint_slash_Other_10_gml_89_0");
    }
    else if (room == room_dw_green_room)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (Stars ripple on the walls like soft music.)/", "obj_savepoint_slash_Other_10_gml_95_0");
        msgnextloc("* (You're filled with the power of relaxation.)/%", "obj_savepoint_slash_Other_10_gml_96_0");
        if (global.plot >= 160)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The star pattern scrolls in an endless pattern...)/", "obj_savepoint_slash_Other_10_gml_102_0");
            msgnextloc("* (You're filled with the power of tessellation.)/%", "obj_savepoint_slash_Other_10_gml_103_0");
        }
        if (global.plot >= 280)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (After the performance^1, when all the actors have gone home...)/", "obj_savepoint_slash_Other_10_gml_110_0");
            msgnextloc("* (You feel a sense of emptiness.)/%", "obj_savepoint_slash_Other_10_gml_111_0");
        }
    }
    else if (room == room_dw_snow_zone)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (A draft blows^1, and you feel the cold night's presence.)/", "obj_savepoint_slash_Other_10_gml_117_0");
        msgnextloc("* (Still^1, this never bothered you. In fact...)/%", "obj_savepoint_slash_Other_10_gml_118_0");
        if (global.plot >= 280)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The wind blows fiercely^1, as if it fears the night itself.)/", "obj_savepoint_slash_Other_10_gml_124_0");
            msgnextloc("* (The final act draws near.)/%", "obj_savepoint_slash_Other_10_gml_125_0");
        }
        if (global.plot >= 320)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Your hand lingers in the bright light.)/", "obj_savepoint_slash_Other_10_gml_132_0");
            msgnextloc("* (The light^1, which only you can see...)/", "obj_savepoint_slash_Other_10_gml_133_0");
            msgnextloc("* (A strange calm washes over you.)/%", "obj_savepoint_slash_Other_10_gml_134_0");
        }
    }
    else if (room == room_dw_b3bs_jail1)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (You are greeted by yet another prisonlike location.)/", "obj_savepoint_slash_Other_10_gml_140_0");
        msgnextloc("* (You question why your adventures feature so many of these.)/%", "obj_savepoint_slash_Other_10_gml_141_0");
    }
    else if (room == room_dw_teevie_rhythm)
    {
        nodialogue = 0;
        var saved = false;
        var shadhere = false;
        var crowdhere = false;
        if (scr_flag_get(1147) > 0 && scr_flag_get(1147) < 20)
        {
            saved = true;
            shadhere = true;
        }
        if (scr_ch3_violencecheck() < 5)
            crowdhere = true;
        if (scr_enemylostcheck("shad"))
            shadhere = false;
        if (saved)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You hear a jazz concert only consisting of saxophones.)/", "obj_savepoint_slash_Other_10_gml_148_0");
            msgnextloc("* (You are filled with the power of everyone playing a solo at once.)/%", "obj_savepoint_slash_Other_10_gml_149_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a concert^1, but everyone that would play is working.)/", "obj_savepoint_slash_Other_10_gml_153_0");
            msgnextloc("* (You are vicariously filled with the power of all work and no play.)/%", "obj_savepoint_slash_Other_10_gml_154_0");
        }
        if (shadhere == false && crowdhere == true)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a concert^1, but no one is here to play.)/", "obj_savepoint_slash_Other_10_gml_178_0");
            msgnextloc("* (You are filled with the power of a crowd cheering for no one.)/%", "obj_savepoint_slash_Other_10_gml_179_0");
        }
        if (crowdhere == false && shadhere == false)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a concert^1, but no one has shown up.)/", "obj_savepoint_slash_Other_10_gml_187_0_b");
            msgnextloc("* (You question if a concert can be a concert if no one is there.)/%", "obj_savepoint_slash_Other_10_gml_188_0_b");
        }
    }
    else if (room == room_dw_teevie_chef)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (The incense of hot snacks and spicy flavors assaults you.)/", "obj_savepoint_slash_Other_10_gml_160_0");
        msgnextloc("* (You are filled with the power of the primal invention of fire.)/%", "obj_savepoint_slash_Other_10_gml_161_0");
    }
}
myinteract = 3;
if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);
talked += 1;
snd_play(snd_power);
for (i = 0; i < 5; i += 1)
{
    if (global.hp[i] < global.maxhp[i])
        global.hp[i] = global.maxhp[i];
}
