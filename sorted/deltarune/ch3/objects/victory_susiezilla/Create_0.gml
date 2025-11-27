con = 0;
depth = 6000;
global.typer = 80;
msgsetloc(0, "No TVs were harmed in the&making of this minigame.", "obj_victory_susiezilla_slash_Create_0_gml_8_0");
writer = instance_create(camerax() + 120, (cameray() + (view_hport[0] / 2)) - 40, obj_writer);
writer.mycolor = c_white;
writer.depth = depth - 10;
