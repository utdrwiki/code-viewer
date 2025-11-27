myinteract = 3;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fe = 0;
global.fc = 0;
global.interact = 1;
with (obj_darkcontroller)
    charcon = 0;
global.msg[0] = stringsetloc("* Suddenly^1, your body seizes up^1.&* What are you looking at?/%", "obj_readable_room1_slash_Other_10_gml_13_0");
if (scr_debug())
    global.msg[0] = stringset("* [NUBERT TEXT] (obj_readable_room1)/%");
scr_speaker("no_name");
msgsetloc(0, "* When someone gets hurt^1, Nubert gets hurt^1, too./", "obj_readable_nubert_slash_Other_10_gml_22_0");
msgnextloc("* Let your heart look like me. Red^1, smiling./%", "obj_readable_nubert_slash_Other_10_gml_23_0");
if (scr_flag_get(1531) == 0)
{
    scr_flag_set(1531, 1);
    scr_speaker("no_name");
    msgsetloc(0, "* You've been sparin' all Nubert's friends./", "obj_readable_nubert_slash_Other_10_gml_30_0");
    msgnextloc("* Now they're your friends^1, too./", "obj_readable_nubert_slash_Other_10_gml_31_0");
    msgnextloc("* That's good. When you spare people^1, this world moves up./", "obj_readable_nubert_slash_Other_10_gml_32_0");
    msgnextloc("* ..^1. Nubert moves up too./%", "obj_readable_nubert_slash_Other_10_gml_33_0");
}
if (skip == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);
read += 1;
if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
