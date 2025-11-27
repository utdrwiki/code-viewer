con = -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 90000;
blackall.image_alpha = 1;
create_writer = false;
speech[0] = stringsetloc("In the Light World^1, in reality.../%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_14_0");
speech[1] = stringsetloc("Lancer is just an average playing card./%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_15_0");
speech[2] = stringsetloc("Queen..^1. is just a laptop./%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_16_0");
speech[3] = stringsetloc("In other words..^1. when the lights come back on.../%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_17_0");
speech[4] = stringsetloc("This world is no longer \"real\"./%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_18_0");
speech[5] = stringsetloc("The places you go^1, the people you meet..^1. none of them are./%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_19_0");
speech[6] = stringsetloc("Even I^1, the one telling you this..^1. I too^1, am...^3^1%%", "obj_ch3_PGS01E_hallway_slash_Create_0_gml_20_0");
speech_index = 0;
if (global.plot < 45)
    con = 0;
else
    instance_destroy();
