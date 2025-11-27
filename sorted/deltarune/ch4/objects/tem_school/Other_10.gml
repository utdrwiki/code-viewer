global.msc = 0;
global.typer = 5;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;
if (global.chapter == 4)
{
    scr_speaker("no_name");
    msgsetloc(0, "* Tem study harb..^1. Tem learn.../", "obj_tem_school_slash_Other_10_gml_85_0");
    msgnextloc("* Tem learn how to SING!!!/%", "obj_tem_school_slash_Other_10_gml_86_0");
    song_mode = true;
}
myinteract = 3;
mydialoguer = instance_create(0, 0, obj_dialoguer);
if (global.darkzone == 1)
    image_speed = 0.1;
talked += 1;
