with (obj_darkcontroller)
    charcon = 0;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_index = 1;
if (!is_opened)
{
    is_opened = true;
    open_chest = true;
}
else
{
    scr_speaker("no_name");
    msgsetloc(0, "* (It's pointless.)/%", "obj_dw_treasure_points_slash_Other_10_gml_20_0");
    myinteract = 3;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    talked += 1;
}
