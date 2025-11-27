global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;
global.currentroom = room;
if (global.darkzone == 0 && global.flag[1664] == 0)
{
    global.flag[1664] = 1;
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (You could barely see it^1. A patch of sunlight that shouldn't be there.)/", "obj_savepoint_slash_Other_10_gml_20_0_b");
    msgnextloc("* (It felt different in your hand^1. And you knew what it was.)/%", "obj_savepoint_slash_Other_10_gml_21_0_b");
}
if (room == room_dw_castle_town)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Once again you find yourself in a familiar town.)/", "obj_savepoint_slash_Other_10_gml_20_0");
    msgnextloc("* (You are filled with the power of conspicuously normal music.)/%", "obj_savepoint_slash_Other_10_gml_21_0");
    var recruited_all = scr_recruited_all_previous();
    if (recruited_all)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Funky music emerges from the cafe and fills the town.)/", "obj_savepoint_slash_Other_10_gml_27_0");
        msgnextloc("* (You are filled with the power of funky town.)/%", "obj_savepoint_slash_Other_10_gml_28_0");
    }
    if (scr_sideb_active())
        nodialogue = 1;
}
if (room == room_dw_church_intro1)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The scent of glass and incense.)/", "obj_savepoint_slash_Other_10_gml_42_0_b");
    msgnextloc("* (A certain power steels within you.)/%", "obj_savepoint_slash_Other_10_gml_43_0");
}
if (room == room_dw_church_savepoint)
{
    if (scr_flag_get(835) == 0)
    {
        scr_flag_set(835, 1);
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (A glass tapestry rings above you. Strangely^1, no matter how you turn to look...)/", "obj_savepoint_slash_Other_10_gml_55_0");
        msgnextloc("* (..^1. its perspective never changes.)/%", "obj_savepoint_slash_Other_10_gml_56_0");
    }
}
if (room == room_dw_church_ripplepuzzle_postgers)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The old man's existence made you imagine Ralsei with a beard.)/", "obj_savepoint_slash_Other_10_gml_64_0");
    msgnextloc("* (You are filled with the power of conceptual bearded Ralsei.)/%", "obj_savepoint_slash_Other_10_gml_65_0");
    if (scr_sideb_active())
        nodialogue = 1;
}
if (room == room_dw_church_gersonstudy)
{
    nodialogue = 0;
    if (scr_flag_get(1600) == 0)
    {
        scr_flag_set(1600, 1);
        scr_speaker("no_name");
        msgsetloc(0, "* (The hearth glows brightly^1, pressing the night's chill away.)/", "obj_savepoint_slash_Other_10_gml_83_0_b");
        msgnextloc("* (You are filled with a certain power.)/%", "obj_savepoint_slash_Other_10_gml_84_0");
    }
    else if (scr_flag_get(1600) == 1 && scr_flag_get(1548) == 0 && global.plot < 242)
    {
        scr_flag_set(1600, 2);
        scr_speaker("no_name");
        msgsetloc(0, "* (The hearth glows brightly^1, lighting up the mural above it...)/", "obj_savepoint_slash_Other_10_gml_94_0");
        msgnextloc("* (..^1. You are filled with the power of checkable murals.)/%", "obj_savepoint_slash_Other_10_gml_95_0_b");
        if (scr_sideb_active())
            nodialogue = 1;
    }
    else
    {
        nodialogue = 1;
    }
}
if (room == room_dw_church_nwconnect)
{
    if (scr_flag_get(1601) == 0)
    {
        scr_flag_set(1601, 1);
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (Stacks of books^1, with characters that cannot be read...)/", "obj_savepoint_slash_Other_10_gml_117_0_b");
        msgnextloc("* (You are filled with the power of not actually reading the text.)/%", "obj_savepoint_slash_Other_10_gml_118_0_b");
        if (scr_sideb_active())
            nodialogue = 1;
    }
}
if (room == room_dw_church_pianopuzzle)
{
    if (scr_flag_get(1602) == 0)
    {
        scr_flag_set(1602, 1);
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (Down the corridor^1, darkness lies in wait...)/", "obj_savepoint_slash_Other_10_gml_136_0");
        msgnextloc("* (Shining only in your own eyes^1, the light defies it.)/%", "obj_savepoint_slash_Other_10_gml_137_0");
    }
}
if (room == room_dw_churchb_staircaseintro)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The lighting has changed.)/%", "obj_savepoint_slash_Other_10_gml_145_0");
}
if (room == room_dw_churchb_savepoint)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The lighting has changed.)/", "obj_savepoint_slash_Other_10_gml_152_0");
    msgnextloc("* (But the power that fills you^1, has not.)/%", "obj_savepoint_slash_Other_10_gml_153_0_b");
}
if (room == room_dw_churchb_gersonstudy)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The fire has run empty. In its place...)/", "obj_savepoint_slash_Other_10_gml_160_0_b");
    msgnextloc("* (..^1. a stale glow^1, which offers no warmth.)/%", "obj_savepoint_slash_Other_10_gml_161_0_b");
}
if (room == room_dw_churchc_superprophecies)
{
    if (scr_flag_get(1603) == 0)
    {
        scr_flag_set(1603, 1);
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (All around you^1, blue glass glitters like crystals.)/", "obj_savepoint_slash_Other_10_gml_172_0");
        msgnextloc("* (As you approach it^1, the glowing light shines through them...)/", "obj_savepoint_slash_Other_10_gml_173_0");
        msgnextloc("* (..^1. creating a prism only you can see.)/%", "obj_savepoint_slash_Other_10_gml_174_0");
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
